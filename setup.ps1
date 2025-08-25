# Strategy:CC Framework Setup Script for Windows
# Installs agents and commands to ~/.claude directory

param(
    [switch]$Force = $false
)

# Configuration
$ClaudeDir = Join-Path $env:USERPROFILE ".claude"
$AgentsDir = Join-Path $ClaudeDir "agents"
$CommandsDir = Join-Path $ClaudeDir "commands"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Color functions
function Write-ColorOutput {
    param(
        [string]$Message,
        [string]$ForegroundColor = "White"
    )
    Write-Host $Message -ForegroundColor $ForegroundColor
}

# Print header
function Show-Header {
    Write-Host ""
    Write-ColorOutput "=========================================" -ForegroundColor Blue
    Write-ColorOutput "   Strategy:CC Framework Setup" -ForegroundColor Blue
    Write-ColorOutput "=========================================" -ForegroundColor Blue
    Write-Host ""
}

# Check if running from correct directory
function Test-CorrectDirectory {
    $agentsPath = Join-Path $ScriptDir "agents"
    $commandsPath = Join-Path $ScriptDir "commands"
    
    if (-not (Test-Path $agentsPath) -or -not (Test-Path $commandsPath)) {
        Write-ColorOutput "Error: agents/ and commands/ directories not found!" -ForegroundColor Red
        Write-ColorOutput "Please run this script from the claude_commands repository root." -ForegroundColor Red
        exit 1
    }
}

# Create Claude directories
function New-ClaudeDirectories {
    Write-ColorOutput "Creating Claude configuration directories..." -ForegroundColor Yellow
    
    if (-not (Test-Path $AgentsDir)) {
        New-Item -ItemType Directory -Path $AgentsDir -Force | Out-Null
    }
    
    if (-not (Test-Path $CommandsDir)) {
        New-Item -ItemType Directory -Path $CommandsDir -Force | Out-Null
    }
    
    Write-ColorOutput "✓ Directories created:" -ForegroundColor Green
    Write-Host "  - $AgentsDir"
    Write-Host "  - $CommandsDir"
}

# Backup existing configurations
function Backup-ExistingConfig {
    $backupNeeded = $false
    
    if ((Test-Path $AgentsDir) -and (Get-ChildItem -Path $AgentsDir -Filter "*.md" -ErrorAction SilentlyContinue).Count -gt 0) {
        $backupNeeded = $true
    }
    
    if ((Test-Path $CommandsDir) -and (Get-ChildItem -Path $CommandsDir -Filter "*.md" -ErrorAction SilentlyContinue).Count -gt 0) {
        $backupNeeded = $true
    }
    
    if ($backupNeeded) {
        $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
        $backupDir = Join-Path $ClaudeDir "backup_$timestamp"
        
        Write-ColorOutput "Backing up existing configuration to $backupDir..." -ForegroundColor Yellow
        
        New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
        
        if (Test-Path $AgentsDir) {
            Copy-Item -Path $AgentsDir -Destination $backupDir -Recurse -ErrorAction SilentlyContinue
        }
        
        if (Test-Path $CommandsDir) {
            Copy-Item -Path $CommandsDir -Destination $backupDir -Recurse -ErrorAction SilentlyContinue
        }
        
        Write-ColorOutput "✓ Backup created" -ForegroundColor Green
    }
}

# Install agents
function Install-Agents {
    Write-ColorOutput "Installing agents..." -ForegroundColor Yellow
    
    $sourceAgents = Join-Path $ScriptDir "agents"
    $agentFiles = Get-ChildItem -Path $sourceAgents -Filter "*.md"
    
    $count = 0
    foreach ($agentFile in $agentFiles) {
        Copy-Item -Path $agentFile.FullName -Destination $AgentsDir -Force
        $count++
    }
    
    Write-ColorOutput "✓ Installed $count agents" -ForegroundColor Green
}

# Install commands
function Install-Commands {
    Write-ColorOutput "Installing commands..." -ForegroundColor Yellow
    
    $sourceCommands = Join-Path $ScriptDir "commands"
    $commandFiles = Get-ChildItem -Path $sourceCommands -Filter "*.md"
    
    $count = 0
    foreach ($commandFile in $commandFiles) {
        Copy-Item -Path $commandFile.FullName -Destination $CommandsDir -Force
        $count++
    }
    
    Write-ColorOutput "✓ Installed $count commands" -ForegroundColor Green
}

# Verify installation
function Test-Installation {
    Write-ColorOutput "Verifying installation..." -ForegroundColor Yellow
    
    $agentsCount = (Get-ChildItem -Path $AgentsDir -Filter "*.md" -ErrorAction SilentlyContinue).Count
    $commandsCount = (Get-ChildItem -Path $CommandsDir -Filter "*.md" -ErrorAction SilentlyContinue).Count
    
    Write-Host ""
    Write-ColorOutput "Installation Summary:" -ForegroundColor Green
    Write-Host "  • Agents installed:   $agentsCount"
    Write-Host "  • Commands installed: $commandsCount"
    
    # List some key agents
    Write-Host ""
    Write-ColorOutput "Key agents available:" -ForegroundColor Blue
    Write-Host "  - backend-engineer"
    Write-Host "  - frontend-engineer"
    Write-Host "  - security-engineer"
    Write-Host "  - ai-engineer"
    Write-Host "  - project-lead"
    Write-Host "  ... and $($agentsCount - 5) more"
    
    # List commands
    Write-Host ""
    Write-ColorOutput "Commands available:" -ForegroundColor Blue
    $commandFiles = Get-ChildItem -Path $CommandsDir -Filter "*.md"
    foreach ($cmdFile in $commandFiles) {
        $cmdName = [System.IO.Path]::GetFileNameWithoutExtension($cmdFile.Name)
        Write-Host "  - /$cmdName"
    }
}

# Print usage instructions
function Show-Usage {
    Write-Host ""
    Write-ColorOutput "=========================================" -ForegroundColor Green
    Write-ColorOutput "   Installation Complete!" -ForegroundColor Green
    Write-ColorOutput "=========================================" -ForegroundColor Green
    Write-Host ""
    Write-ColorOutput "Quick Start:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  1. Start Claude Code: claude"
    Write-Host "  2. Try simple mode:   /simple"
    Write-Host "  3. Create a project:  /sa_project `"Your project name`""
    Write-Host "  4. Create a task:     /sa_task `"Your task description`""
    Write-Host ""
    Write-ColorOutput "For more information, see README.md" -ForegroundColor Blue
    Write-Host ""
}

# Main installation flow
function Start-Installation {
    Show-Header
    Test-CorrectDirectory
    New-ClaudeDirectories
    Backup-ExistingConfig
    Install-Agents
    Install-Commands
    Test-Installation
    Show-Usage
}

# Run installation
try {
    Start-Installation
}
catch {
    Write-ColorOutput "Error during installation: $_" -ForegroundColor Red
    exit 1
}