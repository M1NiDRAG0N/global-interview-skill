$RepoDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host ""
Write-Host "Global Interview Skill -- Installer" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Select AI CLI to install (multiple allowed, e.g. 1 3):"
Write-Host ""
Write-Host "  1) Claude Code"
Write-Host "  2) Gemini CLI  (installs to current project folder)"
Write-Host "  3) Cursor      (global rules)"
Write-Host "  4) Windsurf    (global rules)"
Write-Host "  5) Install all"
Write-Host ""
$input = Read-Host "Choice"
$choices = $input -split " "

function Install-ClaudeCode {
    $dest = "$env:USERPROFILE\.claude\skills\interview-agent"
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    Copy-Item "$RepoDir\skills\claude-code\SKILL.md" "$dest\SKILL.md" -Force
    Write-Host "OK Claude Code -> $dest" -ForegroundColor Green
}

function Install-Gemini {
    Copy-Item "$RepoDir\GEMINI.md" "$RepoDir\GEMINI.md" -Force
    Write-Host "OK Gemini CLI -> $RepoDir\GEMINI.md" -ForegroundColor Green
    Write-Host "   Run: cd $RepoDir && gemini" -ForegroundColor Cyan
}

function Install-Cursor {
    $dest = "$env:USERPROFILE\.cursor\rules"
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    Copy-Item "$RepoDir\skills\cursor\interview-agent.md" "$dest\interview-agent.md" -Force
    Write-Host "OK Cursor -> $dest\interview-agent.md" -ForegroundColor Green
}

function Install-Windsurf {
    $dest = "$env:USERPROFILE\.windsurf\rules"
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    Copy-Item "$RepoDir\skills\windsurf\interview-agent.md" "$dest\interview-agent.md" -Force
    Write-Host "OK Windsurf -> $dest\interview-agent.md" -ForegroundColor Green
}

Write-Host ""
foreach ($choice in $choices) {
    switch ($choice.Trim()) {
        "1" { Install-ClaudeCode }
        "2" { Install-Gemini }
        "3" { Install-Cursor }
        "4" { Install-Windsurf }
        "5" { Install-ClaudeCode; Install-Gemini; Install-Cursor; Install-Windsurf }
        default { Write-Host "Unknown choice: $choice" -ForegroundColor Yellow }
    }
}

Write-Host ""
Write-Host "Done! Put your resume file in the working folder and start with:" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Interview prep / Resume analysis / Mock interview"
Write-Host ""
