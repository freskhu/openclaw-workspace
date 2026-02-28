# LinkedIn Engagement Skill

Automated LinkedIn engagement with approval workflow.

## What It Does

- Scans LinkedIn feed daily for relevant posts
- Builds engagement queue (likes + comments)
- Posts queue to Discord #product-hunt for approval
- Executes approved engagements via browser
- Logs all activity

## Daily Schedule

| Time | Action |
|------|--------|
| 09:00 | Morning engagement queue |
| 21:00 | Evening engagement queue |

## Rate Limits

- **10 likes per day** (hard limit)
- **3 comments per day** (hard limit)
- Comments require manual "Post" click (safety)

## Configuration

See `/home/freskhy/projects/openclaw-workspace/config/linkedin_engagement.yaml`

Key settings:
- Topics: AI agents, procurement, operations, manufacturing, crypto, MBA, etc.
- Voice: Executive, direct, operator-builder
- Approval required: Yes

## Manual Execution

```bash
# Run engagement routine manually
cd ~/projects/openclaw-workspace
openclaw agent run social --task="Execute LinkedIn engagement daily routine"
```

## Logs

Location: `logs/linkedin_engagement_YYYYMMDD.jsonl`

## Troubleshooting

**Service fails with exit 203:**
- Check openclaw path: `which openclaw`
- Verify agent exists: `ls ~/.openclaw/agents/social/`
- Check config exists: `cat ~/projects/openclaw-workspace/config/linkedin_engagement.yaml`

**Discord not posting:**
- Verify channel access
- Check guild ID in config

**Browser session expired:**
- Manually log into LinkedIn
- Session persists until logout
