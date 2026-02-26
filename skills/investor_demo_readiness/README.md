# Investor Demo Readiness

## Purpose
Prepare and validate ProcureAI for investor demonstrations. Ensures the demo environment is stable, data is compelling, and all critical paths work flawlessly.

## When to Use
- 1-2 weeks before scheduled investor meetings
- Before pitch competitions or demo days
- Before recording demo videos for fundraising

## Inputs
| Input | Type | Description |
|-------|------|-------------|
| `demo_date` | date | Scheduled demo date |
| `demo_type` | enum | live, recorded, hybrid |
| `investor_focus` | string[] | areas to emphasize (e.g., ["ai", "traction", "market"]) |
| `dry_run_required` | boolean | schedule practice run |

## Outputs
| Output | Type | Description |
|--------|------|-------------|
| `readiness_report` | markdown | Go/No-go assessment |
| `demo_script` | markdown | Step-by-step demo flow |
| `risk_register` | markdown | Identified risks and mitigations |
| `dry_run_notes` | markdown | Practice session feedback |

## Owner Agent(s)
- **Primary:** `pm` (Product Manager) or `dev-fe`
- **Secondary:** `qa`, `dev-backend`

## Dependencies
- Stable demo environment (Vercel)
- Fresh seed data
- Feature flags configured
- Recording setup (if recorded demo)

## Success Metrics
- Zero critical bugs in demo path
- Demo completes in target time (10-15 min)
- All investor_focus areas demonstrable
- Team confident in dry run
