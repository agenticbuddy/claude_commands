#!/bin/bash

# Aira Framework Uninstall Script
# Removes agents and commands from ~/.claude directory

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

# Print colored message
print_message() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Print header
print_header() {
    echo ""
    print_message "$RED" "========================================="
    print_message "$RED" "   Aira Framework Uninstall"
    print_message "$RED" "========================================="
    echo ""
}

# Confirm uninstall
confirm_uninstall() {
    print_message "$YELLOW" "This will remove all Aira agents and commands from:"
    echo "  - $AGENTS_DIR"
    echo "  - $COMMANDS_DIR"
    echo ""
    
    read -p "Are you sure you want to uninstall? (y/N): " -n 1 -r
    echo ""
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_message "$BLUE" "Uninstall cancelled."
        exit 0
    fi
}

# Create backup before uninstall
create_backup() {
    local backup_dir="$CLAUDE_DIR/uninstall_backup_$(date +%Y%m%d_%H%M%S)"
    
    print_message "$YELLOW" "Creating backup before uninstall..."
    mkdir -p "$backup_dir"
    
    if [ -d "$AGENTS_DIR" ] && [ "$(ls -A $AGENTS_DIR/*.md 2>/dev/null)" ]; then
        cp -r "$AGENTS_DIR" "$backup_dir/" 2>/dev/null || true
        print_message "$GREEN" "✓ Agents backed up to: $backup_dir/agents"
    fi
    
    if [ -d "$COMMANDS_DIR" ] && [ "$(ls -A $COMMANDS_DIR/*.md 2>/dev/null)" ]; then
        cp -r "$COMMANDS_DIR" "$backup_dir/" 2>/dev/null || true
        print_message "$GREEN" "✓ Commands backed up to: $backup_dir/commands"
    fi
    
    echo "$backup_dir" > "$CLAUDE_DIR/.last_uninstall_backup"
}

# Remove agents
remove_agents() {
    if [ -d "$AGENTS_DIR" ]; then
        print_message "$YELLOW" "Removing agents..."
        
        # Count files before removal
        local count=$(ls -1 "$AGENTS_DIR"/*.md 2>/dev/null | wc -l)
        
        # Remove all .md files
        rm -f "$AGENTS_DIR"/*.md 2>/dev/null || true
        
        print_message "$GREEN" "✓ Removed $count agents"
    else
        print_message "$BLUE" "No agents directory found"
    fi
}

# Remove commands
remove_commands() {
    if [ -d "$COMMANDS_DIR" ]; then
        print_message "$YELLOW" "Removing commands..."
        
        # Count files before removal
        local count=$(ls -1 "$COMMANDS_DIR"/*.md 2>/dev/null | wc -l)
        
        # Remove all .md files
        rm -f "$COMMANDS_DIR"/*.md 2>/dev/null || true
        
        print_message "$GREEN" "✓ Removed $count commands"
    else
        print_message "$BLUE" "No commands directory found"
    fi
}

# Clean empty directories
clean_directories() {
    print_message "$YELLOW" "Cleaning up empty directories..."
    
    # Remove directories only if they're empty
    if [ -d "$AGENTS_DIR" ] && [ ! "$(ls -A $AGENTS_DIR)" ]; then
        rmdir "$AGENTS_DIR"
        print_message "$GREEN" "✓ Removed empty agents directory"
    fi
    
    if [ -d "$COMMANDS_DIR" ] && [ ! "$(ls -A $COMMANDS_DIR)" ]; then
        rmdir "$COMMANDS_DIR"
        print_message "$GREEN" "✓ Removed empty commands directory"
    fi
}

# Print completion message
print_completion() {
    echo ""
    print_message "$GREEN" "========================================="
    print_message "$GREEN" "   Uninstall Complete!"
    print_message "$GREEN" "========================================="
    echo ""
    
    if [ -f "$CLAUDE_DIR/.last_uninstall_backup" ]; then
        local backup_location=$(cat "$CLAUDE_DIR/.last_uninstall_backup")
        print_message "$YELLOW" "Your configuration has been backed up to:"
        print_message "$BLUE" "$backup_location"
        echo ""
        print_message "$YELLOW" "To restore, run:"
        echo "  cp -r $backup_location/agents/* $AGENTS_DIR/"
        echo "  cp -r $backup_location/commands/* $COMMANDS_DIR/"
    fi
    
    echo ""
    print_message "$BLUE" "To reinstall, run: ./setup.sh"
    echo ""
}

# Main uninstall flow
main() {
    print_header
    confirm_uninstall
    create_backup
    remove_agents
    remove_commands
    clean_directories
    print_completion
}

# Run main function
main