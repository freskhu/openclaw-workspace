# Agent Routing Guide

How to route work to the right agent and skills.

## Agent Matrix

| Agent ID | Specialty | When to Route |
|----------|-----------|---------------|
| `dev-fe` | Frontend/React | UI components, styling, responsive design |
| `dev-be` | Backend/API | Database, APIs, integrations |
| `qa` | Testing | Test plans, bug verification, QA gates |
| `pm` | Product | Roadmap, prioritization, demos |
| `growth` | Marketing | Surveys, outreach, positioning |
| `trade-quant` | Trading Strategy | Backtests, signal logic, optimization |
| `trade-ops` | Trading Ops | Live trading, risk, deployment |
| `max` | Orchestrator | Complex multi-agent tasks |

## Skill Routing

Use skills for standardized tasks:

| Task Type | Skill | Agent |
|-----------|-------|-------|
| UI polish before demo | `procureai_ui_sprint` | dev-fe |
| Generate test data | `procureai_seed_data` | dev-be |
| Prep for investor meeting | `investor_demo_readiness` | pm |
| Customer research | `survey_outreach` | growth |
| Go-live safety check | `trading_release_gate` | trade-quant |
| Weekly memory cleanup | `memory_consolidation` | any |

## Routing Rules

1. **Check skills first** — Is this a standardized task with a skill?
2. **Single domain** → Route directly to specialist
3. **Cross-domain** → Route to `max` for orchestration
4. **Urgent/blocking** → Escalate to human

## Skill Usage

```
1. Read skill README.md for context
2. Use PROMPT.md template
3. Follow CHECKLIST.md for QA
4. Output to OUTPUT_SCHEMA.md specification
```

## Examples

**"Fix the dashboard UI bugs"**
→ Use `procureai_ui_sprint` skill → Route to `dev-fe`

**"Prep for investor demo next week"**
→ Use `investor_demo_readiness` skill → Route to `pm`

**"Validate trading strategy before going live"**
→ Use `trading_release_gate` skill → Route to `trade-quant`
