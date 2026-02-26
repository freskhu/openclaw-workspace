# ProcureAI Seed Data - Prompt Template

```
Generate seed data for ProcureAI with the following parameters:

ENVIRONMENT: {{environment}}
DATA_VOLUME: {{data_volume}}
SCENARIO: {{scenario}}
CLEAN_SLATE: {{clean_slate}}

TASKS:
1. Review prisma/schema.prisma for current entity definitions
2. Generate seed data matching the scenario theme:
   - Suppliers (with realistic names, locations, categories)
   - Products (with appropriate SKUs, pricing, specs)
   - RFQs (with coherent requirements and timelines)
   - Quotes (linked to suppliers and RFQs)
   - Projects (grouping related RFQs)
3. Ensure referential integrity
4. Write seed script or use Prisma seed.ts
5. Execute seed in target environment
6. Validate data integrity
7. Generate seed report

CONSTRAINTS:
- Use realistic business data (no lorem ipsum)
- Maintain referential integrity (all FKs valid)
- No PII or real company names
- Pricing should be realistic for the scenario
- Date ranges should be coherent (no RFQs due in the past)

DELIVERABLES:
- Seed report with entity counts
- Data manifest (JSON)
- Validation results
```

## Example Usage

```
Generate seed data for ProcureAI with the following parameters:

ENVIRONMENT: demo
DATA_VOLUME: medium
SCENARIO: electronics manufacturing supply chain
CLEAN_SLATE: true

TASKS:
1. Review prisma/schema.prisma...
```
