# API Health Guard — Execution Prompt

## Context

Current time: {{current_time}}
APIs to check: {{apis | default: "all"}}
Alert threshold: {{alert_threshold | default: "80%"}}

## Task

Check API health for all configured services. Report status and take protective action if needed.

### APIs to Monitor

1. **Moonshot/Kimi (AI inference)**
   - Check: Rate limit headers from recent responses
   - Status file: `.state/api_health_moonshot.json`
   - Action if limit: Pause non-urgent agent spawns

2. **LinkedIn (social engagement)**
   - Check: Browser/automation health + any rate limit responses
   - Status file: `.state/api_health_linkedin.json`
   - Action if limit: Skip engagement runs, queue for retry

3. **Discord (notifications)**
   - Check: Webhook/message delivery status
   - Status file: `.state/api_health_discord.json`
   - Action if limit: Buffer messages, batch delivery

4. **Web Search (Brave)**
   - Check: Request quotas
   - Status file: `.state/api_health_brave.json`
   - Action if limit: Defer research tasks

### Steps

1. **Read state files** — Check if any API already flagged as degraded
2. **Assess recent errors** — Look at last 24h of logs for rate limit patterns
3. **Calculate health score** — For each API: Healthy / Warning / Critical
4. **Take action** — If any Critical:
   - Pause scheduled tasks that use that API
   - Alert user with specific API and retry time
   - Update state files with `paused_until` timestamp
5. **Report** — Output health dashboard

### Health Score Criteria

| Score | Criteria |
|-------|----------|
| Healthy | < 50% limit used, no errors in last hour |
| Warning | 50-80% limit used, or errors in last hour |
| Critical | > 80% limit used, or repeated errors |

### Output Format

```json
{
  "checked_at": "ISO timestamp",
  "overall_status": "healthy|warning|critical",
  "apis": [
    {
      "name": "moonshot",
      "status": "healthy|warning|critical",
      "usage_pct": 45,
      "errors_24h": 0,
      "action_taken": "none|paused_tasks|alerted"
    }
  ],
  "paused_tasks": ["linkedin_engagement", "news_digest"],
  "retry_after": "ISO timestamp or null"
}
```

## Notes

- Store results in `.state/api_health_latest.json`
- If Critical, write to memory with @freskhy mention
- Never expose API keys in outputs
