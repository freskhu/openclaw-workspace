# LinkedIn Engagement - Output Schema

## File Structure

```
logs/
└── linkedin_engagement_YYYYMMDD.jsonl

queue_backups/
└── queue_YYYYMMDD_HHMMSS.json
```

## Log Format (jsonl)

Each line is a JSON object:

```json
{
  "ts": "2026-02-26T14:32:10Z",
  "url": "https://www.linkedin.com/posts/...",
  "action": "like|comment",
  "drafted_text": "Comment text here... (null for likes)",
  "approved": true,
  "result": "success|skipped|failed",
  "reason": "if_skipped_or_failed"
}
```

### Example Log Entries

```jsonl
{"ts":"2026-02-26T14:30:00Z","url":"https://www.linkedin.com/posts/user1_ai-procurement","action":"like","drafted_text":null,"approved":true,"result":"success"}
{"ts":"2026-02-26T14:31:15Z","url":"https://www.linkedin.com/posts/user2_3d-printing","action":"comment","drafted_text":"We've seen similar tolerance issues. Third iteration usually holds — orientation matters more than infill.","approved":true,"result":"success"}
{"ts":"2026-02-26T14:32:00Z","url":"https://www.linkedin.com/posts/user3_crypto","action":"comment","drafted_text":null,"approved":false,"result":"skipped","reason":"rate_limit_exceeded"}
```

## Queue Format (Discord Message)

```markdown
📋 **LinkedIn Engagement Queue - 2026-02-26**

**Daily Limits:** 10 likes, 3 comments | **Used:** 0 likes, 0 comments

---

**Item 1:** ⭐ High relevance
- **URL:** https://www.linkedin.com/posts/user_ai-procurement
- **Action:** Comment
- **Draft:** "The 80/20 rule applies to procurement workflows. Most delays come from 20% of handoff points. Have you mapped where those typically occur?"
- **Reason:** Direct expertise match on procurement + systems thinking

**Item 2:**
- **URL:** https://www.linkedin.com/posts/user2_3d-printing
- **Action:** Like
- **Draft:** N/A
- **Reason:** Relevant to maker pillar, but no specific insight to add

**Item 3:** ⭐ High relevance
- **URL:** https://www.linkedin.com/posts/user3_mba-learning
- **Action:** Comment
- **Draft:** "Engineering taught me to map the system. MBA taught me to act with 60% info. The tension between them is where interesting work happens."
- **Reason:** Perfect fit for learning loop pillar

**Item 4:**
- **URL:** https://www.linkedin.com/posts/user4_network-security
- **Action:** Like
- **Draft:** N/A
- **Reason:** Cybersecurity topic match

**Item 5:**
- **URL:** https://www.linkedin.com/posts/user5_operations
- **Action:** Comment
- **Draft:** "We've automated the RFQ draft process — 3 days to 4 hours. The key was identifying which 80% could be templated vs. which 20% needs human judgment."
- **Reason:** Operations + AI agents pillar

---

**Reply with:** `Approve 1,3,5` or `Approve all` or `Reject`

**Note:** Comments will be pasted but you'll need to click "Post" manually.
```

## Queue Backup Format (JSON)

```json
{
  "date": "2026-02-26",
  "timestamp": "2026-02-26T14:00:00Z",
  "items": [
    {
      "id": 1,
      "url": "https://www.linkedin.com/posts/...",
      "action": "comment",
      "draft": "Comment text...",
      "reason": "Direct expertise match",
      "priority": "high"
    }
  ],
  "approval_status": "pending",
  "approved_items": [],
  "daily_limits": {
    "likes_max": 10,
    "comments_max": 3,
    "likes_used": 0,
    "comments_used": 0
  }
}
```
