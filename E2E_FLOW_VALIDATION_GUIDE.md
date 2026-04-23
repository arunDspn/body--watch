# End-to-End Flow Validation Guide

## Implementation Status: ✅ COMPLETE

All components for the body composition → estimate generation → chart display workflow are implemented and code-reviewed.

---

## Architecture Overview

### Data Flow
```
User enters body-fat measurement
    ↓
BodyCompositionEntryModal validates input
    ↓
BodyCompositionService.buildManualSavePayload()
  - Converts input to canonical % (handles kg/lbs/%)
  - Looks up same-day weight (or creates if provided)
    ↓
MeasurementRepository.saveMeasurements()
  - Saves primary measurement (body-fat) + optional weight to DB
  - Calls _refreshBodyCompositionEstimates()
    ↓
BodyCompositionEstimatorService.refreshForManualMeasurements()
  - Loads user gender, height, waist, neck, hips
  - Calculates Navy BF% formula (gender-specific)
  - Calculates SMM% from BF% and weight
  - Inserts estimates with bucket key (year-month-b{1,2,3,4})
  - Prevents duplicates via bucket key uniqueness
    ↓
User navigates to chart
    ↓
ChartDetailCubit.load() with sourceFilter
  - Calls MeasurementRepository.getMeasurementsByTarget()
  - Filters: manual OR estimated OR both
    ↓
ChartsView2 displays dual series
  - Primary line: manual measurements (solid, color from config)
  - Secondary line: estimated measurements (dashed, tertiary color)
    ↓
User toggles filter chips
  - Manual → shows only manual measurements
  - Estimated → shows only estimated measurements
  - Both → shows dual series
```

---

## Manual Testing Scenarios

### ✅ Test 1: Manual Entry → Estimate Generation

**Setup:**
- Ensure user has height, waist, neck targets seeded in database
- Ensure user gender is set (M/F) in user table
- Body composition body-fat and skeletal-muscle-mass targets exist

**Steps:**
1. Open app and navigate to body composition entry screen
2. Click "Add Measurement" for body-fat percentage
3. Enter values:
   - Body Fat: 25%
   - Date: Today
   - Weight: 75 kg (optional but recommended for SMM calculation)
4. Click "Save"

**Expected Results:**
- ✅ Success snackbar appears
- ✅ Modal closes
- ✅ Database contains:
  - Manual measurement: body-fat = 25%, source = 'manual'
  - Optional weight measurement: 75kg, source = 'manual'
  - Estimated body-fat: ~calculated from Navy formula, source = 'estimated_formula'
  - Estimated SMM%: ~calculated from BF% and weight

**SQL Verification:**
```sql
-- Check manual entry
SELECT id, target_id, value, source, date 
FROM measurements 
WHERE source = 'manual' AND target_id = (SELECT id FROM measurement_targets WHERE code='body_fat_percentage')
ORDER BY date DESC LIMIT 1;

-- Check estimates generated
SELECT id, target_id, value, source, method, estimate_bucket_key, date 
FROM measurements 
WHERE source = 'estimated_formula' AND date = '2026-04-12'
ORDER BY id DESC LIMIT 2;
```

---

### ✅ Test 2: Chart Displays Both Manual & Estimated Series

**Setup:**
- Complete Test 1 above

**Steps:**
1. Navigate to "Analytics" or chart view
2. Select body-fat percentage chart
3. Wait for data to load

**Expected Results:**
- ✅ Chart loads without errors
- ✅ Two lines visible:
  - Solid line: manual measurement point (today)
  - Dashed line: estimated measurement point (today)
- ✅ Both lines have labeled dots
- ✅ Legend or labels distinguish Manual vs Estimated sources

**Visual Verification:**
- Manual line: appears solid, uses primary config color
- Estimated line: appears dashed (6px dash, 4px gap), uses tertiary color
- Both lines interpolate smoothly through time

---

### ✅ Test 3: Source Filter Interaction

**Setup:**
- Complete Test 1 (at least one manual + one estimated entry)

**Steps:**
1. In chart view, locate filter chips: "Manual | Estimated | Both"
2. Default state: Manual (only manual measurements shown)
3. Tap "Estimated" chip
4. Observe chart update
5. Tap "Both" chip
6. Observe chart update

**Expected Results:**
- ✅ Manual filter:
  - Shows only manual measurements
  - Estimated line hidden
  - Only one series on chart
  
- ✅ Estimated filter:
  - Shows only estimated measurements
  - Manual line hidden
  - Only one series on chart
  
- ✅ Both filter:
  - Shows both series
  - Dual lines visible (solid and dashed)
  - Chart renders without overlapping issues

---

### ✅ Test 4: Goal Auto-Completion

