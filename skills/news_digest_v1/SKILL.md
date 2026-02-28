# Daily News Digest Skill

Aggregates headlines from subscribed sources and delivers daily summary.

## Sources

| Source | Type | Language | Focus |
|--------|------|----------|-------|
| The Economist | Web/RSS | English | Global affairs, business, politics |
| Financial Times | Web/RSS | English | Finance, markets, business |
| Jornal Económico | Web/RSS | Portuguese | Portuguese business & economy |
| MIT Sloan Management Review | Web/RSS | English | Management, leadership, innovation |

## Schedule

Daily at 8:00 AM Europe/Lisbon

## Output Format

```
📰 Daily News Digest - 2026-02-27

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🌍 THE ECONOMIST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

• Headline 1
  Summary: 2-3 sentences
  🔗 Link

• Headline 2
  Summary: 2-3 sentences
  🔗 Link

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💰 FINANCIAL TIMES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

...

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🇵🇹 JORNAL ECONÓMICO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

...

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎓 MIT SLOAN MANAGEMENT REVIEW
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

...

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Total articles: X
Key themes: theme1, theme2, theme3
Must-read recommendation: Article X
```

## Delivery

Primary: Email
Fallback: Discord DM or channel

## Configuration

See `config/news_digest.yaml`

## Manual Run

```bash
./run_news_digest.sh
```
