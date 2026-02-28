#!/bin/bash
# LinkedIn Daily Engagement Script
# Runs the LinkedIn engagement routine

set -e

# Config
WORKSPACE="/home/freskhy/.openclaw/workspace-social"
CONFIG="/home/freskhy/projects/openclaw-workspace/config/linkedin_engagement.yaml"
LOG_DIR="/home/freskhy/projects/openclaw-workspace/logs"
DATE=$(date +%Y%m%d)

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Run engagement routine
cd "$WORKSPACE"

# Use openclaw to run the social agent
/home/freskhy/.npm-global/bin/openclaw agent \
  --agent social \
  --message "Execute LinkedIn engagement daily routine" \
  --reply-channel discord \
  --reply-to "product-hunt" \
  --deliver \
  2>&1 | tee -a "$LOG_DIR/linkedin_engagement_${DATE}.log"

exit ${PIPESTATUS[0]}
