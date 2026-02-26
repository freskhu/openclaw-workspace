# Investor Demo Readiness - QA Checklist

## Environment Setup
- [ ] Demo environment is production-stable (not dev)
- [ ] Database has fresh, compelling seed data
- [ ] All feature flags configured for demo
- [ ] No experimental features enabled
- [ ] Environment monitored (alerts configured)

## Critical Path Validation
- [ ] Login flow: 100% success rate (test 5x)
- [ ] RFQ creation: Works every time
- [ ] AI quote generation: < 5 second response
- [ ] Supplier comparison: Loads without errors
- [ ] Analytics dashboard: Real data visible
- [ ] Export functionality: Generates valid file
- [ ] No 404s or broken links in demo path

## Performance
- [ ] Page load < 3 seconds on wifi
- [ ] No layout shifts during demo
- [ ] Animations smooth (60fps)
- [ ] Mobile responsive (if showing on phone)

## Data Quality
- [ ] Seed data tells compelling story
- [ ] Metrics look realistic (not zero, not fake-high)
- [ ] No placeholder text visible
- [ ] All images load correctly

## Demo Script
- [ ] Script written with timing marks
- [ ] Total duration under 15 minutes
- [ ] All investor_focus areas covered
- [ ] Backup plans documented for each segment
- [ ] "Don't show" list documented

## Dry Run (if required)
- [ ] Dry run completed with team
- [ ] Timing validated
- [ ] Feedback captured
- [ ] Adjustments made

## Contingencies
- [ ] Internet backup (hotspot ready)
- [ ] Local demo environment as fallback
- [ ] Screenshots/video as last resort
- [ ] Team knows who speaks when

## Sign-off
- [ ] QA: Pass / Fail
- [ ] Reason: {{if_fail_explain}}

---
**Status:** ☐ GO ☐ NO-GO ☐ GO WITH CAVEATS
**Completed:** {{date}}
**Agent:** {{agent_id}}
