# Body Fat and SMM Implementation Plan

## Goal

Add support for two special targets:

- Body Fat
- Skeletal Muscle Mass (SMM)

These targets differ from the current normal metric-unit flow because:

- They can be entered and displayed as `%`, `kg`, or `lbs`.
- Canonical storage remains `%`.
- Converting `%` to `kg` or `lbs` requires same-day body weight.
- Estimated entries are auto-generated and stored alongside manual entries.

This document assumes:

- Old local data can be discarded.
- Goal logic must use manual entries only by default.
- Estimated entries are additive and must never overwrite manual entries.
- Estimation runs only when all required inputs are available.
- Estimation cadence is an 8-day calendar bucket.

## Product Rules

### Targets

1. Keep the existing Body Fat target.
2. Add a new SMM target.
3. Both targets support `%`, `kg`, and `lbs` in UI.
4. Both targets store canonical values in `%`.

### Sources

Each measurement row must have a source:

- `manual`
- `estimated_formula`

Each row should also store a method:

- `manual_entry`
- `navy_bf_v1`
- `smm_from_lean_v1`

### Conversion Rules

#### Body Fat

- Canonical storage: body fat `%`
- Display/input units: `%`, `kg`, `lbs`
- Conversion from `%` to mass uses same-day body weight:

```text
fat_mass_kg = body_weight_kg * (body_fat_percent / 100)
fat_mass_lbs = fat_mass_kg * 2.20462262
```

#### SMM

- Canonical storage: SMM `%`
- Display/input units: `%`, `kg`, `lbs`
- Estimate pipeline:

```text
fat_mass_kg = body_weight_kg * (body_fat_percent / 100)
lean_mass_kg = body_weight_kg - fat_mass_kg
smm_kg = lean_mass_kg * 0.55
smm_percent = (smm_kg / body_weight_kg) * 100
```

### Same-Day Body Weight Requirement

For Body Fat and SMM, same-day body weight is mandatory whenever the user enters or views values in `kg` or `lbs`.

Product rule:

1. If same-day weight already exists, reuse it.
2. If same-day weight does not exist, require the user to add body weight in the same flow.
3. If the user enters `%`, body weight is still required if they want mass conversion shown later.
4. To keep behavior consistent, special measurement entry should ensure weight exists for that date before completing save.

## Why Existing Metric Unit Flow Is Not Enough

The current `metric_units` table only supports direct factor-based conversion.

That works for:

- `kg <-> lbs`
- `cm <-> inch`

It does not fully model Body Fat or SMM because:

- `% -> kg/lbs` depends on another target value, body weight.
- This is a contextual conversion, not a pure unit conversion.

Conclusion:

- Keep `metric_units` for normal factor-based units.
- Add special-case domain logic for Body Fat and SMM conversion.

## Database Changes

File: `lib/data/services/database_service.dart`

### 1. Bump Database Version

Increase `_databaseVersion` and use destructive upgrade behavior because old data does not need to be preserved.

### 2. Measurements Table

Add fields to `measurementsData`:

- `source TEXT NOT NULL DEFAULT 'manual' CHECK(source IN ('manual', 'estimated_formula'))`
- `method TEXT NOT NULL DEFAULT 'manual_entry'`
- `estimate_bucket_key TEXT DEFAULT NULL`

Recommended final shape:

```sql
CREATE TABLE measurementsData (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  value REAL NOT NULL CHECK (value > 0),
  date TEXT NOT NULL,
  target_id INTEGER NOT NULL,
  notes TEXT DEFAULT NULL,
  source TEXT NOT NULL DEFAULT 'manual' CHECK(source IN ('manual', 'estimated_formula')),
  method TEXT NOT NULL DEFAULT 'manual_entry',
  estimate_bucket_key TEXT DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY(target_id) REFERENCES measurement_targets(id)
)
```

### 3. Unique Index for Estimated Entries

Only one estimated entry per user, target, and 8-day bucket should exist.

```sql
CREATE UNIQUE INDEX IF NOT EXISTS idx_measurements_estimate_bucket_unique
ON measurementsData (user_id, target_id, source, estimate_bucket_key)
WHERE source = 'estimated_formula'
```

### 4. Seed Target Data

Keep:

- `body_fat_percentage`

Add:

- `skeletal_muscle_mass`

Suggested target row:

```text
('Skeletal Muscle Mass', 'skeletal_muscle_mass', 'body', 'composition', 35)
```

### 5. Target Metric Mapping

Map both Body Fat and SMM to the percentage-style metric family.

Simplest approach:

1. Keep Body Fat linked to `body_fat_percentage`.
2. Add a new metric for SMM percentage, for example `skeletal_muscle_mass_percentage` with base `%`.

This keeps target-to-metric mapping semantically clean.

## Destructive Upgrade Strategy

File: `lib/data/services/database_service.dart`

Because the app is unreleased, destructive upgrade is acceptable.

On database version upgrade:

