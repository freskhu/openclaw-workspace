# LinkedIn Engagement - QA Checklist

## Pre-Flight
- [ ] Config file loaded (config/linkedin_engagement.yaml)
- [ ] POLICY.md reviewed
- [ ] Rate limits noted (10 likes, 3 comments)
- [ ] Browser profile "openclaw" available

## Session Validation
- [ ] Navigated to linkedin.com/feed
- [ ] Feed loads successfully
- [ ] Session is valid (not logged out)
- [ ] If session invalid: STOP, ask for manual login

## Queue Building
- [ ] 5 candidates selected
- [ ] Each matches persona topics from config
- [ ] URLs recorded correctly
- [ ] Post previews captured (if feed scan)

## Draft Quality
- [ ] Each comment 2-4 lines max
- [ ] Voice matches executive/operator tone
- [ ] Specific to post content (not generic)
- [ ] Adds value (insight, question, experience)
- [ ] No confidentiality violations
- [ ] No hype words (leverage, disrupt, synergy)

## Approval Protocol
- [ ] Queue posted to Discord #product-hunt
- [ ] Clear instructions for approval
- [ ] Simão's reply received
- [ ] Reply parsed correctly (valid format)
- [ ] Only approved items marked for execution
- [ ] Rate limits checked against approvals

## Execution Safety
- [ ] Only approved items executed
- [ ] Like actions: click only Like button
- [ ] Comment actions: paste only, STOP before Post
- [ ] Manual Post button click requested
- [ ] Confirmation received before logging success
- [ ] Rate limits never exceeded

## Confidentiality Check
- [ ] No client names in comments
- [ ] No specific revenue numbers
- [ ] No trading positions mentioned
- [ ] No PnL or entry/exit prices
- [ ] Generalized references only

## Logging
- [ ] All actions logged to jsonl
- [ ] Timestamp included
- [ ] URL recorded
- [ ] Action type (like/comment) recorded
- [ ] Draft text recorded (for comments)
- [ ] Approval status recorded
- [ ] Result recorded
- [ ] No credentials in log

## Post-Execution
- [ ] Summary posted to Discord
- [ ] Log file path shared
- [ ] Rate limit counter reset for next day

## Sign-off
- [ ] QA: Pass / Fail
- [ ] Reason: {{if_fail_explain}}

---
**Status:** ☐ PASS ☐ FAIL
**Completed:** {{date}}
**Agent:** M01_SOCIAL
