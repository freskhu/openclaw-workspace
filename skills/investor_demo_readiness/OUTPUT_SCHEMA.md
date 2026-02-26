# Investor Demo Readiness - Output Schema

## File Structure
```
memory/demos/{{demo_date}}/
├── readiness_report.md
├── demo_script.md
├── risk_register.md
└── dry_run_notes.md
```

## readiness_report.md

```markdown
# Investor Demo Readiness Report
**Demo Date:** {{demo_date}}
**Demo Type:** {{demo_type}}
**Focus Areas:** {{investor_focus}}

## Executive Summary
**Status:** ☐ GO ☐ NO-GO ☐ GO WITH CAVEATS

## Environment Status
| Component | Status | Notes |
|-----------|--------|-------|
| Production deploy | ✅/⚠️/❌ | |
| Seed data fresh | ✅/⚠️/❌ | |
| Feature flags set | ✅/⚠️/❌ | |
| Performance OK | ✅/⚠️/❌ | |

## Critical Path Tests
- [ ] Login flow: {{result}}
- [ ] RFQ creation: {{result}}
- [ ] AI quote generation: {{result}}
- [ ] Supplier comparison: {{result}}
- [ ] Analytics dashboard: {{result}}
- [ ] Export functionality: {{result}}

## Blockers
{{list_any_blockers}}

## Recommendations
{{recommendations}}
```

## demo_script.md

```markdown
# Demo Script: ProcureAI
**Target Duration:** 12 minutes
**Focus:** {{investor_focus}}

## Opening (1 min)
Hook: {{one_sentence_pitch}}

## Segment 1: The Problem (2 min)
- Show current pain point
- Demo actions: {{steps}}

## Segment 2: The Solution (4 min)
- Core workflow demonstration
- Demo actions: {{steps}}

## Segment 3: AI Differentiation (3 min)
- AI-powered features
- Demo actions: {{steps}}

## Segment 4: Traction/Scale (2 min)
- Analytics, metrics
- Demo actions: {{steps}}

## Backup Plans
{{what_if_scenarios}}
```

## risk_register.md

```markdown
# Demo Risk Register

| Risk | Likelihood | Impact | Mitigation | Owner |
|------|------------|--------|------------|-------|
| {{risk}} | High/Med/Low | High/Med/Low | {{action}} | {{agent}} |
```
