# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is an Aira command and agent framework repository that provides specialized agents and workflow commands for Claude instances. The repository contains a collection of markdown-based agent specifications and command definitions that enable Claude to operate in various specialized modes.

## Architecture

### Directory Structure

- **agents/** - Contains 30+ specialized agent definitions in markdown format
  - Each agent file follows the pattern: `{agent-name}.md`
  - Agents are domain specialists (e.g., `backend-engineer.md`, `security-engineer.md`, `ai-architect.md`)
  - Each agent includes YAML frontmatter with name, description, and color
  - Agent files define expertise, competencies, best practices, and operational guidelines

- **commands/** - Contains workflow command definitions
  - `sa_*` commands: SuperAgent workflow commands for project management
    - `sa_project.md` - Initialize/update project charters
    - `sa_task.md` - Create/modify tasks with NLP parsing
    - `sa_execute.md` - Execute tasks with specialized agents
    - `sa_status.md` - Track project/task status
    - `sa_release.md` - Handle release management
  - `simple.md` - Simplified direct mode command

### Key Concepts

1. **Agent System**: Each agent is a specialized persona with focused expertise. Agents are invoked through commands or Task tool to handle domain-specific work.

2. **Command System**: Commands are workflow triggers that parse natural language, extract structured data, and orchestrate agent invocations.

3. **Markdown-Based Configuration**: All agents and commands use markdown files with YAML frontmatter for metadata and markdown content for instructions.

4. **Aira Workflow**: The `sa_*` commands form a project management workflow:
   - Projects are initialized with charters
   - Tasks are created with intelligent parsing
   - Agents are assigned based on task domain
   - Status tracking and release management are built-in

## Working with This Repository

### Adding New Agents

1. Create a new markdown file in `agents/` directory
2. Include YAML frontmatter with name, description, and color
3. Define the agent's expertise, competencies, and operational guidelines
4. Follow the existing pattern seen in other agent files

### Adding New Commands

1. Create a new markdown file in `commands/` directory
2. Include YAML frontmatter with name, description, and optional aliases
3. Define command behavior, parsing logic, and agent invocation patterns
4. Commands should parse natural language and invoke appropriate agents

### Command Patterns

- **Simple Mode** (`/simple` or `/s`): Operates with minimal analysis, direct responses
- **SA Workflow**: Natural language project/task management with intelligent parsing
  - Commands extract structured data from unstructured input
  - Auto-assign agents based on task domain keywords
  - Generate missing elements (IDs, reviewers, priorities)

### Agent Selection Logic

Commands use keyword detection to assign appropriate agents:
- API/backend/server → `backend-engineer`
- UI/frontend/React → `frontend-engineer`
- Payment/billing → `payment-integration-agent`
- Security/auth → `security-engineer`
- Bug/error/crash → `error-detective`
- Performance/optimize → performance specialists

## Development Guidelines

1. **Maintain Consistency**: Follow existing patterns for agent and command definitions
2. **Clear Metadata**: Always include complete YAML frontmatter
3. **Focused Agents**: Each agent should have a clear, singular focus
4. **Smart Parsing**: Commands should intelligently extract and infer information
5. **Documentation**: Agent descriptions should clearly define capabilities and boundaries

## Installation & Setup

### Quick Setup
```bash
# Clone and install
git clone https://github.com/yourusername/claude_commands.git
cd claude_commands
./setup.sh  # Unix/Linux/Mac
# or
.\setup.ps1  # Windows
```

### Manual Installation
```bash
# Create directories
mkdir -p ~/.claude/agents
mkdir -p ~/.claude/commands

# Copy configurations
cp agents/*.md ~/.claude/agents/
cp commands/*.md ~/.claude/commands/
```

### Uninstalling
```bash
./uninstall.sh  # Unix/Linux/Mac
# or
.\uninstall.ps1  # Windows
```

The uninstall scripts create automatic backups before removing files.

## Testing Approach

Since this is a configuration/prompt repository without traditional code:
- Test agents by invoking them through the Task tool
- Validate command parsing with various natural language inputs
- Ensure agent assignments match expected domains
- Verify workflow commands maintain state correctly

## Key Integration Points

- Agents and commands are loaded from `~/.claude/agents/` and `~/.claude/commands/`
- Commands reference the `project-lead` agent for orchestration
- The framework creates a `.aira/` directory structure in each project for tracking:
  - `.aira/config/` - Project configuration and charter
  - `.aira/epics/` - Epic definitions (EPIC-XXX-Title.md)
  - `.aira/tasks/` - Individual task tracking (T-XXX-Title.md)
  - `.aira/releases/` - Release documentation
  - `.aira/reports/` - Status reports and agent logs
- Commands use placeholder `{{ARGUMENTS}}` for user input injection
- Agents can be invoked standalone or through workflow commands