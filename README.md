# Aira Framework

A comprehensive framework for managing Claude AI agents, workflows, and commands through markdown-based configurations. This repository provides a structured approach to organizing Claude Code's work through specialized agents and intelligent command parsing.

## 🎯 Overview

Aira Framework transforms Claude into a team of specialized agents, each with focused expertise and clear responsibilities. Through natural language commands, you can orchestrate complex workflows, manage projects, and leverage domain-specific knowledge from 30+ pre-configured specialist agents.

## ✨ Features

- **30+ Specialized Agents**: From backend engineers to UX designers, each agent has deep domain expertise
- **Intelligent Command System**: Natural language parsing for task creation and agent assignment
- **Project Management Workflow**: Built-in project tracking, task management, and release coordination
- **Markdown-Based Configuration**: Human-readable, version-controlled agent and command definitions
- **Smart Agent Selection**: Automatic agent assignment based on task domain keywords
- **Modular Architecture**: Easy to extend with new agents and commands

## 📦 Installation

### Quick Setup (Recommended)

```bash
# Clone the repository
git clone https://github.com/yourusername/claude_commands.git
cd claude_commands

# Run the setup script
./setup.sh

# For Windows users
# .\setup.ps1
```

### Manual Setup

1. Create the Claude configuration directory:
```bash
mkdir -p ~/.claude/agents
mkdir -p ~/.claude/commands
```

2. Copy agents and commands:
```bash
cp agents/*.md ~/.claude/agents/
cp commands/*.md ~/.claude/commands/
```

## 🚀 Usage

### Basic Commands

#### Simple Mode
Operate in direct, minimal-analysis mode:
```
/simple
# or
/s
```

#### Project Management

Initialize a new project:
```
/sa_project "MCP Core project to build an LLM audit gateway"
```

Create a task with intelligent parsing:
```
/sa_task "Add field-level encryption to AuditEvent with AES-GCM, update schema and write tests"
```

Execute a task with the appropriate agent:
```
/sa_execute T-001
```

Check project status:
```
/sa_status
```

Create a release:
```
/sa_release v1.0.0
```

### Working with Agents

Agents can be invoked directly through the Task tool or automatically assigned through commands. Each agent specializes in specific domains:

| Agent | Specialty | Auto-assigned for |
|-------|-----------|------------------|
| `backend-engineer` | APIs, services, server-side logic | API, backend, database tasks |
| `frontend-engineer` | User interfaces, UX, performance | UI, React, frontend tasks |
| `security-engineer` | Security, vulnerabilities, compliance | Auth, security, vulnerability tasks |
| `ai-engineer` | ML models, pipelines, AI features | ML, AI, model tasks |
| `payment-integration-agent` | Payment gateways, transactions | Payment, billing, Stripe tasks |
| `error-detective` | Debugging, root cause analysis | Bug, error, crash investigations |
| `project-lead` | Orchestration, quality gates | Project coordination |

### Example Workflows

#### 1. Starting a New Project
```bash
# Initialize project
/sa_project "E-commerce platform with Next.js and Stripe"

# Create initial tasks
/sa_task "Set up Next.js project with TypeScript and Tailwind"
/sa_task "Design database schema for products and orders"
/sa_task "Implement Stripe payment integration"

# Check status
/sa_status
```

#### 2. Bug Investigation
```bash
# Report a bug (auto-assigns error-detective)
/sa_task "Login button not responding on mobile devices"

# Execute with specialized agent
/sa_execute T-042
```

#### 3. Security Audit
```bash
# Create security task (auto-assigns security-engineer)
/sa_task "Audit API endpoints for SQL injection vulnerabilities"

# Execute comprehensive security review
/sa_execute T-043
```

## 📁 Repository Structure

```
claude_commands/
├── agents/                 # Specialized agent definitions
│   ├── backend-engineer.md
│   ├── frontend-engineer.md
│   ├── security-engineer.md
│   └── ... (30+ agents)
├── commands/               # Workflow command definitions
│   ├── simple.md          # Simple/direct mode
│   ├── sa_project.md      # Project initialization
│   ├── sa_task.md         # Task creation
│   ├── sa_execute.md      # Task execution
│   ├── sa_status.md       # Status tracking
│   └── sa_release.md      # Release management
├── setup.sh               # Unix/Linux/Mac setup script
├── setup.ps1              # Windows setup script
├── uninstall.sh           # Cleanup script
├── CLAUDE.md              # Claude-specific guidance
└── README.md              # This file
```

### Project Directory Structure (Created by Aira)

When you initialize a project with Aira, it creates a `.aira/` directory:

```
your-project/
└── .aira/                  # Hidden Aira tracking directory
    ├── config/
    │   └── project.md      # Project charter and configuration
    ├── epics/
    │   └── EPIC-001-*.md   # Epic definitions
    ├── tasks/
    │   └── T-001-*.md      # Individual task files
    ├── releases/
    │   └── v1.0.0-*.md     # Release documentation
    └── reports/
        └── <agent>/        # Agent-specific logs
            └── T-001.md    # Task work logs
```

## 🛠️ Configuration

### Adding Custom Agents

1. Create a new markdown file in `agents/`:
```yaml
---
name: your-agent-name
description: Brief description of the agent's purpose
color: blue
---

You are a [Role] specialist with expertise in...

Your core competencies include:
- Competency 1
- Competency 2
...
```

2. Run the setup script to deploy:
```bash
./setup.sh
```

### Creating Custom Commands

1. Create a new markdown file in `commands/`:
```yaml
---
name: command_name
description: What this command does
aliases: ["/alias1", "/alias2"]
category: workflow
---

Command instructions and parsing logic...
```

2. Deploy with setup script:
```bash
./setup.sh
```

## 🔧 Development

### Testing Agents
```bash
# Test an agent directly
Task: "Review this code" with agent: code-reviewer

# Test command parsing
/sa_task "Your natural language task description"
```

### Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/new-agent`)
3. Add your agent/command definition
4. Test thoroughly
5. Commit changes (`git commit -m 'Add new-agent for X domain'`)
6. Push to branch (`git push origin feature/new-agent`)
7. Open a Pull Request

## 📋 Requirements

- Claude Code CLI installed
- Unix/Linux/Mac or Windows with PowerShell
- Write permissions to ~/.claude directory

## 🔄 Updating

To update to the latest agents and commands:
```bash
git pull origin main
./setup.sh
```

## 🗑️ Uninstalling

To remove all installed agents and commands:
```bash
./uninstall.sh
```

## 📝 License

MIT License - see [LICENSE](LICENSE) file for details

## 🤝 Support

- Report issues: [GitHub Issues](https://github.com/yourusername/claude_commands/issues)
- Documentation: See [CLAUDE.md](CLAUDE.md) for detailed guidance
- Claude Code docs: https://docs.anthropic.com/en/docs/claude-code

## 🌟 Acknowledgments

Built for the Claude Code community to enhance productivity through specialized agents and intelligent workflows.

---

**Note**: This framework requires Claude Code to be installed and configured. Agents and commands are loaded from the `~/.claude/` directory structure.