---
name: daily-ops
description: Track daily operational state between heartbeats to prevent duplicate alerts and maintain continuity. Use when handling recurring heartbeat checks (trading positions, cron jobs, scheduled tasks) to avoid alerting on the same issue multiple times. Maintains state files for tracking what's already been reported.
---

# Daily Operations State Tracker

Prevents duplicate alerts across heartbeat sessions by maintaining state files.

## When to Use

- Before reporting an alert in a heartbeat
- After completing a daily improvement task
- When checking trading positions that were already alerted on
- For any recurring check that shouldn't spam the user

## Core Workflow

### 1. Check State Before Alerting

```bash
# Check if we've already alerted on this today
~/.openclaw/workspace/skills/daily-ops/scripts/check_state.sh <category> <key>
# Returns: "new" or "seen"
```

### 2. Mark State After Alerting/Action

```bash
# Mark as seen so we don't alert again
~/.openclaw/workspace/skills/daily-ops/scripts/mark_state.sh <category> <key>
```

### 3. State Categories

| Category | Purpose | Example Keys |
|----------|---------|--------------|
| `trading` | Position alerts | `SOL_SL_breached`, `XRP_TP_hit` |
| `cron` | Cron job status | `linkedin_10am_failed`, `improvement_8am_done` |
| `daily_task` | Completed improvements | `2026-02-28_ui_improvements` |

## State File Location

`~/.openclaw/workspace/.state/heartbeat_state.json`

## Example Usage

### Trading Position Alert

```bash
# Check if we already alerted on SOL today
if [ "$(scripts/check_state.sh trading SOL_SL_breached)" = "new" ]; then
    # Alert the user
    echo "🚨 SOL stop loss breached!"
    # Mark as seen
    scripts/mark_state.sh trading SOL_SL_breached
fi
```

### Daily Improvement Tracking

```bash
# Check if today's improvement was already done
if [ "$(scripts/check_state.sh daily_task $(date +%Y-%m-%d))" = "new" ]; then
    # Read and do the improvement
    cat memory/improvements/$(date +%Y-%m-%d).md
    # Mark as done
    scripts/mark_state.sh daily_task $(date +%Y-%m-%d)
fi
```

## Automatic Cleanup

State entries older than 7 days are automatically purged on each check.

## Heartbeat Integration

Read HEARTBEAT_STATE.md in workspace root for current status before deciding to alert.
