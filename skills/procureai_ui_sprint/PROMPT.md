# ProcureAI UI Sprint - Prompt Template

```
Execute a UI Sprint for ProcureAI with the following parameters:

GOAL: {{sprint_goal}}
SCOPE: {{scope}}
DEADLINE: {{deadline}}
{{#reference_design}}
REFERENCE: {{reference_design}}
{{/reference_design}}

TASKS:
1. Audit current state of scoped components/pages
2. Identify visual bugs, layout issues, and a11y problems
3. Implement fixes following existing design system
4. Run visual regression tests (Playwright)
5. Update component documentation if needed
6. Deploy to preview environment
7. Generate before/after screenshots

CONSTRAINTS:
- Do not break existing API contracts
- Maintain TypeScript strict mode compliance
- Follow existing component patterns in components/ui/
- Test on mobile viewport (375px) and desktop (1440px)

DELIVERABLES:
- List of modified files
- Screenshots showing improvements
- Brief sprint log documenting decisions
```

## Example Usage

```
Execute a UI Sprint for ProcureAI with the following parameters:

GOAL: Polish the RFQ creation flow for investor demo
SCOPE: ["/app/rfqs/page.tsx", "components/ui/dialog.tsx", "components/ui/form"]
DEADLINE: 2026-03-01
REFERENCE: https://www.figma.com/file/ABC123/ProcureAI-Design

TASKS:
1. Audit current state...
```
