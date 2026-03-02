# API Health Guard — Output Schema

## Files Produced

### 1. State File (required)
**Path:** `.state/api_health_latest.json`

```json
{
  "checked_at": "2026-03-02T10:15:00Z",
  "overall_status": "warning",
  "apis": [
    {
      "name": "moonshot",
      "status": "warning",
      "usage_pct": 78,
      "errors_24h": 2,
      "action_taken": "alerted"
    },
    {
      "name": "linkedin",
      "status": "healthy",
      "usage_pct": 12,
      "errors_24h": 0,
      "action_taken": "none"
    }
  ],
  "paused_tasks": [],
  "retry_after": null
}
```

### 2. Individual API State Files (optional but recommended)
**Path:** `.state/api_health_{api_name}.json`

Historical tracking per API for trend analysis.

### 3. Alert Log (if critical)
**Path:** `memory/alerts/api_critical_YYYY-MM-DD-HHMM.md`

```markdown
# API Critical Alert: {api_name}

**Time:** {timestamp}
**Status:** {usage_pct}% usage, {errors_24h} errors

## Action Taken
- Paused tasks: {list}
- Retry after: {timestamp}

## Recommended User Action
{specific guidance}
```

### 4. Discord Notification (if critical)
**Channel:** #product-hunt or DM
**Format:** @freskhy mention with summary

## Success Criteria

- [ ] All APIs checked
- [ ] State files updated
- [ ] Critical APIs trigger task pauses
- [ ] User alerted if action taken
- [ ] Retry time calculated and stored
