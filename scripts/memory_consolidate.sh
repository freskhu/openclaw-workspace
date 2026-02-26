#!/bin/bash
# memory_consolidate.sh — Safe weekly memory consolidation
# Rules: No secrets, auditable logs, section-specific updates only

set -e

WORKSPACE="${HOME}/.openclaw/workspace"
MEMORY_DIR="${WORKSPACE}/memory"
PROJECTS_DIR="${MEMORY_DIR}/projects"
CONSOLIDATION_DIR="${MEMORY_DIR}/consolidation"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)
DAILY_FILE="${MEMORY_DIR}/${DATE}.md"
LOG_FILE="${CONSOLIDATION_DIR}/${DATE}.md"

# Ensure directories exist
mkdir -p "$CONSOLIDATION_DIR"

echo "=== Memory Consolidation — ${DATE} ${TIME} ==="
echo "Log: ${LOG_FILE}"
echo ""

# Initialize log file
cat > "$LOG_FILE" << EOF
# Consolidation Log — ${DATE} ${TIME}

## Files Read
EOF

# Check if Ollama is available
OLLAMA_AVAILABLE=false
if command -v ollama &> /dev/null; then
    if ollama list 2>/dev/null | grep -q "llama3.2:3b"; then
        OLLAMA_AVAILABLE=true
        echo "Ollama llama3.2:3b available" | tee -a "$LOG_FILE"
    fi
fi

echo "" >> "$LOG_FILE"
echo "## Processing" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# Function to safely extract section content
extract_section() {
    local file=$1
    local section=$2
    if [ -f "$file" ]; then
        sed -n "/^## ${section}/,/^## /p" "$file" | sed '$d' | tail -n +2
    fi
}

# Function to update specific sections in project file
update_project_sections() {
    local project_file=$1
    local project_name=$2
    local temp_file=$(mktemp)
    local changes_made=false
    
    echo "### ${project_name}" | tee -a "$LOG_FILE"
    echo "" >> "$LOG_FILE"
    
    # Check sources
    local sources=""
    local files_read=""
    
    # Read agent memory index if exists
    local agent_dir=""
    case "$project_name" in
        "PROCUREAI") agent_dir="${HOME}/.openclaw/agents/dev-fe" ;;
        "TRADING_ICT2022") agent_dir="${HOME}/.openclaw/agents/trade-quant" ;;
        "PRICE_HUNTER") agent_dir="${HOME}/.openclaw/agents/S01_PRICE_HUNTER" ;;
    esac
    
    if [ -n "$agent_dir" ] && [ -f "$agent_dir/memory/index.md" ]; then
        sources+="Agent memory: ${agent_dir}/memory/index.md
"
        files_read+="- ${agent_dir}/memory/index.md
"
        sources+=$(cat "$agent_dir/memory/index.md")
        sources+="

"
    fi
    
    # Read today's daily note if exists
    if [ -f "$DAILY_FILE" ]; then
        sources+="Daily notes: ${DAILY_FILE}
"
        files_read+="- ${DAILY_FILE}
