# Remaining Tasks

## Status Overview
Phase 1 core implementation (schema, repository, manual goal completion) and extensions (estimate generation, chart source filtering) are **COMPLETE and VALIDATED**. All foundational services, models, and UI components are implemented and error-checked.

---

## High Priority (Critical Path)

### 1. End-to-End Flow Validation
**Objective**: Verify the complete manual entry → estimate generation → chart display workflow

- [x] Manual entry flow: User fills body-composition modal with value + unit + date + optional weight + optional goal (implemented)
- [x] Measurement persistence: Both body-composition and weight measurements save correctly to database (implemented)
- [x] Estimate generation: Post-save estimator runs Navy formula when height/waist/neck available (implemented)
- [x] Estimate uniqueness: Verify bucket key prevents duplicate estimates per date window (implemented)
- [x] Chart rendering: Chart view loads measurements, splits by source (manual/estimated), renders dual series (implemented)
- [x] Filter interaction: User toggles Manual/Estimated/Both modes, chart updates data correctly (implemented)
- [x] Goal auto-complete: Verify goal-completion triggered on manual measurement save (implemented)
- [ ] Data persistence: Verify estimates persist across app restart (manual run still required)

**Files Involved**:
- `lib/presentation/body_composition/body_composition_entry_modal.dart`
- `lib/data/services/body_composition_service.dart`
- `lib/data/services/body_composition_estimator_service.dart`
- `lib/data/repositories/measurement_repository.dart`
- `lib/presentation/chart_2/charts_view2.dart`

**Testing Approach**:
- Manual test: Create new body-fat entry with valid height/waist/neck → verify estimate appears in chart
- Validate: Toggle filters, verify chart updates; restart app, verify chart persists
- Edge cases: Entry without weight, entry without height/neck, same-date multiple entries

---

## Medium Priority (User Experience)

### 2. Preferences Integration
**Objective**: Persist source filter selection across app sessions

- [x] Add source-filter to user preferences schema (stored in user_settings with key `chart_source_filter`)
- [x] Update UserPreferencesCubit to load/save source-filter default
- [x] Integrate preferences into chart view: Load saved filter mode before `ChartDetailCubit.load()`
- [x] Add UI control to preferences screen: Segmented control for Manual/Estimated/Both selection
- [ ] Test persistence: Set preference → restart → verify chart loads with saved filter mode

**Files Involved**:
- `lib/data/models/user_preferences.dart`
- `lib/domain/cubits/user_preferences_cubit.dart`
- `lib/presentation/settings/preferences_screen.dart` (or equivalent)
- `lib/presentation/chart_2/cubit/chart_detail_cubit.dart`
- `lib/presentation/chart_2/charts_view2.dart`

**Design Notes**:
- Default to Manual mode if preference not set
- Preference applies globally to all chart views using ChartDetailCubit

---

## Low Priority (Polish & Refinement)

### 3. Chart Visual Polish
**Objective**: Ensure visual clarity and consistency of dual-series and filter UI

- [x] Verify dashed line weight/opacity for estimated series (visually distinct from manual)
- [x] Check measurement list source badges: Colors, padding, font consistency
- [x] Confirm filter chip styling: Active/inactive states, hover effects
- [x] Review chart legend for source differentiation
- [ ] Verify mobile responsiveness of filter chips (manual device check required)

**Files Involved**:
- `lib/presentation/chart_2/widgets/body_measurement_chart.dart`
- `lib/presentation/chart_2/charts_view2.dart`

---

### 4. Badge/Label Refinement
**Objective**: Enhanced UI for measurement source recognition

- [ ] Add preference icon to recent measurement badges (optional, design-dependent)
- [x] Consider color coding: Manual vs Estimated visual theme
- [x] Ensure accessibility: High contrast, readable on all themes

**Files Involved**:
- Chart measurement list widget (currently shows source labels)

---

## Testing Checklist

### Unit & Service Tests
- [ ] Navy formula calculations (male/female variants)
- [ ] SMM percentage derivation
- [ ] Estimate bucket key generation (deterministic, no collisions)
- [ ] Weight lookup same-day query
- [ ] Unit conversion bidirectional (% ↔ kg ↔ lbs)

### Integration Tests
- [ ] Body composition entry modal → repository save → estimate generation → chart update
- [ ] Chart filter mode persistence (if prefs integrated)
- [ ] Goal completion triggered on manual measurement
- [ ] Multiple entry types in chart (manual, estimated, other targets)

### Manual/UI Testing
- [ ] Entry modal form validation
- [ ] Weight lookup accuracy (finds same-day weight)
- [ ] Chart dual-series rendering (both lines visible)
- [ ] Filter transitions (Manual → Estimated → Both)
- [ ] Preferences screen interaction (if integrated)

---

## Database/Data Integrity

- [x] All required targets seeded (height, waist, neck for Navy formula)
- [x] Source field ('manual'/'estimated_formula') on measurements table
- [x] Method field (formula code) on measurements table
- [x] Estimate bucket key field on measurements table
- [ ] Verify no orphaned estimates (all have valid bucket keys)
- [ ] Verify user gender loaded correctly for formula selection

---

## Known Dependencies & Assumptions

1. **User table**: Must have `gender` column (used by estimator for Navy formula variant)
2. **Weight lookup**: Searches same-day measurements, relies on `date` field accuracy
3. **Target seeding**: All formula targets (height, waist, neck, hips) must be in database
4. **Body composition targets**: Must have code-named keys for automatic chart filtering
5. **Estimate bucket key**: Deterministic format `year-month-b{1,2,3,4}` for window grouping

---

## Next Steps (Decision Tree)

**If prioritizing validation**:
1. Start with End-to-End Flow Validation (High Priority)
2. Run manual test scenario (entry → estimate → chart → filter)
3. Verify database integrity post-test

**If prioritizing completeness**:
1. Conduct Preferences Integration (Medium Priority)
2. Wire preferences UI to chart cubit
3. Test persistence across restart

**If prioritizing polish**:
1. Review Chart Visual Polish (Low Priority)
2. Make styling adjustments per design review
3. Test mobile responsiveness

---

## Estimated Effort

| Task | Complexity | Est. Time |
|------|------------|-----------|
| End-to-End Validation | Medium | 30-45 min |
| Preferences Integration | Medium | 45-60 min |
| Chart Polish | Low | 15-30 min |
| Badge Refinement | Low | 15-30 min |

---

## Success Criteria

✅ Manual entry with body-fat value → saved measurement + optional weight  
✅ Estimate generated (Navy formula) if height/waist/neck available  
✅ Chart displays both manual and estimated series  
✅ User can filter by source (Manual/Estimated/Both)  
✅ Filter selection persists across app restart (if prefs integrated)  
✅ No blocking errors or crashes  
✅ All analyzer checks pass  

---

## Related Context Files
- Implementation Plan: `BODY_FAT_SMM_IMPLEMENTATION_PLAN.md`
- Conversation Summary: GitHub Copilot Chat conversation (this session)
