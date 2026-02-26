# Social Media Ops v1

## Purpose
Execute social media content operations across LinkedIn and X (Twitter) while maintaining consistent voice, persona pillars, and confidentiality.

## When to Use
- Regular content calendar execution
- Event-based posts (milestones, launches)
- Thread development
- Cross-platform adaptation
- Engagement monitoring and response

## Inputs
| Input | Type | Description |
|-------|------|-------------|
| `content_type` | enum | linkedin_long, x_short, x_thread, engagement_reply |
| `pillar` | string | Which pillar to anchor on (see PILLARS.md) |
| `topic` | string | Specific topic or angle |
| `credibility_mode` | enum | include, subtle, omit |
| `platform` | string | linkedin, x, or both |

## Outputs
| Output | Type | Description |
|--------|------|-------------|
| `draft_post` | markdown | Ready-to-post content |
| `pillar_alignment` | markdown | Which pillar(s) and why |
| `voice_check` | markdown | How voice guidelines were applied |
| `confidentiality_check` | markdown | Verification of no sensitive info |

## Owner Agent(s)
- **Primary:** `growth` or `pm`
- **Secondary:** Human review for sensitive posts

## Dependencies
- PILLARS.md for content pillars
- VOICE_GUIDE.md for tone and style
- SAMPLE_POSTS.md for reference patterns

## Success Metrics
- Content aligns with at least one pillar
- Voice consistency maintained
- No confidentiality violations
- Engagement rate trend positive
