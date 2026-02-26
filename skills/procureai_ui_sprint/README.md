# ProcureAI UI Sprint

## Purpose
Execute a focused UI/UX improvement sprint on the ProcureAI application. This skill handles rapid iteration on frontend components, responsive design fixes, and visual polish.

## When to Use
- Before investor demos or public launches
- When UI bugs accumulate in the backlog
- During design system standardization efforts
- For accessibility (a11y) improvements

## Inputs
| Input | Type | Description |
|-------|------|-------------|
| `sprint_goal` | string | Primary objective (e.g., "polish dashboard", "fix mobile layout") |
| `scope` | string[] | Components/pages to focus on |
| `deadline` | date | Sprint end date |
| `reference_design` | URL/path | Figma file or design spec (optional) |

## Outputs
| Output | Type | Description |
|--------|------|-------------|
| `updated_components` | string[] | List of modified files |
| `screenshots` | image[] | Before/after comparisons |
| `a11y_report` | markdown | Accessibility audit results |
| `sprint_log` | markdown | Decision log and rationale |

## Owner Agent(s)
- **Primary:** `dev-fe` (Frontend Developer)
- **Secondary:** `dev-ux` (UX Designer, if available)

## Dependencies
- Next.js/React codebase access
- Component library (shadcn/ui)
- Playwright for visual regression
- Vercel deployment access

## Success Metrics
- Zero visual regressions in CI
- Lighthouse score ≥ 90 for affected pages
- All items in CHECKLIST.md pass
