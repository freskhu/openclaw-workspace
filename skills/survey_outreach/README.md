# Survey Outreach

## Purpose
Design, execute, and analyze customer/user surveys to gather product feedback, validate assumptions, or measure satisfaction.

## When to Use
- Validating new feature concepts
- Measuring product-market fit
- Gathering testimonials/case studies
- Quarterly customer satisfaction check
- Pre-launch demand validation

## Inputs
| Input | Type | Description |
|-------|------|-------------|
| `survey_goal` | string | What we're trying to learn |
| `target_audience` | string | Who to survey |
| `channel` | enum | email, in-app, phone, interview |
| `sample_size` | number | Target responses |
| `timeline` | string | When results needed |

## Outputs
| Output | Type | Description |
|--------|------|-------------|
| `survey_design` | markdown | Questions and flow |
| `response_data` | csv/json | Raw responses |
| `analysis_report` | markdown | Key insights |
| `action_items` | markdown | Recommended actions |

## Owner Agent(s)
- **Primary:** `pm` (Product Manager)
- **Secondary:** `growth` or `marketing`

## Dependencies
- Survey tool (Typeform, Google Forms, etc.)
- Contact list / user database
- Email delivery system (if email channel)

## Success Metrics
- Response rate ≥ 15% (email) or ≥ 30% (in-app)
- Sample size achieved
- Actionable insights identified
- No leading/biased questions