"
        sources+=$(cat "$DAILY_FILE")
    fi
    
    # Log files read
    if [ -n "$files_read" ]; then
        echo "**Files read:**" >> "$LOG_FILE"
        echo -e "$files_read" >> "$LOG_FILE"
    else
        echo "**Files read:** None" >> "$LOG_FILE"
        echo "No sources found. Skipping." | tee -a "$LOG_FILE"
        echo "" >> "$LOG_FILE"
        return 0
    fi
    
    # Read current project file
    if [ ! -f "$project_file" ]; then
        echo "Error: Project file not found: $project_file" | tee -a "$LOG_FILE"
        return 1
    fi
    
    cp "$project_file" "$temp_file"
    
    # Generate updates for each section
    local new_status=""
    local new_decisions=""
    local new_actions=""
    
    # Extract meaningful content from sources
    # Look for lines that are actual milestones (not generic)
    new_status=$(echo "$sources" | grep -E "^- (Status:|Current:|Live|Active|PnL|Position)" | grep -v "Bullet [0-9]" | head -3)
    new_decisions=$(echo "$sources" | grep -E "^- (Decision|Fixed|Added|Changed|Implemented|Deploy|PR created|Merged)" | grep -v "Decision [0-9]" | head -3)
    new_actions=$(echo "$sources" | grep -E "^- (Next|Todo|Action|Plan|Monitor|Backtest)" | grep -v "Action [0-9]" | head -3)
    
    # If Ollama available, try to improve extraction with better prompt
    if [ "$OLLAMA_AVAILABLE" = true ] && [ -n "$sources" ]; then
        # Only use Ollama if we don't have good extractions
        if [ -z "$new_status" ] && [ -z "$new_decisions" ]; then
            local extracted=$(echo "$sources" | ollama run llama3.2:3b "Given these notes, extract:
1. Current status (what's happening now)
2. Key decisions made (what was decided/fixed)
3. Next actions (what needs to happen)

Output as markdown bullets. Be specific, use actual details from the text." 2>/dev/null || echo "")
            
            # Parse Ollama output only if it has real content
            if echo "$extracted" | grep -qv "Bullet [0-9]\|Action [0-9]\|Decision [0-9]"; then
                new_status=$(echo "$extracted" | grep -E "^- (Status|Current|Now)" | head -3)
                new_decisions=$(echo "$extracted" | grep -E "^- (Decision|Fixed|Added)" | head -3)
                new_actions=$(echo "$extracted" | grep -E "^- (Next|Action)" | head -3)
            fi
        fi
    fi
    
    # Update Current Status section
    if [ -n "$new_status" ]; then
        echo "**Updated: Current Status**" >> "$LOG_FILE"
        # Replace content between ## Current Status and next ##
        awk -v new_content="$new_status" '
            /^## Current Status$/ {
                print
                print ""
                print new_content
                found=1
                next
            }
            found && /^## / {
                found=0
            }
            found {next}
            {print}
        ' "$temp_file" > "${temp_file}.new" && mv "${temp_file}.new" "$temp_file"
        changes_made=true
    fi
    
    # Update Key Decisions section (append with date)
    if [ -n "$new_decisions" ]; then
        echo "**Updated: Key Decisions**" >> "$LOG_FILE"
        local dated_decisions=$(echo "$new_decisions" | sed "s/^- /- **${DATE}**: /")
        awk -v new_content="$dated_decisions" '
            /^## Key Decisions$/ {
                print
                print ""
                print new_content
                found=1
                next
            }
            found && /^## / {
                found=0
            }
            found {next}
            {print}
        ' "$temp_file" > "${temp_file}.new" && mv "${temp_file}.new" "$temp_file"
        changes_made=true
    fi
    
    # Update Next Actions section
    if [ -n "$new_actions" ]; then
        echo "**Updated: Next Actions**" >> "$LOG_FILE"
        awk -v new_content="$new_actions" '
            /^## Next Actions$/ {
                print
                print ""
                print new_content
                found=1
                next
            }
            found && /^## / {
                found=0
            }
            found {next}
            {print}
        ' "$temp_file" > "${temp_file}.new" && mv "${temp_file}.new" "$temp_file"
        changes_made=true
    fi
    
    if [ "$changes_made" = true ]; then
        cp "$temp_file" "$project_file"
        echo "✓ Project file updated: ${project_file}" | tee -a "$LOG_FILE"
    else
        echo "No changes to apply." | tee -a "$LOG_FILE"
    fi
    
    echo "" >> "$LOG_FILE"
    rm -f "$temp_file" "${temp_file}.new" 2>/dev/null || true
}

# Process each project
echo "Processing projects..."
for project in "${PROJECTS_DIR}"/*.md; do
    if [ -f "$project" ]; then
        project_name=$(basename "$project" .md)
        update_project_sections "$project" "$project_name"
    fi
done

# Finalize log
cat >> "$LOG_FILE" << EOF

## Summary
- Completed: $(date +%H:%M:%S)
- Consolidation file: ${LOG_FILE}
EOF

echo ""
echo "=== Consolidation Complete ==="
echo "Log saved: ${LOG_FILE}"
