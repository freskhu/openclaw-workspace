#!/bin/bash
# Daily News Digest Script
# Fetches headlines from configured sources and delivers summary

set -e

# Config
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE="/home/freskhy/.openclaw/workspace"
SKILL_DIR="${SCRIPT_DIR}"
CONFIG="${SKILL_DIR}/config/news_digest.yaml"
LOG_DIR="${WORKSPACE}/logs"
DATE=$(date +%Y-%m-%d)
DATE_SHORT=$(date +%Y%m%d)
TIMESTAMP=$(date -Iseconds)

# Ensure log directory exists
mkdir -p "$LOG_DIR"

LOG_FILE="${LOG_DIR}/news_digest_${DATE_SHORT}.jsonl"
REPORT_FILE="${LOG_DIR}/news_digest_report_${DATE_SHORT}.md"

echo "[{\"timestamp\":\"$TIMESTAMP\",\"event\":\"digest_start\",\"date\":\"$DATE\"}]" >> "$LOG_FILE"

# Generate report header
cat > "$REPORT_FILE" << EOF
📰 Daily News Digest - $DATE
Generated: $(date '+%H:%M %Z')

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

# Function to fetch RSS feed
fetch_rss() {
    local url="$1"
    local name="$2"
    local emoji="$3"
    local max="${4:-5}"
    
    echo "" >> "$REPORT_FILE"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >> "$REPORT_FILE"
    echo "$emoji $name" >> "$REPORT_FILE"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
    
    # Try to fetch via curl
    local rss_content
    if rss_content=$(curl -s -L -A "Mozilla/5.0 (compatible; NewsBot/1.0)" "$url" 2>/dev/null | head -c 50000); then
        
        # Parse RSS items (title, link, description)
        local count=0
        echo "$rss_content" | grep -oP '(?<=<item>).*?(?=</item>)' | head -n "$max" | while read -r item; do
            count=$((count + 1))
            
            # Extract title
            local title=$(echo "$item" | grep -oP '(?<=<title>)[^<]+' | head -1 | sed 's/<!\[CDATA\[//g; s/\]\]>//g')
            
            # Extract link
            local link=$(echo "$item" | grep -oP '(?<=<link>)[^<]+' | head -1)
            
            # Extract description (truncated)
            local desc=$(echo "$item" | grep -oP '(?<=<description>)[^<]+' | head -1 | sed 's/<!\[CDATA\[//g; s/\]\]>//g' | cut -c1-200)
            
            if [ -n "$title" ]; then
                echo "• $title" >> "$REPORT_FILE"
                if [ -n "$desc" ]; then
                    echo "  $desc" >> "$REPORT_FILE"
                fi
                if [ -n "$link" ]; then
                    echo "  🔗 $link" >> "$REPORT_FILE"
                fi
                echo "" >> "$REPORT_FILE"
            fi
        done
        
        echo "[{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"source_fetched\",\"source\":\"$name\",\"status\":\"success\"}]" >> "$LOG_FILE"
    else
        echo "⚠️ Unable to fetch $name feed" >> "$REPORT_FILE"
        echo "[{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"source_fetched\",\"source\":\"$name\",\"status\":\"failed\"}]" >> "$LOG_FILE"
    fi
}

# Fetch from each source

# The Economist
fetch_rss "https://www.economist.com/latest/rss.xml" "The Economist" "🌍" 5 || true

# Financial Times - World News
fetch_rss "https://www.ft.com/world?format=rss" "Financial Times" "💰" 5 || true

# Jornal Económico
fetch_rss "https://jornaleconomico.pt/feed/" "Jornal Económico" "🇵🇹" 5 || true

# MIT Sloan Management Review
fetch_rss "https://sloanreview.mit.edu/feed/" "MIT Sloan Management Review" "🎓" 3 || true

# Footer
cat >> "$REPORT_FILE" << EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Sources checked: 4
Report generated: $(date '+%Y-%m-%d %H:%M %Z')

---
Reply to this email with feedback or source requests.
EOF

# Log completion
echo "[{\"timestamp\":\"$(date -Iseconds)\",\"event\":\"digest_complete\",\"report_file\":\"$REPORT_FILE\",\"date\":\"$DATE\"}]" >> "$LOG_FILE"

echo "News digest generated: $REPORT_FILE"

# Output the report for delivery
cat "$REPORT_FILE"
