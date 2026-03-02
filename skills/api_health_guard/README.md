# API Health Guard

Monitor API rate limits, credits, and errors. Alert before exhaustion. Auto-pause non-critical tasks when limits are hit.

## Purpose

Prevent workflow disruptions by proactively monitoring API health across all integrated services (Moonshot/Kimi, LinkedIn, Discord, etc.). When rate limits approach, automatically pause discretionary tasks and alert the user.

## When to Use

- Before starting any batch operation (LinkedIn engagement, news digest, skill suggestions)
- When receiving repeated API errors
- As part of daily system checks
- After adding new API integrations

## Inputs

| Parameter | Required | Description |
|-----------|----------|-------------|
| `apis` | No | List of APIs to check (defaults to all known) |
| `pause_tasks` | No | Array of task names to auto-pause on limit (optional) |
| `alert_threshold` | No | Percentage at which to alert (default: 80%) |

## Outputs

- Health status report
- Paused task notifications (if triggered)
- Recommendation for task deferral

## Owner

`OPS` — Infrastructure and reliability

## Related

- `daily-ops` skill — Uses this for pre-flight checks
- `linkedin_engagement_v1` — Depends on this to avoid rate limit hits
