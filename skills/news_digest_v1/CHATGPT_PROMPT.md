# PROMPT FOR CHATGPT

Copy and paste this into ChatGPT:

---

## PROMPT START

I need to set up an automated daily news digest system using OpenClaw (an AI agent platform). 

### CURRENT SETUP:
- Agent: "social" agent in OpenClaw
- Sources: The Economist, Financial Times, Jornal Económico, MIT Sloan Management Review
- Schedule: Daily at 8:00 AM
- Email account: max-news-claw@proton.me (ProtonMail)
- ProtonMail Bridge: Installed and running on localhost:1025
- Password: NewsBot2026!Secure (web password, NOT Bridge SMTP password)

### PROBLEM:
The ProtonMail Bridge requires separate SMTP credentials (username/password) that are different from the web login. I need to:

1. Get the Bridge SMTP credentials (local username/password for localhost:1025)
2. Store them securely (not hardcoded in scripts)
3. Configure the news_digest.py script to use them
4. Set up daily automation via systemd or cron

### REQUIREMENTS:

**Security:**
- Credentials must NOT be stored in git
- Use environment variables or a separate credentials file (chmod 600)
- Script should fail gracefully if credentials missing

**Functionality:**
- Fetch RSS from 4 sources
- Generate markdown report with headlines + summaries
- Email via ProtonMail Bridge (127.0.0.1:1025)
- Fallback to Discord if email fails
- Log all activity to JSONL

**Automation:**
- Systemd timer (preferred) or cron
- Run daily at 8:00 AM Europe/Lisbon
- Restart Bridge if not running

### DELIVERABLE:
Give me step-by-step instructions I can give to my OpenClaw agent (MAX) to:
1. Get ProtonMail Bridge SMTP credentials
2. Store them securely
3. Update the Python script
4. Set up systemd automation
5. Test the full flow

Include exact commands and file paths.

---

## PROMPT END

---

After ChatGPT gives you the instructions, paste them here and I'll execute them step by step.
