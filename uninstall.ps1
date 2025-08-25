# Strategy:CC Framework Uninstall Script for Windows
# Removes agents and commands from ~/.claude directory

param(
    [switch]$Force = $false
)

# Configuration
$ClaudeDir = Join-Path $env:USERPROFILE ".claude"
$AgentsDir = Join-Path $ClaudeDir "agents"
$CommandsDir = Join-Path $ClaudeDir "commands"

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
    Write-ColorOutput "=========================================" -ForegroundColor Red
    Write-ColorOutput "   Strategy:CC Framework Uninstall" -ForegroundColor Red
    Write-ColorOutput "=========================================" -ForegroundColor Red
    Write-Host ""
}

# Confirm uninstall
function Confirm-Uninstall {
    if (-not $Force) {
        Write-ColorOutput "This will remove all Strategy:CC agents and commands from:" -ForegroundColor Yellow
        Write-Host "  - $AgentsDir"
        Write-Host "  - $CommandsDir"
        Write-Host ""
        
        $confirmation = Read-Host "Are you sure you want to uninstall? (y/N)"
        
        if ($confirmation -ne 'y' -and $confirmation -ne 'Y') {
            Write-ColorOutput "Uninstall cancelled." -ForegroundColor Blue
            exit 0
        }
    }
}

# Create backup before uninstall
function New-UninstallBackup {
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $backupDir = Join-Path $ClaudeDir "uninstall_backup_$timestamp"
    
    Write-ColorOutput "Creating backup before uninstall..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
    
    $backedUp = $false
    
    if ((Test-Path $AgentsDir) -and (Get-ChildItem -Path $AgentsDir -Filter "*.md" -ErrorAction SilentlyContinue).Count -gt 0) {
        Copy-Item -Path $AgentsDir -Destination $backupDir -Recurse -ErrorAction SilentlyContinue
        Write-ColorOutput "✓ Agents backed up to: $backupDir\agents" -ForegroundColor Green
        $backedUp = $true
    }
    
    if ((Test-Path $CommandsDir) -and (Get-ChildItem -Path $CommandsDir -Filter "*.md" -ErrorAction SilentlyContinue).Count -gt 0) {
        Copy-Item -Path $CommandsDir -Destination $backupDir -Recurse -ErrorAction SilentlyContinue
        Write-ColorOutput "✓ Commands backed up to: $backupDir\commands" -ForegroundColor Green
        $backedUp = $true
    }
    
    if ($backedUp) {
        # Save backup location
        $backupFile = Join-Path $ClaudeDir ".last_uninstall_backup"
        Set-Content -Path $backupFile -Value $backupDir
    }
    
    return $backupDir
}

# Remove agents
function Remove-Agents {
    if (Test-Path $AgentsDir) {
        Write-ColorOutput "Removing agents..." -ForegroundColor Yellow
        
        # Count files before removal
        $agentFiles = Get-ChildItem -Path $AgentsDir -Filter "*.md" -ErrorAction SilentlyContinue
        $count = $agentFiles.Count
        
        # Remove all .md files
        if ($count -gt 0) {
            Remove-Item -Path "$AgentsDir\*.md" -Force -ErrorAction SilentlyContinue
        }
        
        Write-ColorOutput "✓ Removed $count agents" -ForegroundColor Green
    }
    else {
        Write-ColorOutput "No agents directory found" -ForegroundColor Blue
    }
}

# Remove commands
function Remove-Commands {
    if (Test-Path $CommandsDir) {
        Write-ColorOutput "Removing commands..." -ForegroundColor Yellow
        
        # Count files before removal
        $commandFiles = Get-ChildItem -Path $CommandsDir -Filter "*.md" -ErrorAction SilentlyContinue
        $count = $commandFiles.Count
        
        # Remove all .md files
        if ($count -gt 0) {
            Remove-Item -Path "$CommandsDir\*.md" -Force -ErrorAction SilentlyContinue
        }
        
        Write-ColorOutput "✓ Removed $count commands" -ForegroundColor Green
    }
    else {
        Write-ColorOutput "No commands directory found" -ForegroundColor Blue
    }
}

# Clean empty directories
function Clear-EmptyDirectories {
    Write-ColorOutput "Cleaning up empty directories..." -ForegroundColor Yellow
    
    # Remove directories only if they're empty
    if (Test-Path $AgentsDir) {
        $agentItems = Get-ChildItem -Path $AgentsDir -ErrorAction SilentlyContinue
        if ($agentItems.Count -eq 0) {
            Remove-Item -Path $AgentsDir -Force
            Write-ColorOutput "✓ Removed empty agents directory" -ForegroundColor Green
        }
    }
    
    if (Test-Path $CommandsDir) {
        $commandItems = Get-ChildItem -Path $CommandsDir -ErrorAction SilentlyContinue
        if ($commandItems.Count -eq 0) {
            Remove-Item -Path $CommandsDir -Force
            Write-ColorOutput "✓ Removed empty commands directory" -ForegroundColor Green
        }
    }
}

# Print completion message
function Show-Completion {
    param(
        [string]$BackupLocation
    )
    
    Write-Host ""
    Write-ColorOutput "=========================================" -ForegroundColor Green
    Write-ColorOutput "   Uninstall Complete!" -ForegroundColor Green
    Write-ColorOutput "=========================================" -ForegroundColor Green
    Write-Host ""
    
    $backupFile = Join-Path $ClaudeDir ".last_uninstall_backup"
    if (Test-Path $backupFile) {
        $savedBackup = Get-Content $backupFile
        Write-ColorOutput "Your configuration has been backed up to:" -ForegroundColor Yellow
        Write-ColorOutput $savedBackup -ForegroundColor Blue
        Write-Host ""
        Write-ColorOutput "To restore, run:" -ForegroundColor Yellow
        Write-Host "  Copy-Item -Path `"$savedBackup\agents\*`" -Destination `"$AgentsDir\`" -Force"
        Write-Host "  Copy-Item -Path `"$savedBackup\commands\*`" -Destination `"$CommandsDir\`" -Force"
    }
    
    Write-Host ""
    Write-ColorOutput "To reinstall, run: .\setup.ps1" -ForegroundColor Blue
    Write-Host ""
}

# Main uninstall flow
function Start-Uninstall {
    Show-Header
    Confirm-Uninstall
    $backupLocation = New-UninstallBackup
    Remove-Agents
    Remove-Commands
    Clear-EmptyDirectories
    Show-Completion -BackupLocation $backupLocation
}

# Run uninstall
try {
    Start-Uninstall
}
catch {
    Write-ColorOutput "Error during uninstall: $_" -ForegroundColor Red
    exit 1
}