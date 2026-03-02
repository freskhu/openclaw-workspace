# API Health Guard — QA Checklist

## Pre-Execution

- [ ] Can read `.state/` directory
- [ ] Can write to `.state/` directory
- [ ] Can read log files (last 24h)
- [ ] API list is current (check for new integrations)

## During Execution

- [ ] All configured APIs are checked
- [ ] Usage percentages are calculated correctly
- [ ] Error counts are accurate (last 24h window)
- [ ] Health scores follow defined criteria
- [ ] No API keys exposed in outputs

## Action Validation

- [ ] Critical APIs trigger task pause
- [ ] Paused tasks are logged correctly
- [ ] State files updated before alerting
- [ ] Retry time is reasonable (not immediate)

## Post-Execution

- [ ] `api_health_latest.json` exists and is valid JSON
- [ ] If critical: Alert file exists in `memory/alerts/`
- [ ] If critical: User notification sent with @freskhy
- [ ] If tasks paused: Task state files updated

## Edge Cases

- [ ] Handles missing state files (first run)
- [ ] Handles unreadable logs (permissions)
- [ ] Handles unknown API in config (warn, don't fail)
- [ ] Handles all APIs healthy (clean report)

## Review Schedule

- Run: Before every batch operation
- Full audit: Weekly as part of `daily-ops`
- Update thresholds: When adding new APIs
