### Create Helper Scripts

Create `.claude/scripts/issue-workflow.sh`:

```bash
#!/bin/bash

# issue-workflow.sh - Helper script for issue creation workflow

ACTION=$1
DRAFT_FILE=$2

case "$ACTION" in
  "create-draft")
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    FILENAME="DRAFT_ISSUE_${TIMESTAMP}.md"
    cat > "$FILENAME" << 'EOF'
---
repository: # FILL IN: owner/repo
title: # FILL IN: Clear, descriptive title
labels: # FILL IN: enhancement, bug, documentation, etc.
assignees: # OPTIONAL: GitHub usernames
milestone: # OPTIONAL: Milestone name
---

## Description
[What needs to be done and why]

## Acceptance Criteria
- [ ] First clear, testable criterion
- [ ] Second criterion
- [ ] Third criterion

## Technical Details
[Any implementation notes, API changes, dependencies]

## Additional Context
[Related issues, PRs, or external references]

## Estimated Effort
[Small/Medium/Large]
EOF
    echo "Created draft: $FILENAME"
    ;;
    
  "parse-and-create")
    if [ ! -f "$DRAFT_FILE" ]; then
      echo "Error: Draft file not found: $DRAFT_FILE"
      exit 1
    fi
    
    # Parse YAML frontmatter
    REPO=$(sed -n '/^repository:/p' "$DRAFT_FILE" | sed 's/repository: *//')
    TITLE=$(sed -n '/^title:/p' "$DRAFT_FILE" | sed 's/title: *//')
    LABELS=$(sed -n '/^labels:/p' "$DRAFT_FILE" | sed 's/labels: *//' | tr -d ' ')
    ASSIGNEES=$(sed -n '/^assignees:/p' "$DRAFT_FILE" | sed 's/assignees: *//')
    
    # Extract body (everything after the second ---)
    BODY=$(awk '/^---$/{f++} f==2{print}' "$DRAFT_FILE" | tail -n +2)
    
    # Build gh command
    CMD="gh issue create --repo \"$REPO\" --title \"$TITLE\""
    
    # Create temp file for body
    BODY_FILE=$(mktemp)
    echo "$BODY" > "$BODY_FILE"
    CMD="$CMD --body-file \"$BODY_FILE\""
    
    [ -n "$LABELS" ] && CMD="$CMD --label \"$LABELS\""
    [ -n "$ASSIGNEES" ] && CMD="$CMD --assignee \"$ASSIGNEES\""
    
    # Execute
    echo "Creating issue in $REPO..."
    eval $CMD
    
    # Cleanup temp file
    rm -f "$BODY_FILE"
    ;;
    
  "cleanup")
    if [ -f "$DRAFT_FILE" ]; then
      rm "$DRAFT_FILE"
      echo "✅ Cleaned up $DRAFT_FILE"
    fi
    ;;
    
  *)
    echo "Usage: issue-workflow.sh [create-draft|parse-and-create|cleanup] [draft-file]"
    exit 1
    ;;
esac

