# Strategy:CC Framework

A comprehensive framework for managing Claude AI agents, workflows, and commands through markdown-based configurations. This repository provides a structured approach to organizing Claude Code's work through specialized agents and intelligent command parsing.

## 🎯 Overview

Strategy:CC Framework transforms Claude into a team of specialized agents, each with focused expertise and clear responsibilities. Through natural language commands, you can orchestrate complex workflows, manage projects, and leverage domain-specific knowledge from 80+ pre-configured specialist agents across 7 focused categories.

## ✨ Features

- **80+ Specialized Agents**: Organized in 7 categories from Architecture to Strategy, each agent has deep domain expertise
- **Intelligent Command System**: Natural language parsing for task creation and agent assignment
- **Project Management Workflow**: Built-in project tracking, task management, and release coordination
- **Markdown-Based Configuration**: Human-readable, version-controlled agent and command definitions
- **Smart Agent Selection**: Automatic agent assignment based on task domain keywords
- **Modular Architecture**: Easy to extend with new agents and commands

## 📦 Installation

### Quick Setup (Recommended)

```bash
# Clone the repository
git clone https://github.com/agenticbuddy/claude_commands.git
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
cp -r agents/ ~/.claude/
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

#### Available Commands

Core workflow commands:
```
/learn-conventions    # Learn project conventions and patterns
/refine-doc          # Transform unstructured documents into professional specifications  
/docs               # Generate comprehensive documentation
/develop-idea       # Develop and elaborate on ideas
```

### Working with Agents

Agents are organized into 7 specialized categories. See [CATEGORIES.md](CATEGORIES.md) for complete list:

## Agent Categories

**Quick Overview** (see [CATEGORIES.md](CATEGORIES.md) for complete 80+ agent listing):

- **Architecture** - System design, APIs, cloud infrastructure (`system-architect`, `api-architect`, `cloud-architect`)
- **Compliance** - Security, legal, privacy (`security-engineer`, `privacy-engineer`, `compliance-officer`) 
- **Engineering** - Core development (`fullstack-engineer`, `ai-engineer`, `database-specialist`, `game-developer`)
- **Growth** - User acquisition, engagement (`growth-engineer`, `seo-engineer`, `community-lead`)
- **Helpers** - Meta-tasks and Claude Code utilities (`claude-code-expert`, `stream-to-spec`)
- **Operations** - DevOps, quality, monitoring (`devops-engineer`, `qa-engineer`, `observability-engineer`)
- **Strategy** - Business planning, project management (`product-strategist`, `project-lead`, `strategic-advisor`)

### Example Workflows

#### 1. Learning Project Conventions
```bash
# Analyze and learn codebase patterns
/learn-conventions

# The agent will study your project structure, coding patterns, 
# documentation style, and provide insights on established conventions
```

#### 2. Document Analysis & Specification Creation
```bash
# Transform unstructured documents into professional specifications
/refine-doc project-outline.txt

# The agent systematically analyzes documents to:
# - Detect contradictions and ambiguities
# - Extract all details and requirements  
# - Create structured specifications with user guidance
# - Generate PRDs, wireframes, and implementation roadmaps

# Generate comprehensive documentation
/docs api-endpoints
```

#### 3. Idea Development
```bash
# Develop and elaborate on a concept
/develop-idea "AI-powered code review system"

# The agent will expand the idea with technical details,
# implementation strategies, and considerations
```

#### 4. Specialized Agent Usage
```bash
# Use Task tool with specific agent
Task: "Review database schema for performance issues" with agent: database-specialist

# Use Task tool for security analysis
Task: "Audit authentication flow" with agent: security-engineer

# Create and configure new agents
Task: "Design a deployment-automation agent with CI/CD focus" with agent: claude-code-expert

# Set up Claude Code for team collaboration
Task: "Configure MCP servers and hooks for our project" with agent: claude-code-expert
```

## 📁 Repository Structure

```
claude_commands/
├── agents/                     # Specialized agent definitions (80+ agents)
│   ├── Architecture/           # System & API design agents
│   ├── Complience/            # Security & legal agents  
│   ├── Engineering/           # Core development agents
│   ├── Growth/                # User acquisition & engagement
│   ├── Helpers/               # Utility & meta-task agents
│   ├── Operations/            # DevOps & infrastructure agents
│   └── Strategy/              # Business & project strategy
├── commands/                  # Workflow command definitions
│   ├── learn-conventions.md   # Project pattern analysis
│   ├── refine-doc.md         # Documentation enhancement
│   ├── docs.md               # Documentation generation
│   └── develop-idea.md       # Idea development & elaboration
├── CATEGORIES.md             # Complete agent categorization guide
├── CLAUDE.md                 # Claude-specific guidance  
├── setup.sh                 # Unix/Linux/Mac setup script
├── uninstall.sh             # Cleanup script
└── README.md                # This file
```

### Usage with Claude Code

The agents work seamlessly with Claude Code's Task tool:

1. **Direct Agent Invocation**: Use Task tool with specific agent type
2. **Automatic Selection**: Commands automatically route to appropriate agents
3. **Multi-Agent Workflows**: Complex tasks can involve multiple agents
4. **Context Preservation**: Agents maintain context across related tasks

## 🛠️ Configuration

### Adding Custom Agents

Use the `claude-code-expert` agent for creating and configuring new agents:

```bash
# Create a new specialized agent
Task: "Design a deployment-automation agent with Docker and Kubernetes focus" with agent: claude-code-expert

# Configure agent tools and permissions
Task: "Set up MCP servers and tool permissions for the payment-processing agent" with agent: claude-code-expert

# Optimize existing agent configuration
Task: "Review and improve the database-specialist agent configuration" with agent: claude-code-expert
```

The `claude-code-expert` will:
- Design optimal agent instructions and decision frameworks
- Configure appropriate MCP server integrations  
- Set up tool permissions and security constraints
- Provide deployment and testing guidance

### Creating Custom Commands

Use `claude-code-expert` for advanced command creation and Claude Code configuration:

```bash
# Create custom workflow commands
Task: "Design a /audit-security command that runs multiple security agents" with agent: claude-code-expert

# Set up project-specific hooks
Task: "Configure pre-commit hooks for code quality and security validation" with agent: claude-code-expert

# Optimize Claude Code settings
Task: "Create optimal settings.json for our React/Node.js project" with agent: claude-code-expert
```

## 🔧 Development

### Testing Agents
```bash
# Test an agent directly with Task tool
Task: "Review this code for security issues" with agent: security-engineer

# Test commands  
/learn-conventions
/docs api-reference
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

- Report issues: [GitHub Issues](https://github.com/agenticbuddy/claude_commands/issues)
- Documentation: See [CLAUDE.md](CLAUDE.md) for detailed guidance  
- Agent Categories: See [CATEGORIES.md](CATEGORIES.md) for complete agent listing
- Claude Code docs: https://docs.anthropic.com/en/docs/claude-code

## 🌟 Acknowledgments

Built for the Claude Code community to enhance productivity through specialized agents and intelligent workflows.

---

**Note**: This framework requires Claude Code to be installed and configured. Agents and commands are loaded from the `~/.claude/` directory structure.