1. Drop all app tables in dependency-safe order.
2. Recreate schema by calling the same create/seed logic used in `onCreate`.

Drop order should include:

- `picture_targets`
- `pictures`
- `tags`
- `measurement_goals`
- `measurementsData`
- `user_settings`
- `user_unit_preferences`
- `target_metrics`
- `measurement_targets`
- `metric_units`
- `metrics`
- `users`

## Domain Model Changes

### Measurement Entity

File: `lib/domain/measurement/models/measurement_entity.dart`

Add fields:

- `source`
- `method`
- `estimateBucketKey`

Defaults for manual save:

- `source = manual`
- `method = manual_entry`

### Measurement Model

File: `lib/domain/measurement/models/measurement_model.dart`

Add fields returned from repository queries:

- `source`
- `method`
- `estimateBucketKey`

These fields will be needed for:

- chart filtering
- chart styling
- source badges in measurement lists
- manual-only goal behavior

## Repository Changes

File: `lib/data/repositories/measurement_repository.dart`

### 1. Create and Update Writes

Persist `source`, `method`, and `estimate_bucket_key` on insert/update.

### 2. Read Queries

Every query that returns measurements should include:

- `m.source`
- `m.method`
- `m.estimate_bucket_key`

This affects at least:

- `getAllMeasurementsByDate`
- `getLatestThreeMeasurements`
- `getOverviewWidgetsData`
- `getMeasurementsByTarget`
- any date comparison queries that need source-aware behavior later

### 3. Goal Matching

Manual entries only must drive goal completion.

Update `_completeGoalIfMeasurementMatchesTarget()` so it returns early when:

- `measurement.source != 'manual'`

### 4. Source-Aware Fetch API

Add a source filter for chart/detail reads.

Suggested enum:

```dart
enum MeasurementSourceFilter { manual, estimated, both }
```

Then update `getMeasurementsByTarget()` to accept:

```dart
MeasurementSourceFilter sourceFilter = MeasurementSourceFilter.both
```

## Estimator Service

Create a dedicated estimator service instead of embedding this logic inside widgets or repository write methods.

Suggested new file:

- `lib/data/services/body_composition_estimator_service.dart`

### Responsibilities

1. Check whether required measurements exist.
2. Build current 8-day bucket key.
3. Compute estimated Body Fat.
4. Compute estimated SMM.
5. Insert estimated rows when missing for current bucket.

### Inputs for Body Fat Estimate

#### Men

Need:

- gender
- height
- waist
- neck

#### Women

Need:

- gender
- height
- waist
- neck
- hips

### Body Fat Formula

Use US Navy formula in canonical length unit.

Men:

```text
BF% = 86.010 * log10(waist - neck) - 70.041 * log10(height) + 36.76
```

Women:

```text
BF% = 163.205 * log10(waist + hip - neck) - 97.684 * log10(height) - 78.387
```

### SMM Estimate

After BF% is known and same-day weight exists:

```text
fat_mass_kg = body_weight_kg * (body_fat_percent / 100)
lean_mass_kg = body_weight_kg - fat_mass_kg
smm_kg = lean_mass_kg * 0.55
smm_percent = (smm_kg / body_weight_kg) * 100
```

### Bucket Strategy

Use calendar-based 8-day buckets.

Example concept:

- days 1-8 -> bucket 1
- days 9-16 -> bucket 2
- days 17-24 -> bucket 3
- days 25-end -> bucket 4

Bucket key example:

```text
2026-04-b2
```

### Trigger Rules

Run estimator after saves affecting required inputs:

- weight
- height
- waist
- neck
- hips
- body fat manual entry (for SMM estimate)

Only generate estimate when:

1. all required inputs are available
2. values pass formula validation
3. no estimated row exists for current target and current 8-day bucket

Estimated entries are additive.

Manual entries are never updated or replaced.

## UI Strategy

## Modal Strategy

Current generic modals:

- `lib/presentation/add_data_modal/add_data_modal.dart`
- `lib/presentation/add_initial_measurement_data/add_initial_measurement_data_modal.dart`

These work for direct unit-factor conversions but are not enough for Body Fat and SMM because those flows may need body weight in the same save session.

### Recommendation

Do not keep forcing the generic modal to own special logic inline.

Preferred approach:

1. Keep existing generic modal behavior for normal targets.
2. Route Body Fat and SMM to a dedicated special-entry modal.

Suggested new files:

- `lib/presentation/body_composition/body_composition_entry_modal.dart`
- optionally a shared helper widget for same-day weight capture

### Why a Dedicated Modal Is Better

It needs to support:

- input unit `%/kg/lbs`
- special conversion rules
- same-day weight lookup
- conditional weight prompt when missing
- save of one or two manual measurements in same transaction

Trying to push all of that into the generic modals will make those files harder to maintain.

### Minimum Behavior for Special Modal

For Body Fat or SMM manual save:

1. User selects date.
2. User selects unit `%`, `kg`, or `lbs`.
3. If unit is `%`:
   - allow save of canonical `%`
   - if no same-day weight exists, prompt to optionally add it now so mass view is available
