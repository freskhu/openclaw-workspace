# ProcureAI Seed Data - QA Checklist

## Pre-Flight
- [ ] Target database is accessible
- [ ] Schema matches prisma/schema.prisma
- [ ] CLEAN_SLATE confirmed (if true, backup taken)
- [ ] Scenario requirements understood

## Data Generation
- [ ] Suppliers: realistic names, valid categories
- [ ] Products: unique SKUs, realistic pricing
- [ ] RFQs: coherent dates (not in past), valid requirements
- [ ] Quotes: linked to valid RFQs/suppliers, realistic pricing
- [ ] Projects: meaningful names, grouping logic clear

## Referential Integrity
- [ ] All foreign keys resolve to valid records
- [ ] No orphaned records (child without parent)
- [ ] No circular references
- [ ] Enum values match schema definition

## Data Quality
- [ ] No placeholder text (lorem ipsum, "test", etc.)
- [ ] No real company names or PII
- [ ] Pricing is realistic (no $0 or $999,999)
- [ ] Dates are coherent (due dates > created dates)
- [ ] Text fields have reasonable length

## Execution
- [ ] Seed completes without errors
- [ ] Execution time < 5 minutes
- [ ] Transaction rollback works on failure
- [ ] Idempotent (can re-run safely)

## Validation
- [ ] Count queries return expected numbers
- [ ] Dashboard loads without errors
- [ ] Key workflows execute:
  - [ ] Create RFQ
  - [ ] Generate quotes
  - [ ] View supplier details
  - [ ] Export data

## Documentation
- [ ] seed_report.md written
- [ ] data_manifest.json generated
- [ ] validation_results.md complete

## Sign-off
- [ ] QA: Pass / Fail
- [ ] Reason: {{if_fail_explain}}

---
**Status:** ☐ PASS ☐ FAIL
**Completed:** {{date}}
**Agent:** {{agent_id}}
