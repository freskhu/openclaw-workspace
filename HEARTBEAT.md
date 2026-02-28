# HEARTBEAT.md - Daily Tasks

## Before Anything Else

1. **Read HEARTBEAT_STATE.md** — check current operational status
2. **Check state tracker** — use `skills/daily-ops/scripts/check_state.sh` to avoid duplicate alerts
3. **Only alert on NEW issues** — if already alerted today, don't repeat

## Daily 8:00 AM - Surprise Improvement

**User Request:** Work autonomously every day at 8 AM. Surprise them with a completed task to improve pre-existing workflows.

**Before starting:** Check state tracker for `daily_task/$(date +%Y-%m-%d)` — skip if already done.

### How It Works

1. **Systemd timer** triggers at 08:00 daily
2. **Script** generates a random improvement task in `memory/improvements/YYYY-MM-DD.md`
3. **Agent reads** this file on first heartbeat after 8 AM
4. **Complete the task** and report results

### Areas to Improve

| Category | Tasks |
|----------|-------|
| **Trading** | Optimize thresholds, backtest reports, signal quality |
| **ProcureAI** | Clean code, add tests, UI improvements |
| **Memory** | Consolidate notes, update INDEX |
| **System** | Organize files, archive logs |
| **Docs** | Update README, document features |

### Workflow

```
08:00 systemd timer → daily_improvement.sh runs
    ↓
Creates memory/improvements/2026-02-25.md
    ↓
Agent reads on next heartbeat
    ↓
Complete task → Update file → Notify user
```

### Installation (requires sudo)

```bash
sudo cp ~/.openclaw/workspace/systemd/openclaw-daily-improvement.* /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now openclaw-daily-improvement.timer
```

### Manual Trigger

```bash
~/.openclaw/workspace/scripts/daily_improvement.sh
```

Then read `memory/improvements/$(date +%Y-%m-%d).md` and complete the task.

### Notification Settings

**User preference:** Include `@freskhy` mention in completion messages for notification alerts.
