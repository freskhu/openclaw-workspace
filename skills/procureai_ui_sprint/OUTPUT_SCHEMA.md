# ProcureAI UI Sprint - Output Schema

## File Structure
```
memory/sprints/ui-{{date}}/
├── sprint_log.md
├── before_after/
│   ├── {{component}}-before.png
│   ├── {{component}}-after.png
│   └── ...
├── a11y_report.md
└── checklist_results.md
```

## sprint_log.md

```markdown
# UI Sprint: {{sprint_goal}}
**Date:** {{date}}
**Duration:** {{hours}}h
**Scope:** {{scope}}

## Changes Made
| File | Change | Rationale |
|------|--------|-----------|
| path/to/file.tsx | Description | Why this change |

## Decisions
- Decision 1: ...
- Decision 2: ...

## Blockers
None / List any blockers encountered
```

## a11y_report.md

```markdown
# Accessibility Report

## Scanned Pages
- [ ] Page 1
- [ ] Page 2

## Issues Found
| Severity | Issue | Location | Fix Applied |
|----------|-------|----------|-------------|
| Critical | Missing alt text | Component X | ✅ Fixed |
| Warning | Low contrast | Button Y | ⚠️ Deferred |

## axe-core Results
- Violations: {{count}}
- Passes: {{count}}
```

## checklist_results.md

Completion status for all CHECKLIST.md items with pass/fail notes.
