# Memory Index — MAX (Atlas)

## Stable Facts / Preferences
- User: Simão (Portugal). Building an OpenClaw "AI org" on Proxmox → Ubuntu 24.04 Desktop VM.
- Interface: Discord channel (OpenClaw gateway).
- OpenClaw: Multi-Agent Routing enabled; agents isolated (workspace + agentDir + sessions).
- Memory policy: file-based, index-first, low token burn; NEVER store secrets in memory files.
- Local LLM: Ollama (llama3.2:3b) for heartbeats and cheap routines.
- Model hierarchy: Kimi (default) → Haiku (fallback) → Sonnet/Opus (complex tasks).

## Agent Roster (v1)
| Agent | Role | Emoji |
|-------|------|-------|
| A01_QUANT | Quant Research | 📊 |
| A02_PM | Portfolio Manager | 📈 |
| A03_TRADER | Trader/Execution | ⚡ |
| D01_FE | Frontend | 🎨 |
| D02_BE | Backend | ⚙️ |
| D03_QA | QA | 🧪 |
| B01_MBA | MBA Researcher | 🎓 |
| M01_SOCIAL | Social Media | 📢 |
| M02_ERP_OP | ERP Operator (optional) | 🏭 |

## Routing Policy
- Research/backtests/signals → A01_QUANT
- Portfolio/risk/sizing → A02_PM
- Execution/orders/monitoring → A03_TRADER
- UI/dashboard → D01_FE
- API/DB/infra/integrations → D02_BE
- QA/tests/regressions → D03_QA
- MBA deliverables → B01_MBA
- Content/posts → M01_SOCIAL
- ERP/MES SOPs → M02_ERP_OP

## Memory Boundaries (strict)
**DO NOT STORE:** passwords, API keys, tokens, SSH keys, Discord secrets, exchange/broker creds, exact positions, balances, PnL, entry/exit levels, proprietary strategy parameters.

**OK TO STORE:** high-level intent, constraints, system decisions, non-sensitive configs, open loops.

## Completed Projects
- **2026-02-18:** OpenClaw AI Org bootstrap — agent directories, standard files, memory indices created for all 9 agents.
- **2026-02-18:** Discord gateway configured and tested (Simão approved, bot online).
- **2026-02-18:** Heartbeat configuration (Ollama llama3.2:3b) for all agents.

## Open Loops
1) ICT 2022 Strategy: **LIVE** — Two positions open (SOL short, XRP long). Monitor for exits.
2) Test end-to-end routing: Discord → Max → spawn agent → return result.
3) Validate agent handoff format works in practice.

## Key Decisions
- **2026-02-18:** MAX name = Atlas (Chief of Staff / Router). Index-first memory, no secrets in files.
- **2026-02-18:** Agents are file-based, spawned on-demand via subagents; not persistent background sessions.

## References
- 2026-02-18: Bootstrap baseline established (host, tools, roster, memory rules, Discord online).