**Setup:**
- Have existing goal: "Body-fat ≤ 20%"
- Test 1 entry satisfies goal (25% → but if second entry is ≤ 20%)

**Steps:**
1. With active goal "Body-fat ≤ 20%"
2. Enter new manual body-fat measurement: 19%
3. Observe save
4. Navigate to goals screen

**Expected Results:**
- ✅ Goal auto-completes when measurement crosses threshold
- ✅ Goal status changes from "active" to "completed"
- ✅ Goal completion triggered ONLY on manual entries (not estimates)

**SQL Verification:**
```sql
SELECT id, target_id, status, target_value, direction, updated_at
FROM measurement_goals
WHERE user_id = 1 AND status = 'completed'
ORDER BY updated_at DESC LIMIT 1;
```

---

### ✅ Test 5: Multiple Entries Same Day (Bucket Key Uniqueness)

**Setup:**
- From Test 1, one estimate already exists for today

**Steps:**
1. Create another manual body-fat entry for today (different value)
2. Trigger estimate generation again
3. Query measurements for today

**Expected Results:**
- ✅ Only ONE estimate per day exists (bucket key prevents duplicates)
- ✅ Estimate uses latest values (height, waist, neck)
- ✅ No orphaned estimates with conflicting bucket keys

**SQL Verification:**
```sql
SELECT 
  estimate_bucket_key, 
  COUNT(*) as count,
  GROUP_CONCAT(source) as sources
FROM measurements
WHERE source = 'estimated_formula'
  AND target_id = (SELECT id FROM measurement_targets WHERE code='body_fat_percentage')
GROUP BY estimate_bucket_key
HAVING COUNT(*) > 1;
-- Should return no rows (no duplicates per bucket key)
```

---

### ✅ Test 6: Persistence Across App Restart

**Setup:**
- Complete Test 1 and Test 2

**Steps:**
1. Chart displays both manual and estimated measurements
2. Close app completely (kill process)
3. Reopen app
4. Navigate to chart
5. Select body-fat chart

**Expected Results:**
- ✅ Chart loads all measurements (manual + estimated)
- ✅ Dual series renders correctly
- ✅ Filter state defaults to "Manual" (if preferences not integrated)
- ✅ No data loss

---

### ✅ Test 7: Edge Cases

#### 7a: Entry Without Weight
**Steps:**
1. Enter body-fat: 20%, unit: %, date: today, NO weight value
2. Save

**Expected:** 
- ✅ Body-fat estimate generates (uses existing weight or N/A)
- ✅ SMM estimate only if weight available
- ✅ No crash

#### 7b: Entry Without Height/Waist/Neck
**Steps:**
1. Ensure measurement_targets missing height (or waist, or neck)
2. Enter body-fat measurement
3. Save

**Expected:**
- ✅ Manual entry saves
- ✅ Estimate fails gracefully (no estim calculated, but no crash)
- ✅ Error logged (not shown to user)

#### 7c: Different-Unit Entries
**Steps:**
1. Enter body-fat: 15 kg (not %)
2. Verify weight lookup or weight input used
3. Save

**Expected:**
- ✅ Input correctly converted to canonical % using weight
- ✅ Database stores % (canonical)
- ✅ Chart displays in original unit preference

---

## Code Verification Checklist

### Services Layer

- [x] **BodyCompositionEstimatorService**
  - Location: `lib/data/services/body_composition_estimator_service.dart`
  - Implements Navy formula (male/female variants)
  - Calculates SMM% correctly
  - Bucket key format: `year-month-b{1,2,3,4}` (deterministic)
  - No duplicate estimates per bucket key

- [x] **BodyCompositionService**
  - Location: `lib/data/services/body_composition_service.dart`
  - Builds save payload (handles unit conversion)
  - Looks up same-day weight
  - Supports %, kg, lbs units
  - Creates optional weight measurement

### Repository Layer

- [x] **MeasurementRepository.saveMeasurements**
  - Saves measurements in transaction
  - Calls `_refreshBodyCompositionEstimates()` post-save
  - Calls `_completeGoalIfMeasurementMatchesTarget()` for goal auto-completion

- [x] **MeasurementRepository.getMeasurementsByTarget**
  - Accepts `sourceFilter: MeasurementSourceFilter` parameter
  - Filters by source in SQL: manual, estimated, both
  - Returns MeasurementModel list with source field

### UI Layer

- [x] **BodyCompositionEntryModal**
  - Validates positive number input
  - Saves via `BodyCompositionService.saveManualEntry()`
  - Shows success/error snackbar
  - Closes modal on success

- [x] **ChartDetailCubit**
  - `load()` accepts `sourceFilter` parameter
  - Calls `getMeasurementsByTarget()` with filter
  - Emits state with measurements

