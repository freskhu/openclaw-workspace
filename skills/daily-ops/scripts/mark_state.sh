#!/bin/bash
# Mark a state key as seen today
# Usage: mark_state.sh <category> <key>

STATE_FILE="$HOME/.openclaw/workspace/.state/heartbeat_state.json"
CATEGORY="$1"
KEY="$2"
TODAY=$(date +%Y-%m-%d)

mkdir -p "$(dirname "$STATE_FILE")"

if [ ! -f "$STATE_FILE" ]; then
    echo "{}" > "$STATE_FILE"
fi

node -e "
const fs = require('fs');
const data = JSON.parse(fs.readFileSync('$STATE_FILE', 'utf8'));
if (!data['$CATEGORY']) {
    data['$CATEGORY'] = {};
}
data['$CATEGORY']['$KEY'] = '$TODAY';
fs.writeFileSync('$STATE_FILE', JSON.stringify(data, null, 2));
"
