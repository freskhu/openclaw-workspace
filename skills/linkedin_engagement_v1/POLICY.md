# LinkedIn Engagement Policy

## Rate Limits (Hard Constraints)

| Action | Daily Max | Enforcement |
|--------|-----------|-------------|
| Likes | 10 | Counter in daily routine, stop at limit |
| Comments | 3 | Counter in daily routine, stop at limit |
| Total engagements | 13 | Hard ceiling |

**Rule:** If Simão approves more than limits allow, execute only up to limit (priority: first approved). Log skipped items.

---

## Do / Don't

### ✅ DO
- Write comments that sound like Simão wrote them
- Be specific (reference actual post content)
- Add value (insight, question, relevant experience)
- Keep comments 2-4 lines max
- Use executive/operator voice (direct, no fluff)
- Wait for explicit approval on every item
- Log everything (timestamp, URL, action, result)
- Stop execution if browser session invalid

### ❌ DON'T
- Never automate the "Post" button click
- Never engage without approval
- Never exceed rate limits
- Never include confidential info in comments
- Never mention specific client names
- Never share trading positions, PnL, or entries
- Never use generic "Great post!" comments
- Never engage with competitor posts in a way that reveals strategy

---

## Confidentiality Rules for Comments

**Never include:**
- Specific client names (use "a manufacturing client" or generalize)
- Exact revenue/profit numbers
- Live trading positions or strategies
- Entry/exit prices or PnL
- Sensitive operational data
- Internal project code names

**Instead:**
- Generalize: "Working with a mid-market manufacturer..."
- Use principles: "The pattern we see..."
- Reference public info only
- Focus on methodology, not specifics

---

## Approval Protocol

**Valid approval formats:**
- `Approve 1,3,5` → Execute items 1, 3, and 5
- `Approve all` → Execute all items in queue
- `Approve 1-3` → Execute items 1, 2, and 3
- `Reject` → Execute nothing
- `Reject, draft new` → Discard queue, start over

**Invalid formats (require clarification):**
- `Yes` (ambiguous)
- `Do it` (ambiguous)
- `1 and 2` (missing "Approve")

**Execution rule:** Only execute items explicitly approved. When in doubt, ask for clarification.

---

## Browser Session Management

1. **Login:** Manual only (Simão logs in, session persists)
2. **Session check:** Before daily routine, verify feed loads
3. **Session expired:** Stop execution, ask Simão to re-login
4. **Logout:** Never automated

---

## Voice Guidelines for Comments

**Tone:** Executive, direct, operator-builder

**Style:**
- Short sentences
- Specific observations
- Questions that show expertise
- References to own experience (generalized)

**Examples:**

❌ Bad: "Great insights! Thanks for sharing."

✅ Good: "We've seen similar friction in procurement workflows. The 80/20 rule applies — most delays come from 20% of handoff points. Have you mapped the critical path?"

❌ Bad: "Love this! So inspiring."

✅ Good: "3D printed a similar bracket last month. Third iteration held 15kg. Orientation mattered more than infill — curious if you found the same?"

---

## Fallback Behavior

**If browser feed extraction fails:**
1. Ask Simão to provide 5-10 post URLs
2. Format: "Please paste 5-10 LinkedIn post URLs you'd like me to review"
3. Build queue from provided URLs
4. Continue with normal workflow

**If Discord unavailable:**
1. Log queue locally
2. Ask Simão for approval via current channel
3. Execute approved items
4. Log result
