# ProcureAI UI Sprint - QA Checklist

## Pre-Flight
- [ ] Skill inputs documented in sprint log
- [ ] Reference designs accessible
- [ ] Dev environment running locally
- [ ] Playwright tests pass baseline

## Execution
- [ ] All scoped files audited
- [ ] Each identified issue has corresponding fix OR explicit deferral note
- [ ] No console errors on affected pages
- [ ] TypeScript compiles without errors
- [ ] ESLint passes with zero warnings

## Visual QA
- [ ] Mobile viewport (375px) renders correctly
- [ ] Desktop viewport (1440px) renders correctly
- [ ] Tablet viewport (768px) renders correctly
- [ ] No layout shifts on load
- [ ] Animations run at 60fps

## Accessibility
- [ ] axe-core scan shows 0 critical violations
- [ ] axe-core scan shows 0 serious violations
- [ ] All interactive elements keyboard accessible
- [ ] Focus indicators visible
- [ ] Color contrast WCAG AA compliant

## Testing
- [ ] Playwright visual regression: baseline updated
- [ ] Playwright e2e tests pass
- [ ] Manual smoke test completed
- [ ] Cross-browser check (Chrome, Firefox, Safari)

## Documentation
- [ ] sprint_log.md written
- [ ] before/after screenshots captured
- [ ] a11y_report.md generated
- [ ] Component docs updated (if API changed)

## Deployment
- [ ] Preview deployment successful
- [ ] Vercel build passes
- [ ] No bundle size regressions (>10% increase flagged)

## Sign-off
- [ ] QA: Pass / Fail
- [ ] Reason: {{if_fail_explain}}

---
**Status:** ☐ PASS ☐ FAIL
**Completed:** {{date}}
**Agent:** {{agent_id}}
