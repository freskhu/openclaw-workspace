# QA Test Plan — ProcureAI v1.1

**Date**: 2026-02-21  
**Tester**: D03_QA  
**Test Environment**: http://localhost:3000

---

## Test Summary

Total Tests: **21 tests** across **7 test files**

---

## Test Files

### 1. landing.spec.ts (3 tests)
- ✅ Homepage loads with correct title
- ✅ Displays hero section with value proposition
- ✅ Launch Demo button navigates to app

### 2. projects.spec.ts (4 tests)
- ✅ Projects list page loads
- ✅ Displays seeded projects including Fan Impeller
- ✅ Can navigate to project detail
- ✅ Can create new project

### 3. chat.spec.ts (3 tests)
- ✅ Project detail page loads with chat
- ✅ Can send chat message
- ✅ AI responds with action cards

### 4. rfqs.spec.ts (5 tests)
- ✅ RFQs list page loads
- ✅ Can create RFQ from RFQs page
- ✅ Can view RFQ details
- ✅ Can send RFQ to suppliers
- ✅ Can generate test quotes

### 5. suppliers.spec.ts (2 tests)
- ✅ Suppliers directory loads
- ✅ Displays all 12 seeded suppliers

### 6. quotes.spec.ts (2 tests)
- ✅ Quotes page loads with comparison table
- ✅ Displays supplier quotes from seeded data

### 7. demo-flow.spec.ts (2 tests)
- ✅ Complete demo scenario (end-to-end)
- ✅ Create RFQ and generate quotes flow

---

## Running Tests

```bash
# Run all tests
npm run test:e2e

# Run specific file
npx playwright test e2e/rfqs.spec.ts

# Run with UI mode
npx playwright test --ui

# Run in headed mode (see browser)
npx playwright test --headed
```

---

## Critical Path Validation

### User Journey 1: Create Project → Chat → Create RFQ
1. Navigate to Projects
2. Create new project
3. Open project
4. Send chat message
5. Receive AI response with action cards

### User Journey 2: Create RFQ → Send → Generate Quotes → Compare
1. Navigate to RFQs
2. Click "New RFQ"
3. Fill form (Project, Product, Quantity)
4. Submit → Toast confirmation
5. Find RFQ in list
6. Click Send (paper airplane icon)
7. Open RFQ details
8. Click "Generate Test Quotes"
9. Navigate to Quotes page
10. View comparison table

### User Journey 3: Full Demo Flow
1. Landing page → "Launch Demo"
2. Projects → Select "Fan Impeller Blades"
3. Chat → Type procurement need
4. Navigate RFQs → Quotes → Suppliers
5. Verify all pages load correctly

---

## Known Test Limitations

1. **Toast notifications**: May require additional wait time in CI
2. **Dialog interactions**: Select dropdowns may need special handling
3. **Dynamic data**: Test quotes are generated randomly (prices vary)
4. **Database state**: Tests assume seeded data exists

---

## Bug Fixes Applied

### Fixed Issues:
1. ✅ API routes now use Next.js 15 `params` as Promise
2. ✅ Messages API supports SYSTEM role messages
3. ✅ Removed undefined `payload` reference in ActionCard
4. ✅ Project links now work correctly
5. ✅ RFQ links now work correctly

---

## Sign-off

| Item | Status |
|------|--------|
| Landing Page Tests | ✅ |
| Projects Tests | ✅ |
| Chat Tests | ✅ |
| RFQ Tests | ✅ |
| Supplier Tests | ✅ |
| Quote Tests | ✅ |
| Demo Flow Tests | ✅ |

**Status**: ✅ READY FOR VALIDATION
