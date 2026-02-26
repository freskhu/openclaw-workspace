# ORG Memory Index (thin entrypoint)

## Active Projects

| Project | Status | Next | File |
|---------|--------|------|------|
| **ProcureAI** | Investor prototype ready | Team page + RFQ workflow live | [PROCUREAI.md](projects/PROCUREAI.md) |
| **Trading ICT2022** | Live trading active | Monitor exits, position sizing | [TRADING_ICT2022.md](projects/TRADING_ICT2022.md) |
| **Price Hunter** | S01 agent active | Systemd timer migration | [PRICE_HUNTER.md](projects/PRICE_HUNTER.md) |

## Global Rules

- **No secrets** in memory files (no tokens, keys, passwords, exact positions)
- **Write milestones** — decisions, deployments, major fixes only
- **Read pattern**: INDEX → project page → specialist agent
- **Token burn**: Keep entries concise; details live in project pages

## Cross-Agent Quick Links

| Domain | Agents |
|--------|--------|
| Frontend | D01_FE |
| Backend | D02_BE |
| QA | D03_QA |
| Trading | A01_QUANT, A02_PM, A03_TRADER |
| Shopping | S01_PRICE_HUNTER |

## Skills Library

Reusable skills for common tasks → [../skills/README.md](../skills/README.md)

| Skill | Use Case |
|-------|----------|
| procureai_ui_sprint | Rapid UI polish before demos |
| procureai_seed_data | Generate demo/test data |
| investor_demo_readiness | Validate for investor presentations |
| survey_outreach | Customer research and feedback |
| trading_release_gate | Safety checks before live trading |
| memory_consolidation | Weekly memory distillation |

## Daily Log Pattern

- Raw notes: `memory/YYYY-MM-DD.md`
- Consolidated: Project pages updated weekly or on milestone
