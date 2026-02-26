# LinkedIn Engagement Sample Queue

## Template Message (for Discord #product-hunt)

```markdown
📋 **LinkedIn Engagement Queue - 2026-02-26**

**Daily Limits:** 10 likes, 3 comments | **Used:** 0 likes, 0 comments

---

**Item 1:** ⭐ High relevance
- **URL:** https://www.linkedin.com/posts/alice_ai-procurement-automation
- **Action:** Comment
- **Draft:** "The 80/20 rule applies to procurement workflows. Most delays come from 20% of handoff points. Have you mapped where those typically occur?"
- **Reason:** Direct expertise match on procurement + systems thinking

**Item 2:**
- **URL:** https://www.linkedin.com/posts/bob_3d-printing-tolerance
- **Action:** Like
- **Draft:** N/A
- **Reason:** Relevant to maker pillar, but no specific insight to add

**Item 3:** ⭐ High relevance
- **URL:** https://www.linkedin.com/posts/carol_mba-engineering-tension
- **Action:** Comment
- **Draft:** "Engineering taught me to map the system. MBA taught me to act with 60% info. The tension between them is where interesting work happens."
- **Reason:** Perfect fit for learning loop pillar

**Item 4:**
- **URL:** https://www.linkedin.com/posts/dave_network-security-zero-trust
- **Action:** Like
- **Draft:** N/A
- **Reason:** Cybersecurity topic match

**Item 5:** ⭐ High relevance
- **URL:** https://www.linkedin.com/posts/eve_operations-efficiency
- **Action:** Comment
- **Draft:** "We've automated the RFQ draft process — 3 days to 4 hours. The key was identifying which 80% could be templated vs. which 20% needs human judgment."
- **Reason:** Operations + AI agents pillar

---

**Reply with:** `Approve 1,3,5` or `Approve all` or `Reject`

**Note:** Comments will be pasted but you'll need to click "Post" manually.
```

---

## Sample Approval Responses

**Partial approval:**
> "Approve 1, 3, 5"

**Full approval:**
> "Approve all"

**Rejection:**
> "Reject"

**Rejection with restart:**
> "Reject, draft new"

---

## Execution Flow Example

1. **Queue posted** → Simão reviews
2. **Simão replies:** "Approve 1, 3"
3. **M01_SOCIAL executes:**
   - Item 1: Open URL → Click Like ✓
   - Item 2: Skip (not approved)
   - Item 3: Open URL → Click Comment field → Paste draft → STOP → "Simão, please click Post"
   - Item 4: Skip (not approved)
   - Item 5: Skip (rate limit: already used 2 comments)
4. **Log written:**
   ```jsonl
   {"ts":"2026-02-26T09:00:00Z","url":"...","action":"like","drafted_text":null,"approved":true,"result":"success"}
   {"ts":"2026-02-26T09:01:30Z","url":"...","action":"comment","drafted_text":"Engineering taught me...","approved":true,"result":"success"}
   ```
5. **Summary posted:** "Completed 2 engagements (1 like, 1 comment). Awaiting manual Post click for comment."
