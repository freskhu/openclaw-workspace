# MEMORY.md — Consolidated Long-Term Memory

## Trading ICT2022 — LIVE

**Status**: Active and operational (fixed 2026-03-01)

### Key Facts
- Strategy: ICT 2022 FVG on 5m candles, $50 fixed position sizing
- Exchange: Hyperliquid Perpetual via Hummingbot API
- Mode: Live trading (switched from paper 2026-02-25)
- Config: `trading/ict2022/config/strategy.yaml`

### Critical Fixes Applied

**2026-03-01 04:18** — Systemd service WorkingDirectory fix
- Problem: Service pointed to wrong directory (`/home/freskhy/projects/trading`)
- Impact: Credentials weren't loading, 167 consecutive auth errors
- Fix: Updated to correct path `~/.openclaw/workspace/trading/ict2022/`
- Result: Live trading now executing properly

**2026-02-28** — Credential persistence fix
- Problem: Had to ask for credentials repeatedly (user frustration)
- Solution: Created `trading/ict2022/.env` with auto-loading in live_runner.py
- Policy: Never store secrets in memory files; use .env with chmod 600

### Current State
- Bot running (PID refreshes every restart)
- Telemetry active: Processing BTC, ETH, SOL, XRP every 5 min
- No positions currently open (waiting for quality signals)
- Signal quality filters active (0.5-5 ATR range, 0.1-1 ATR sweep)

### Exit Strategy
- Auto-close: -1% SL / +2% TP (price moves)
- Alerts (manual): 8h max hold, NY close (4 PM EST), trailing stop after +1.5R

---

## Daily Improvement Workflow

**Established**: 2026-02-28 / Refined 2026-03-01

### How It Works
1. Systemd timer triggers at 08:00 daily
2. Script generates task in `memory/improvements/YYYY-MM-DD.md`
3. First heartbeat after 8 AM reads and completes task
4. Notifies user with @freskhy mention

### Task Categories
| Category | Examples |
|----------|----------|
| Trading | Optimize thresholds, backtest, signal quality |
| Procurum | Clean code, add tests, UI polish |
| Memory | Consolidate notes, update INDEX |
| System | Organize files, archive logs |
| Docs | Update README, document features |

### Priority Order
1. Procurum improvements
2. OpenClaw general improvements
3. New skill creation
4. LinkedIn engagement (2x daily: 10 AM, 9 PM)
5. Trading optimization
6. Proactive suggestions

---

## Agent Organization (MAX/Atlas)

**Router**: MAX (Atlas) — Chief of Staff
**Policy**: Index-first memory, no secrets in files, spawn specialist agents on-demand

| Agent | Role | Emoji |
|-------|------|-------|
| A01_QUANT | Strategy research, signals | 📊 |
| A02_PM | Portfolio, sizing, risk | 📈 |
| A03_TRADER | Execution, monitoring | ⚡ |
| D01_FE | Frontend, UI | 🎨 |
| D02_BE | Backend, API, infra | ⚙️ |
| D03_QA | Tests, regressions | 🧪 |
| B01_MBA | Research, deliverables | 🎓 |
| M01_SOCIAL | Content, posts | 📢 |

---

## Active Projects

| Project | Status | Next Action |
|---------|--------|-------------|
| **Procurum** | Investor prototype ready | Team page + RFQ workflow |
| **Trading ICT2022** | Live trading active | Monitor signals, position sizing |
| **Price Hunter** | S01 agent active | Systemd timer migration |

---

## System Configuration

### Critical Paths
- **Workspace**: `~/.openclaw/workspace/`
- **Trading**: `~/.openclaw/workspace/trading/ict2022/`
- **Memory**: `~/.openclaw/workspace/memory/`
- **Skills**: `~/.openclaw/workspace/skills/`

### Services
- `openclaw-gateway.service` — Gateway daemon
- `openclaw-ict-live.service` — Live trading runner
- `openclaw-daily-improvement.timer` — 8 AM daily tasks

### Credentials Storage
- Trading: `trading/ict2022/.env` (HB_API_USER, HB_API_PASS)
- Hummingbot: `~/.hb_secrets.env` (systemd service uses this)
- **Rule**: Never commit credentials; use .env files with restricted permissions

---

## Key Decisions Log

| Date | Decision | Context |
|------|----------|---------|
| 2026-02-24 | $50 fixed position sizing | Hyperliquid perpetual live trading |
| 2026-02-24 | Relaxed signal thresholds | min_disp_score: 1, require_mss: false |
| 2026-02-24 | Intraday exit strategy | 1% SL / 2% TP auto-close, no overnight |
| 2026-02-28 | Credential persistence | .env file + auto-load to stop daily asking |
| 2026-02-28 | Daily improvement workflow | Systemd timer at 8 AM autonomous tasks |
| 2026-03-01 | Fix systemd WorkingDirectory | Live trading actually executing now |

---

## Open Loops

1. ~~ICT 2022: Two positions open (SOL short, XRP long)~~ — Resolved, positions closed
2. Monitor trading bot for first live signal execution post-fix
3. Validate end-to-end agent routing: Discord → spawn → return

---

*Last updated: 2026-03-01 08:05*
