#!/bin/bash
# Daily Improvement Task Generator
# Creates a random improvement task and logs it

set -e

WORKSPACE="$HOME/.openclaw/workspace"
DATE=$(date +%Y-%m-%d)
IMPROVEMENT_FILE="$WORKSPACE/memory/improvements/$DATE.md"

# Categories and tasks
CATEGORIES=("trading" "procureai" "memory" "system" "docs")

TRADING_TASKS=(
    "optimize_signal_thresholds: Review and adjust entry/exit thresholds based on recent performance"
    "backtest_report: Generate weekly backtest summary and identify weak patterns"
    "risk_audit: Review position sizing and max drawdown limits"
    "connector_health: Test exchange API connections and error handling"
)

PROCUREAI_TASKS=(
    "clean_code: Refactor duplicate logic in API routes"
    "add_tests: Increase test coverage for critical paths"
    "ui_cleanup: Fix console warnings and deprecated patterns"
    "db_optimization: Review slow queries and add indexes"
)

MEMORY_TASKS=(
    "consolidate_notes: Merge related daily notes into project files"
    "update_index: Refresh memory/INDEX.md with latest projects"
    "archive_old: Move files older than 30 days to archive"
    "tag_cleanup: Standardize tags across memory files"
)

SYSTEM_TASKS=(
    "organize_files: Clean up workspace root, move loose files"
    "archive_logs: Compress and archive old log files"
    "update_deps: Check for security updates in dependencies"
    "disk_check: Review disk usage and clean temp files"
)

DOCS_TASKS=(
    "update_readme: Refresh main README with current features"
    "document_api: Add missing API endpoint documentation"
    "changelog: Update CHANGELOG with recent changes"
    "skill_docs: Improve skill documentation and examples"
)

# Pick random category
CATEGORY=${CATEGORIES[$RANDOM % ${#CATEGORIES[@]}]}

# Get tasks array for category
declare -n TASKS="${CATEGORY^^}_TASKS"
TASK=${TASKS[$RANDOM % ${#TASKS[@]}]}

mkdir -p "$(dirname "$IMPROVEMENT_FILE")"

cat > "$IMPROVEMENT_FILE" << EOF
# Daily Improvement: $DATE

**Time:** 08:00
**Focus:** ${CATEGORY}:${TASK%%:*}

## Task

- [ ] ${TASK#*: }

## Notes

_(Agent will update this section when complete)_

---

**Notification:** Include @freskhy mention when reporting completion.
EOF

echo "Created: $IMPROVEMENT_FILE"
