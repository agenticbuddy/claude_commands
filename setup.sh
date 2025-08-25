#!/bin/bash

# Aira Framework Setup Script
# Installs agents and commands to ~/.claude directory

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
CLAUDE_DIR="$HOME/.claude"
AGENTS_DIR="$CLAUDE_DIR/agents"
COMMANDS_DIR="$CLAUDE_DIR/commands"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Print colored message
print_message() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Print header
print_header() {
    echo ""
    print_message "$BLUE" "========================================="
    print_message "$BLUE" "   Aira Framework Setup"
    print_message "$BLUE" "========================================="
    echo ""
}

# Check if running from correct directory
check_directory() {
    if [ ! -d "$SCRIPT_DIR/agents" ] || [ ! -d "$SCRIPT_DIR/commands" ]; then
        print_message "$RED" "Error: agents/ and commands/ directories not found!"
        print_message "$RED" "Please run this script from the claude_commands repository root."
        exit 1
    fi
}

# Create Claude directories
create_directories() {
    print_message "$YELLOW" "Creating Claude configuration directories..."
    
    mkdir -p "$AGENTS_DIR"
    mkdir -p "$COMMANDS_DIR"
    
    print_message "$GREEN" "✓ Directories created:"
    echo "  - $AGENTS_DIR"
    echo "  - $COMMANDS_DIR"
}

# Backup existing configurations
backup_existing() {
    local backup_needed=false
    
    if [ -d "$AGENTS_DIR" ] && [ "$(ls -A $AGENTS_DIR/*.md 2>/dev/null)" ]; then
        backup_needed=true
    fi
    
    if [ -d "$COMMANDS_DIR" ] && [ "$(ls -A $COMMANDS_DIR/*.md 2>/dev/null)" ]; then
        backup_needed=true
    fi
    
    if [ "$backup_needed" = true ]; then
        local backup_dir="$CLAUDE_DIR/backup_$(date +%Y%m%d_%H%M%S)"
        print_message "$YELLOW" "Backing up existing configuration to $backup_dir..."
        
        mkdir -p "$backup_dir"
        
        if [ -d "$AGENTS_DIR" ]; then
            cp -r "$AGENTS_DIR" "$backup_dir/" 2>/dev/null || true
        fi
        
        if [ -d "$COMMANDS_DIR" ]; then
            cp -r "$COMMANDS_DIR" "$backup_dir/" 2>/dev/null || true
        fi
        
        print_message "$GREEN" "✓ Backup created"
    fi
}

# Install agents
install_agents() {
    print_message "$YELLOW" "Installing agents..."
    
    local count=0
    for agent_file in "$SCRIPT_DIR"/agents/*.md; do
        if [ -f "$agent_file" ]; then
            cp "$agent_file" "$AGENTS_DIR/"
            count=$((count + 1))
        fi
    done
    
    print_message "$GREEN" "✓ Installed $count agents"
}

# Install commands
install_commands() {
    print_message "$YELLOW" "Installing commands..."
    
    local count=0
    for command_file in "$SCRIPT_DIR"/commands/*.md; do
        if [ -f "$command_file" ]; then
            cp "$command_file" "$COMMANDS_DIR/"
            count=$((count + 1))
        fi
    done
    
    print_message "$GREEN" "✓ Installed $count commands"
}

# Verify installation
verify_installation() {
    print_message "$YELLOW" "Verifying installation..."
    
    local agents_count=$(ls -1 "$AGENTS_DIR"/*.md 2>/dev/null | wc -l)
    local commands_count=$(ls -1 "$COMMANDS_DIR"/*.md 2>/dev/null | wc -l)
    
    echo ""
    print_message "$GREEN" "Installation Summary:"
    echo "  • Agents installed:   $agents_count"
    echo "  • Commands installed: $commands_count"
    
    # List some key agents
    echo ""
    print_message "$BLUE" "Key agents available:"
    echo "  - backend-engineer"
    echo "  - frontend-engineer"
    echo "  - security-engineer"
    echo "  - ai-engineer"
    echo "  - project-lead"
    echo "  ... and $(($agents_count - 5)) more"
    
    # List commands
    echo ""
    print_message "$BLUE" "Commands available:"
    for cmd_file in "$COMMANDS_DIR"/*.md; do
        if [ -f "$cmd_file" ]; then
            cmd_name=$(basename "$cmd_file" .md)
            echo "  - /$cmd_name"
        fi
    done
}

# Print usage instructions
print_usage() {
    echo ""
    print_message "$GREEN" "========================================="
    print_message "$GREEN" "   Installation Complete!"
    print_message "$GREEN" "========================================="
    echo ""
    print_message "$YELLOW" "Quick Start:"
    echo ""
    echo "  1. Start Claude Code: claude"
    echo "  2. Try simple mode:   /simple"
    echo "  3. Create a project:  /sa_project \"Your project name\""
    echo "  4. Create a task:     /sa_task \"Your task description\""
    echo ""
    print_message "$BLUE" "For more information, see README.md"
    echo ""
}

# Main installation flow
main() {
    print_header
    check_directory
    create_directories
    backup_existing
    install_agents
    install_commands
    verify_installation
    print_usage
}

# Run main function
main