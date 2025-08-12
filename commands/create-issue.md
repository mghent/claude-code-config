---
description: Create a GitHub issue with proper formatting and structure
argument-hint: <repository> <issue-description>
---

Create a GitHub issue based on the following specification: $ARGUMENTS

Use the github-issue-creator agent to:
1. Parse the requirements
2. Format a proper GitHub issue
3. Confirm details with me
4. Create the issue using gh CLI

Ensure the issue includes:
- Clear, descriptive title
- Comprehensive description
- Acceptance criteria
- Relevant labels
- Any technical specifications mentioned

If repository is not specified, ask which repository to use.
