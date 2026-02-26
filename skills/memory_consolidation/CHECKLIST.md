# Memory Consolidation - QA Checklist

## Pre-Flight
- [ ] Scope clearly defined
- [ ] Target projects identified
- [ ] Original files are backed up
- [ ] Git status clean (or changes committed)

## Processing
- [ ] All files in date range reviewed
- [ ] No files accidentally deleted
- [ ] Secrets/redacted info not transferred
- [ ] Timestamps preserved

## Project File Updates
- [ ] Current Status section updated
- [ ] Key Decisions appended (not overwritten)
- [ ] Next Actions current and assigned
- [ ] Blockers section accurate
- [ ] No duplication of existing content

## Data Integrity
- [ ] Original files moved to consolidation/ (not deleted)
- [ ] Git history shows changes
- [ ] File permissions preserved
- [ ] No orphaned references

## Quality
- [ ] Information is actionable
- [ ] Bullets are concise (not verbose)
- [ ] Attribution clear (which agent, when)
- [ ] Links are valid

## Documentation
- [ ] consolidation_log.md written
- [ ] insights.md generated
- [ ] Updated project files committed

## Automation Check (if applicable)
- [ ] Systemd timer ran successfully
- [ ] No errors in logs
- [ ] Completion notification sent

## Sign-off
- [ ] QA: Pass / Fail
- [ ] Reason: {{if_fail_explain}}

---
**Status:** ☐ PASS ☐ FAIL
**Completed:** {{date}}
**Agent:** {{agent_id}}
