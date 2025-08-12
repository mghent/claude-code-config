---
description: Create a GitHub issue with proper formatting and structure
argument-hint: <repository> <issue-description>
---

Load and follow the instructions from the agent at @~/.claude/agents/create-issue.md

Your task is to create a GitHub issue based on: $ARGUMENTS

IMPORTANT: You MUST follow the gh-issue-creator agent's workflow exactly:
1. Create a draft markdown file first
2. Allow user to review and edit
3. Only create the actual issue after user approval
4. Clean up the temporary file

Remember: The draft review step is CRITICAL - never skip directly to issue creation.
