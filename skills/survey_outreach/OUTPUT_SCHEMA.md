# Survey Outreach - Output Schema

## File Structure
```
memory/surveys/{{survey_id}}/
├── survey_design.md
├── outreach_template.md
├── response_data.csv
├── analysis_report.md
└── action_items.md
```

## survey_design.md

```markdown
# Survey Design: {{survey_goal}}
**Audience:** {{target_audience}}
**Channel:** {{channel}}

## Objectives
{{what_we_want_to_learn}}

## Questions

### Screener (if applicable)
Q1. {{question}}
- Option A
- Option B

### Core Questions
Q2. {{question}} [Scale 1-5]
Q3. {{question}} [Multiple choice]
Q4. {{question}} [Open text]

### Demographics
Q9. Company size
Q10. Role

## Flow Logic
{{skip_logic_if_any}}

## Estimated Time
{{minutes}} minutes
```

## analysis_report.md

```markdown
# Survey Analysis: {{survey_goal}}
**Responses:** {{n}} / {{target}}
**Response Rate:** {{percent}}%
**Fielded:** {{dates}}

## Key Findings

### Finding 1: {{title}}
**Evidence:** {{data_points}}
**Implication:** {{what_it_means}}

### Finding 2: {{title}}
...

## Segment Analysis
| Segment | Response Count | Key Difference |
|---------|---------------|----------------|
| {{segment}} | {{n}} | {{difference}} |

## Verbatim Highlights
> "{{quote}}" — {{segment}}

## Statistical Significance
{{notes_on_confidence}}
```

## action_items.md

```markdown
# Recommended Actions

## Immediate (This Week)
- [ ] {{action}} | Priority: P0/P1 | Owner: {{role}}

## Short-term (This Month)
- [ ] {{action}} | Priority: P1/P2 | Owner: {{role}}

## Long-term (This Quarter)
- [ ] {{action}} | Priority: P2/P3 | Owner: {{role}}

## Not Doing (Rationale)
- {{idea}}: {{why_not}}
```
