# LinkedIn Engagement - Daily Routine Prompt

```
Execute LinkedIn engagement daily routine as M01_SOCIAL.

CONFIG: config/linkedin_engagement.yaml
POLICY: skills/linkedin_engagement_v1/POLICY.md
VOICE: skills/social_media_ops_v1/VOICE_GUIDE.md

DAILY ROUTINE:

STEP 1: Session Check
- Verify browser profile "openclaw" is active
- Navigate to linkedin.com/feed
- Confirm feed loads (session valid)
- If session invalid: STOP, ask Simão to login via docs/ops/LINKEDIN_LOGIN.md

STEP 2: Build Engagement Queue (5 candidates)

OPTION A (Preferred): Browser Feed Scan
- Use browser tool to extract feed posts
- Filter for posts matching topics from config:
  - AI agents
  - Procurement
  - Operations
  - Manufacturing
  - Cybersecurity/networking
  - Crypto/web3 (no hype)
  - 3D printing
  - MBA/learning loop
- Select top 5 most relevant posts
- Record: URL, author, post preview (first 100 chars)

OPTION B (Fallback): URL Collection
- If feed extraction unreliable:
- Ask Simão: "Please paste 5-10 LinkedIn post URLs you'd like me to review for engagement"
- Wait for URLs
- Record each URL

STEP 3: Draft Actions (for each of 5 candidates)

For each post:
1. Read post content
2. Decide: Like OR Comment
   - Like: Low effort, broad relevance
   - Comment: High relevance, Simão has specific insight to add
3. If Comment:
   - Draft 2-4 line comment in Simão's voice
   - Reference specific content from post
   - Add value (question, insight, relevant experience)
   - Check against POLICY.md confidentiality rules
4. Write 1-line reason why it fits persona

STEP 4: Post Queue to Discord (#product-hunt)

Format:
---
📋 **LinkedIn Engagement Queue - {{date}}**

**Daily Limits:** 10 likes, 3 comments

**Item 1:**
- URL: {{url}}
- Action: {{Like/Comment}}
- Draft: "{{comment_text}}"
- Reason: {{why_fits_persona}}

**Item 2:**
...

Reply with: "Approve 1,3" or "Approve all" or "Reject"
---

STEP 5: Wait for Approval
- Monitor #product-hunt for Simão's reply
- Parse approval (see POLICY.md for valid formats)
- If ambiguous: ask for clarification

STEP 6: Execute Approved Items

For each approved item:
1. Open URL in browser
2. If action=Like:
   - Click Like button
   - Log: ts, url, action=like, result=success
3. If action=Comment:
   - Click Comment field
   - Paste drafted comment
   - STOP
   - Ask Simão: "Please click 'Post' to publish this comment"
   - Wait for confirmation
   - Log: ts, url, action=comment, drafted_text, approved=true, result=posted

STEP 7: Logging
- Write to logs/linkedin_engagement_{{date}}.jsonl
- Fields: ts, url, action, drafted_text, approved, result

STEP 8: Summary
- Post to Discord: "Completed {{n}} engagements ({{likes}} likes, {{comments}} comments). Log: {{log_file}}"

CONSTRAINTS:
- Never exceed daily limits from config
- Never automate "Post" button
- Never engage without approval
- Never include confidential info
- Always use manual login (no credentials stored)
```
