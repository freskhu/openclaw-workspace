#!/bin/bash
# LinkedIn Engagement Automation
# Runs at 10:00 AM daily

set -e

LOG_FILE="/home/freskhy/.openclaw/workspace-social/logs/engagement-$(date +%Y-%m-%d-%H%M).log"
mkdir -p "$(dirname "$LOG_FILE")"

exec > >(tee -a "$LOG_FILE") 2>&1

echo "=== LinkedIn Engagement Run: $(date) ==="

# Use openclaw to spawn the social agent for LinkedIn engagement
# IMPORTANT: Must use browser to navigate to LinkedIn feed and extract REAL posts
/home/freskhy/.npm-global/bin/openclaw sessions spawn \
    --agent social \
    --mode run \
    --task "Go to LinkedIn.com and browse the feed to find 5 REAL posts from today/yesterday in AI, automation, crypto, or trading spaces. You MUST use the browser tool to navigate to linkedin.com, scroll the feed, and extract actual post URLs and author names. Do NOT make up posts - only use posts you can actually see on the screen. For each real post found, draft engagement recommendations (like vs comment with draft text) and queue them to Discord #product-hunt for approval. If LinkedIn requires login, ask for credentials or abort." \
    --timeout-seconds 600

echo "=== Completed: $(date) ==="
