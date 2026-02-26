# Social Media Ops - Output Schema

## File Structure
```
memory/content/{{date}}/
├── draft_post.md
├── pillar_alignment.md
├── voice_check.md
└── confidentiality_check.md
```

## draft_post.md

```markdown
# {{Platform}} Post: {{Topic}}
**Pillar:** {{pillar}}
**Type:** {{content_type}}
**Date:** {{date}}

---

{{post_content}}

---

**Character count:** {{n}}
**Estimated read time:** {{minutes}} min
```

## pillar_alignment.md

```markdown
# Pillar Alignment

**Primary Pillar:** {{pillar_name}}
**Alignment:** {{how_content_reflects_pillar}}

**Secondary Pillars (if any):**
- {{pillar}}: {{connection}}

**Key Phrases from Pillar:**
- {{phrase_1}}
- {{phrase_2}}
```

## voice_check.md

```markdown
# Voice Check

| Attribute | Applied? | Evidence |
|-----------|----------|----------|
| Understated | ✅/❌ | {{evidence}} |
| Specific | ✅/❌ | {{evidence}} |
| Skeptical | ✅/❌ | {{evidence}} |
| Process-obsessed | ✅/❌ | {{evidence}} |
| Cross-domain | ✅/❌ | {{evidence}} |

**Micro-story Pattern:**
- [ ] Problem stated
- [ ] Experiment described
- [ ] Result shared
- [ ] Takeaway extracted

**Credibility Line:**
- Mode: {{include/subtle/omit}}
- Line used: {{line}}
- CV tone avoided: ✅/❌
```

## confidentiality_check.md

```markdown
# Confidentiality Verification

| Check | Status | Notes |
|-------|--------|-------|
| No client names | ✅/❌ | {{notes}} |
| No exact revenue | ✅/❌ | {{notes}} |
| No live positions | ✅/❌ | {{notes}} |
| No entry/exit prices | ✅/❌ | {{notes}} |
| No PnL figures | ✅/❌ | {{notes}} |
| No sensitive ops data | ✅/❌ | {{notes}} |

**Generalized References:**
- "A manufacturing client" vs {{actual_name}}
- "Recent work" vs {{specific_project}}
- Percentages used vs exact numbers

**Verdict:** ✅ CLEAR / ❌ NEEDS REVISION
```
