#!/bin/bash
# Check if a state key has been seen today
# Usage: check_state.sh <category> <key>
# Returns: "new" or "seen"

STATE_FILE="$HOME/.openclaw/workspace/.state/heartbeat_state.json"
CATEGORY="$1"
KEY="$2"
TODAY=$(date +%Y-%m-%d)

mkdir -p "$(dirname "$STATE_FILE")"

# Initialize if doesn't exist
if [ ! -f "$STATE_FILE" ]; then
    echo "{}" > "$STATE_FILE"
fi

# Clean old entries (>7 days)
node -e "
const fs = require('fs');
const data = JSON.parse(fs.readFileSync('$STATE_FILE', 'utf8'));
const today = new Date('$TODAY');
const cutoff = new Date(today);
cutoff.setDate(cutoff.getDate() - 7);

for (const cat in data) {
    for (const key in data[cat]) {
        const entryDate = new Date(data[cat][key]);
        if (entryDate < cutoff) {
            delete data[cat][key];
        }
    }
}

fs.writeFileSync('$STATE_FILE', JSON.stringify(data, null, 2));
"

# Check if key exists and is from today
SEEN=$(node -e "
const fs = require('fs');
const data = JSON.parse(fs.readFileSync('$STATE_FILE', 'utf8'));
const category = data['$CATEGORY'] || {};
const entry = category['$KEY'];
if (entry && entry === '$TODAY') {
    console.log('seen');
} else {
    console.log('new');
}
")

echo "$SEEN"
