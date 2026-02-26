# Memory Consolidation

## Purpose
Distill daily agent memory files into curated project documentation. Prevents memory rot and maintains actionable project context.

## When to Use
- Weekly (automated via systemd timer)
- After major milestones (deployments, pivots)
- When onboarding new agents
- When memory files exceed 30 days

## Inputs
| Input | Type | Description |
|-------|------|-------------|
| `consolidation_scope` | enum | daily, weekly, project_specific |
| `target_projects` | string[] | Projects to consolidate |
| `date_range` | string | Start to end date |

## Outputs
| Output | Type | Description |
|--------|------|-------------|
| `consolidation_log` | markdown | What was processed |
| `updated_project_files` | markdown[] | Updated project docs |
| `insights` | markdown | Patterns/themes discovered |

## Owner Agent(s)
- **Primary:** Any agent (automated via cron)
- **Secondary:** Human review (monthly)

## Dependencies
- Access to `memory/` directory
- Ollama (optional, for summarization)
- Git for version control

## Success Metrics
- No data loss (originals archived)
- Project files updated with latest context
- Action items captured
- Consolidation completes < 5 minutes