4. If unit is `kg` or `lbs`:
   - same-day weight is required
   - if same-day weight exists, reuse it
   - otherwise require weight entry in same flow
5. Save target measurement as canonical `%`.
6. If a new weight was entered, save weight as a normal manual measurement too.

### Modals to Update

#### `AddInitialMeasurementDataModal`

File: `lib/presentation/add_initial_measurement_data/add_initial_measurement_data_modal.dart`

Update routing logic so:

- normal targets continue to use current behavior
- Body Fat and SMM open the special entry modal

#### `AddorEditMeasurementTargetModal`

File: `lib/presentation/add_data_modal/add_data_modal.dart`

Update routing logic similarly for add/edit flows.

## Onboarding Preferences

File: `lib/presentation/app_initializer/app_initer.dart`

Add unit preferences for:

- Body Fat
- SMM

Available preference values:

- `%`
- `kg`
- `lbs`

These preferences are display/input preferences only. Canonical stored values remain `%`.

## Chart Requirements

File: `lib/presentation/chart_2/charts_view2.dart`

### Required UX

Add a source filter:

- Manual
- Estimated
- Both

Default:

- Manual

### Visual Rules

1. Manual entries use current normal line styling.
2. Estimated entries use dotted styling.
3. In `Both` mode, show both series together.
4. Measurement list rows should include a source badge:
   - `Manual`
   - `Estimated`

### Goal Behavior in Charts

Goal state and goal evaluation must continue to use manual entries only by default.

### Chart Data Shape

The chart model should become source-aware.

Suggested `DataPoint` expansion in:

- `lib/presentation/chart_2/models/chart_models.dart`

Add fields:

- `source`
- optional `method`

This allows:

- separate styling
- tooltip labeling
- filtering without rebuilding shape elsewhere

## Save Flow Details

### Manual Body Fat Save

#### Case A: Input is `%`

1. Save canonical `%` as manual Body Fat entry.
2. Check same-day weight.
3. If weight missing, ask user whether to add it now.

#### Case B: Input is `kg` or `lbs`

1. Check same-day weight.
2. If weight exists, convert entered mass to `%`.
3. If weight missing, require user to enter body weight.
4. Save weight as manual Body Weight entry.
5. Save Body Fat as canonical `%` manual entry.

### Manual SMM Save

Same as Body Fat:

1. Input `%` can save directly.
2. Input `kg/lbs` requires same-day weight.
3. If weight missing, require entry in same flow.
4. Convert to canonical `%` before save.

## Estimation Trigger Placement

Best place to trigger estimation:

1. After successful save in repository or a dedicated application service layer.
2. Not inside widget code.

Recommended pattern:

- widget saves manual data
- repository commits transaction
- estimator service is invoked with affected target/date/user
- estimator inserts estimated entries if bucket and requirements allow

This keeps UI simple and makes behavior reusable.

## Implementation Order

### Phase 1: Data Layer

1. Update `database_service.dart`
2. Add new DB columns and indexes
3. Add SMM target and metric seed data
4. Add destructive upgrade behavior
5. Update entities/models
6. Update repository reads/writes

### Phase 2: Special Measurement Flow

1. Create dedicated Body Composition entry modal
2. Add same-day body weight lookup helper
3. Add required-body-weight flow for `kg/lbs`
4. Route Body Fat and SMM from both existing modal entry points to the new modal

### Phase 3: Estimator Service

1. Implement Navy BF estimate
2. Implement SMM from lean-mass estimate at 55%
3. Add 8-day bucket computation
4. Trigger estimator only when all required inputs exist
5. Insert estimated entries without touching manual ones

### Phase 4: Charts and Display

1. Extend chart data model with source
2. Add Manual / Estimated / Both filter
3. Add dotted series styling for estimated values
4. Add source badges to recent measurement list
5. Keep goals manual-only

### Phase 5: Onboarding Preferences

1. Add Body Fat unit preference if not already exposed correctly
2. Add SMM unit preference
3. Ensure preference lookup works for special targets

## Known Quirks and Accepted Tradeoffs

1. `kg/lbs` display for Body Fat and SMM depends on same-day body weight.
2. Estimated values may differ noticeably from manual values; this is expected.
3. SMM estimation is a rough proxy and must be labeled clearly as estimated.
4. Estimated values should not silently drive goal completion or summary logic.

## Recommended Labels

Use clear UI labels:

- `Manual`
- `Estimated`
- `Estimated from formula`
- `Body weight required for kg/lbs conversion`
- `SMM estimate`

Avoid presenting estimated SMM as medically precise.

## Summary

The cleanest implementation is:

1. keep canonical storage in `%`
2. keep estimated entries in the same measurements table with source tags
3. add one dedicated special modal for Body Fat and SMM
4. require same-day body weight whenever mass conversion is needed
5. extend charts to support Manual, Estimated, and Both views

This keeps the data model unified while still handling the special body-composition workflow correctly.