# ProcureAI Seed Data

## Purpose
Generate and load realistic seed data for ProcureAI demos, testing, and development. Creates suppliers, products, RFQs, quotes, and projects with coherent relationships.

## When to Use
- New environment setup (dev, staging, demo)
- Before investor demos
- Database reset after schema changes
- Load testing with realistic data volumes

## Inputs
| Input | Type | Description |
|-------|------|-------------|
| `environment` | string | target env: dev, staging, demo, load-test |
| `data_volume` | enum | small (10s), medium (100s), large (1000s) |
| `scenario` | string | narrative theme (e.g., "manufacturing", "healthcare") |
| `clean_slate` | boolean | truncate existing data before seeding |

## Outputs
| Output | Type | Description |
|--------|------|-------------|
| `seed_report` | markdown | Summary of created entities |
| `data_manifest` | json | Entity counts and relationships |
| `validation_results` | markdown | Data integrity check results |

## Owner Agent(s)
- **Primary:** `dev-backend` or `dev-fe`
- **Secondary:** `qa` (for validation)

## Dependencies
- Prisma schema access
- Database connection
- Seed script templates in prisma/seed.ts

## Success Metrics
- All foreign key relationships valid
- Demo workflows can execute end-to-end
- No duplicate or orphaned records
- Seed completes within 5 minutes
