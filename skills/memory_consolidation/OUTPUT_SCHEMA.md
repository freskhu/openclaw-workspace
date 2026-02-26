# Memory Consolidation - Output Schema

## File Structure
```
memory/consolidation/{{date}}/
├── consolidation_log.md
└── insights.md
```

Updated files:
```
memory/projects/
├── PROCUREAI.md (updated)
├── TRADING_ICT2022.md (updated)
└── ...
```

## consolidation_log.md

```markdown
# Memory Consolidation Log
**Date:** {{date}}
**Scope:** {{scope}}
**Range:** {{date_range}}

## Files Processed
| File | Project | Key Updates |
|------|---------|-------------|
| 2026-02-24.md | PROCUREAI | Deployed v1.2 |
| 2026-02-25.md | TRADING | Backtest results |

## Files Archived
- memory/2026-02-20.md → memory/consolidation/2026-02-20.md
- memory/2026-02-21.md → memory/consolidation/2026-02-21.md
...

## Project Updates
### PROCUREAI
- Updated: Current Status
- Added: Key Decisions (2 items)
- Updated: Next Actions

### TRADING_ICT2022
- Updated: Current Status
- Added: Key Decisions (1 item)
```

## insights.md

```markdown
# Insights: {{date_range}}

## Patterns Observed
1. {{pattern}}: {{evidence}}
2. {{pattern}}: {{evidence}}

## Recurring Blockers
- {{blocker}}: {{frequency}}

## Velocity Metrics
- PROCUREAI: {{commits}}/week
- TRADING: {{backtests}}/week

## Recommendations
- {{recommendation}}
```

## Project File Format (memory/projects/PROJECT.md)

```markdown
# PROJECT_NAME

## Current Status
{{concise_current_state}}

## Key Decisions
- **YYYY-MM-DD**: {{decision}} ({{context}})
- **YYYY-MM-DD**: {{decision}} ({{context}})

## Next Actions
- [ ] {{action}} | Owner: {{agent}} | Due: {{date}}

## Blockers
- {{blocker}} | Since: {{date}}

## Links
- Repo: {{url}}
- Docs: {{path}}
```
