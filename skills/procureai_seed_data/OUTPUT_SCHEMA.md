# ProcureAI Seed Data - Output Schema

## File Structure
```
memory/seeds/{{date}}-{{environment}}/
├── seed_report.md
├── data_manifest.json
└── validation_results.md
```

## seed_report.md

```markdown
# Seed Data Report: {{environment}}
**Date:** {{date}}
**Scenario:** {{scenario}}
**Volume:** {{data_volume}}

## Entities Created
| Entity | Count | Notes |
|--------|-------|-------|
| Suppliers | {{count}} | {{notes}} |
| Products | {{count}} | {{notes}} |
| RFQs | {{count}} | {{notes}} |
| Quotes | {{count}} | {{notes}} |
| Projects | {{count}} | {{notes}} |

## Sample Data
### Supplier Example
```json
{{example_supplier}}
```

## Execution Time
{{duration}} seconds
```

## data_manifest.json

```json
{
  "environment": "{{environment}}",
  "created_at": "{{iso_timestamp}}",
  "entities": {
    "suppliers": { "count": {{n}}, "categories": [...] },
    "products": { "count": {{n}}, "price_range": {...} },
    "rfqs": { "count": {{n}}, "status_breakdown": {...} },
    "quotes": { "count": {{n}}, "avg_response_time": "..." },
    "projects": { "count": {{n}} }
  },
  "relationships_verified": true,
  "orphaned_records": 0
}
```

## validation_results.md

```markdown
# Data Validation Results

## Integrity Checks
- [ ] All suppliers have valid categories
- [ ] All products link to valid suppliers
- [ ] All RFQs have valid project references
- [ ] All quotes link to valid RFQs and suppliers
- [ ] No duplicate SKUs
- [ ] No duplicate supplier names

## Query Performance
- [ ] List RFQs: {{ms}}ms
- [ ] List quotes: {{ms}}ms
- [ ] Dashboard load: {{ms}}ms
```
