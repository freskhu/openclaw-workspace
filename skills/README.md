# Skills Library

Versioned, reusable skills for the AI organization.

## Quick Reference

| Skill | Purpose | Owner |
|-------|---------|-------|
| [procureai_ui_sprint](procureai_ui_sprint/) | Execute focused UI/UX improvement sprints | dev-fe |
| [procureai_seed_data](procureai_seed_data/) | Generate realistic seed data for demos/testing | dev-be |
| [investor_demo_readiness](investor_demo_readiness/) | Validate product for investor presentations | pm |
| [survey_outreach](survey_outreach/) | Design, execute, and analyze user surveys | growth |
| [trading_release_gate](trading_release_gate/) | Safety validation before live trading | trade-quant |
| [memory_consolidation](memory_consolidation/) | Weekly memory distillation into project docs | any |

## Skill Structure

Each skill contains:

```
skills/{{skill_name}}/
├── README.md          # Purpose, inputs, outputs, owner
├── PROMPT.md          # Template prompt for execution
├── OUTPUT_SCHEMA.md   # Expected artifacts structure
└── CHECKLIST.md       # QA and acceptance criteria
```

## How to Use a Skill

1. **Read** `README.md` — Understand when to use it
2. **Fill** `PROMPT.md` template — Customize parameters
3. **Execute** — Run the task
4. **Validate** — Use `CHECKLIST.md` for QA
5. **Deliver** — Output to `OUTPUT_SCHEMA.md` specification

## Adding New Skills

1. Create directory under `skills/{{skill_name}}/`
2. Write all 4 required files
3. Update this README with one-line description
4. Update `memory/INDEX.md` skills table
5. Update `ROUTING.md` if agent routing changes

## Rules

- **No secrets** in any skill files
- Keep skills **generic and reusable**
- Version with the repo (commit changes)
- Skills are **templates**, not running code
