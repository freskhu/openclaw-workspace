# Investor Demo Readiness - Prompt Template

```
Prepare ProcureAI for investor demo with the following parameters:

DEMO_DATE: {{demo_date}}
DEMO_TYPE: {{demo_type}}
INVESTOR_FOCUS: {{investor_focus}}
DRY_RUN_REQUIRED: {{dry_run_required}}

TASKS:
1. Audit demo environment stability
2. Verify seed data is compelling and realistic
3. Test critical demo paths end-to-end:
   - Login → Dashboard
   - Create RFQ → AI generates quotes
   - Compare suppliers → Analytics
   - Export/Share functionality
4. Identify and fix any blocking bugs
5. Create demo script with timing
6. Document known limitations (what not to show)
7. {{#dry_run_required}}Conduct dry run and capture feedback{{/dry_run_required}}
8. Generate readiness report with Go/No-go

CONSTRAINTS:
- Demo path must be bulletproof (100% success rate)
- No experimental/untested features
- Data must tell a compelling story
- Keep demo under 15 minutes
- Have backup plans for each segment

DELIVERABLES:
- Readiness report (Go/No-go)
- Demo script with timing
- Risk register
- Dry run notes (if applicable)
```

## Example Usage

```
Prepare ProcureAI for investor demo with the following parameters:

DEMO_DATE: 2026-03-15
DEMO_TYPE: live
INVESTOR_FOCUS: ["ai_capabilities", "market_traction", "ux_polish"]
DRY_RUN_REQUIRED: true

TASKS:
1. Audit demo environment...
```