- [x] **ChartsView2**
  - Initializes with `_sourceFilter = MeasurementSourceFilter.manual`
  - Filter chips implemented (Manual, Estimated, Both)
  - `_changeSourceFilter()` updates cubit
  - Passes `data` (manual) and `secondaryData` (estimated) to chart

- [x] **BodyMeasurementChart**
  - Renders primary line (solid, config color)
  - Renders secondary line (dashed [6,4], tertiary color)
  - Both series have dot rendering
  - Chart interpolates correctly

---

## Database Integrity Checks

```sql
-- Verify all required targets exist
SELECT code, COUNT(*) as count FROM measurement_targets 
WHERE code IN ('height', 'waist', 'neck', 'body_fat_percentage', 'skeletal_muscle_mass')
GROUP BY code;
-- Should have all 5 with count = 1

-- Verify user has gender field value
SELECT id, gender FROM users WHERE id = 1;
-- Should show 'M' or 'F'

-- Verify no orphaned estimates
SELECT COUNT(*) as orphan_count FROM measurements
WHERE source = 'estimated_formula' AND estimate_bucket_key IS NULL;
-- Should return 0

-- Verify bucket key format validity
SELECT estimate_bucket_key, COUNT(*) FROM measurements
WHERE source = 'estimated_formula'
GROUP BY estimate_bucket_key
ORDER BY estimate_bucket_key DESC
LIMIT 5;
-- Should show format: YYYY-MM-b{1,2,3,4}

-- Verify goal completion triggers
SELECT 
  id, target_id, status, target_value, direction,
  (SELECT COUNT(*) FROM measurements m 
   WHERE m.target_id = measurement_goals.target_id 
   AND m.date >= measurement_goals.start_date) as sample_count
FROM measurement_goals
WHERE user_id = 1 AND status = 'completed'
ORDER BY updated_at DESC
LIMIT 1;
```

---

## Performance Considerations

### Estimate Refresh Performance
- **Trigger**: Manual measurement save (post-DB commit)
- **Work**: 1 DB transaction per manual measurement
- **Expected duration**: <500ms for Navy formula + SMM calc + insert
- **Optimization**: Async operation, doesn't block UI

### Chart Query Performance
- **Query**: `getMeasurementsByTarget()` with source filter
- **Join complexity**: 4 tables (measurements, targets, metrics, metric_units)
- **Index recommendation**: `CREATE INDEX idx_m_source_target_date ON measurements(user_id, target_id, source, date DESC);`
- **Expected result size**: 30-100 measurements per chart (configurable)

### Chart Rendering
- **Dual series**: Two LineChartBarData objects
- **Performance**: Should render instantly for <100 points
- **Optimization**: Chart date range filtering (month/week view)

---

## Known Limitations & Assumptions

1. **User Gender**: Must be set in user table (M/F) for Navy formula selection
2. **Seeded Targets**: All formula targets (height, waist, neck, hips) must exist
3. **Same-Day Weight**: Queries same-day per timestamp; timezone-aware
4. **Estimate Bucket Key**: Deterministic format prevents accidental duplicates but assumes same user won't enter conflicting data on same date in different buckets
5. **Goal Completion**: Only triggers on manual measurements (not estimates)
6. **Persistent Filter State**: Currently defaults to "manual"; preferences integration pending

---

## Next Steps After Validation

1. **If all tests pass:**
   - Task 1 (High Priority) is COMPLETE ✅
   - Proceed to Task 2: Preferences Integration (medium priority)
   - Test preferences persistence across app restart

2. **If tests fail:**
   - Log error details with:
     - Device/emulator configuration
     - Database state (queries above)
     - Exact error message/stacktrace
   - Debug by:
     - Enabling verbose logging
     - Checking database transactions
     - Reviewing hot-reload state

3. **Polish phase (Low Priority):**
   - Visual review: Dashed line style, filter chip spacing
   - Mobile responsiveness testing
   - Badge coloring/styling refinement

---

## Test Execution Checklist

- [ ] Test 1: Manual Entry → Estimate Generation
- [ ] Test 2: Chart Displays Both Manual & Estimated Series
- [ ] Test 3: Source Filter Interaction
- [ ] Test 4: Goal Auto-Completion
- [ ] Test 5: Multiple Entries Same Day (Bucket Key Uniqueness)
- [ ] Test 6: Persistence Across App Restart
- [ ] Test 7a: Edge Case - Entry Without Weight
- [ ] Test 7b: Edge Case - Entry Without Height/Waist/Neck
- [ ] Test 7c: Edge Case - Different-Unit Entries
- [ ] Database Integrity Checks (SQL queries above)
- [ ] Performance Monitoring (estimate refresh < 500ms)

---

**Last Updated**: 12 April 2026
**Implementation Status**: Ready for Manual Testing ✅
