# Memory Consolidation - Prompt Template

```
Execute memory consolidation with the following parameters:

CONSOLIDATION_SCOPE: {{consolidation_scope}}
TARGET_PROJECTS: {{target_projects}}
DATE_RANGE: {{date_range}}

TASKS:
1. Read memory files in scope:
   - Daily notes (memory/YYYY-MM-DD.md)
   - Agent session logs
   - Improvement files
2. For each target project:
   - Extract status updates
   - Capture key decisions
   - Note action items
   - Identify blockers
3. Update project files (memory/projects/PROJECT.md):
   - Append to Current Status
   - Add dated entries to Key Decisions
   - Update Next Actions
4. Archive processed files (memory/consolidation/)
5. Generate consolidation log
6. Identify patterns/insights

CONSTRAINTS:
- Never delete original files (move to consolidation/)
- Don't store secrets in project files
- Preserve timestamps and attribution
- Be concise (bullet points, not paragraphs)
- Focus on actionable information

DELIVERABLES:
- Consolidation log
- Updated project files
- Insights summary
```

## Example Usage

```
Execute memory consolidation with the following parameters:

CONSOLIDATION_SCOPE: weekly
TARGET_PROJECTS: ["PROCUREAI", "TRADING_ICT2022"]
DATE_RANGE: 2026-02-20 to 2026-02-26

TASKS:
1. Read memory files in scope...
```
