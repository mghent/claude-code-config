# Claude CLI Configuration Repository

This repository contains the configuration and customization files for [Claude Code](https://docs.anthropic.com/en/docs/claude-code), an AI-powered coding assistant that lives in your terminal.

## Overview

Claude Code is an agentic coding tool designed to help developers turn ideas into code faster. This `.claude` directory serves as the home for user-level configurations, custom agents, commands, and session history.

## Directory Structure

```
.claude/
├── CLAUDE.md           # User-level memory file with global instructions
├── settings.json       # Configuration settings (model selection)
├── agents/            # Custom agent definitions
├── commands/          # Custom command templates
├── projects/          # Session history by project
├── todos/             # Task management data
├── statsig/           # Analytics and feature flags
└── ide/               # IDE integration files
```

## Components

### 📝 CLAUDE.md
The user memory file containing personal preferences and instructions that apply across all projects. Currently configured to:
- Ask permission before committing code changes

### ⚙️ settings.json
Configuration file specifying:
- Model selection: `claude-opus-4-1-20250805`

### 🤖 agents/
Contains custom agent definitions for specialized workflows:
- **gh-issue-creator**: A GitHub issue creation specialist that follows a careful review workflow with draft creation before submission

### 📋 commands/
Custom command templates for common tasks:

| Command | Description | Usage Examples |
|---------|-------------|----------------|
| **create-issue** | Creates GitHub issues with review workflow | • "Create an issue in mghent/repo: Add dark mode"<br>• "File a bug report: Login fails on mobile"<br>• "Create an issue about improving documentation" |

### 📊 projects/
Contains session history files (JSONL format) organized by project path. Each file represents a conversation session with Claude Code.

### ✅ todos/
Task management data files tracking todo items across different sessions and projects.

## Features

### GitHub Issue Workflow
A sophisticated GitHub issue creation system that:
1. Creates draft markdown files for review
2. Parses YAML frontmatter for metadata
3. Creates issues via GitHub CLI
4. Manages cleanup after successful creation

### Memory System
Hierarchical memory structure:
- Enterprise policy (system-level)
- Project memory (team-shared)
- User memory (personal preferences)
- Import capability using `@path/to/import` syntax

## Installation & Setup

1. **Install Claude Code**:
   ```bash
   npm install -g @anthropic-ai/claude-code
   ```
   Requires Node.js 18+

2. **Configure API Key**:
   Set your Anthropic API key in your environment

3. **Customize Settings**:
   Edit `settings.json` to select your preferred model

4. **Add Personal Instructions**:
   Update `CLAUDE.md` with your preferences

## Usage

### Quick Commands
- Use `#` shortcut to quickly add memory files
- Use `/memory` command to edit memory files
- Custom commands can be invoked through natural language

### Available Commands

#### **create-issue** - GitHub Issue Creation
Creates well-structured GitHub issues with a review workflow.

**Natural Language Invocation:**
```
"Create an issue in [repo-name]: [description]"
"File a bug report: [what's wrong]"
"Create an issue about [topic]"
```

**Examples:**
- "Create an issue in mghent/claude-code-config: Add examples for custom agents"
- "File a bug: The settings.json file isn't being loaded correctly"
- "Create an issue about improving the documentation" (will prompt for repo)

**Workflow:**
1. Creates a draft markdown file for your review
2. Allows you to edit before submission
3. Creates the GitHub issue after approval
4. Cleans up temporary files

The agent ensures quality by never skipping the draft review step.

## Best Practices

1. **Memory Management**: Keep CLAUDE.md concise and focused on persistent preferences
2. **Agent Development**: Create specialized agents for complex, repetitive workflows
3. **Command Templates**: Use templates for consistent formatting and structure
4. **Session History**: Projects directory maintains conversation context per project

## Security & Privacy

- All configuration files are stored locally
- Session data remains on your machine
- Enterprise-ready with security features
- No automatic commits without permission (as configured)

## Contributing

This is a personal configuration repository. To create your own:
1. Fork this repository
2. Customize the configurations for your workflow
3. Add your own agents and commands
4. Update CLAUDE.md with your preferences

## Resources

- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- [Model Context Protocol (MCP)](https://docs.anthropic.com/en/docs/claude-code/overview)
- [GitHub CLI Documentation](https://cli.github.com/)

## License

This configuration repository is for personal use. Claude Code itself is provided by Anthropic.

---

*Generated with Claude Code - Your AI pair programmer in the terminal*