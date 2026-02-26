# LinkedIn Engagement v1

## Purpose
Execute daily LinkedIn engagement (likes and comments) in Simão's voice, with human approval required before any public action.

## Workflow Overview

```
Daily Routine (M01_SOCIAL):
├── 1. Build Engagement Queue (5 candidates)
│   ├── Option A: Browser scan of feed (if reliable)
│   └── Option B: Simão provides 5-10 URLs (fallback)
├── 2. Draft Actions
│   ├── Like or Comment decision per post
│   ├── Comment draft (2-4 lines, executive voice)
│   └── Reason why it fits persona
├── 3. Post Queue to Discord (#product-hunt)
│   ├── Numbered items 1-5
│   ├── URL + draft + action + reason
│   └── Wait for approval
├── 4. Approval Protocol
│   ├── Simão replies: "Approve 1,3" or "Approve all" or "Reject"
│   └── Only approved items executed
└── 5. Browser Execution (assisted)
    ├── Open each approved URL
    ├── Like: Click Like
    └── Comment: Paste draft, STOP for manual Post click
```

## Owner Agent
- **Primary:** `M01_SOCIAL`

## Dependencies
- OpenClaw browser tool
- LinkedIn session (manual login, persistent profile)
- Discord channel for approvals
- Config file: `config/linkedin_engagement.yaml`

## Rate Limits
| Action | Daily Max |
|--------|-----------|
| Likes | 10 |
| Comments | 3 |

## Safety Rules
- ❌ No credentials in repo/memory
- ❌ No automation of "Post" button (manual click required)
- ❌ No mass activity
- ❌ No confidential info in comments
- ✅ Always require approval
- ✅ Log all actions (no secrets)

## Automation

Runs automatically via systemd timer:
- **Schedule:** Daily at 9:00 AM Europe/Lisbon
- **Timer:** `linkedin-daily-engagement.timer`
- **Service:** `linkedin-daily-engagement.service`

**Install:**
```bash
sudo cp skills/linkedin_engagement_v1/systemd/linkedin-daily-engagement.* /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now linkedin-daily-engagement.timer
```

## Success Metrics
- 100% approval rate (never post without explicit approval)
- Zero credential leaks
- Rate limits never exceeded
- Comments sound authentic to persona
