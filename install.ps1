$RepoDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host ""
Write-Host "🌏 Global Interview Skill — Installer" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "어떤 AI CLI에 설치할까요? (복수 선택 가능: 예 1 3)"
Write-Host ""
Write-Host "  1) Claude Code"
Write-Host "  2) Gemini CLI  (현재 프로젝트 폴더에 설치)"
Write-Host "  3) Cursor      (글로벌 룰)"
Write-Host "  4) Windsurf    (글로벌 룰)"
Write-Host "  5) 전체 설치"
Write-Host ""
$input = Read-Host "선택"
$choices = $input -split " "

function Install-ClaudeCode {
  $dest = "$env:USERPROFILE\.claude\skills\interview-agent"
  New-Item -ItemType Directory -Force -Path $dest | Out-Null
  Copy-Item "$RepoDir\skills\claude-code\SKILL.md" "$dest\SKILL.md" -Force
  Write-Host "✅ Claude Code → $dest" -ForegroundColor Green
}

function Install-Gemini {
  Copy-Item "$RepoDir\GEMINI.md" "$RepoDir\GEMINI.md" -Force
  Write-Host "✅ Gemini CLI → $RepoDir\GEMINI.md" -ForegroundColor Green
  Write-Host "   cd $RepoDir && gemini 으로 바로 사용 가능" -ForegroundColor Cyan
}

function Install-Cursor {
  $dest = "$env:USERPROFILE\.cursor\rules"
  New-Item -ItemType Directory -Force -Path $dest | Out-Null
  Copy-Item "$RepoDir\skills\cursor\interview-agent.md" "$dest\interview-agent.md" -Force
  Write-Host "✅ Cursor → $dest\interview-agent.md" -ForegroundColor Green
}

function Install-Windsurf {
  $dest = "$env:USERPROFILE\.windsurf\rules"
  New-Item -ItemType Directory -Force -Path $dest | Out-Null
  Copy-Item "$RepoDir\skills\windsurf\interview-agent.md" "$dest\interview-agent.md" -Force
  Write-Host "✅ Windsurf → $dest\interview-agent.md" -ForegroundColor Green
}

Write-Host ""
foreach ($choice in $choices) {
  switch ($choice.Trim()) {
    "1" { Install-ClaudeCode }
    "2" { Install-Gemini }
    "3" { Install-Cursor }
    "4" { Install-Windsurf }
    "5" { Install-ClaudeCode; Install-Gemini; Install-Cursor; Install-Windsurf }
    default { Write-Host "⚠️  알 수 없는 선택: $choice" -ForegroundColor Yellow }
  }
}

Write-Host ""
Write-Host "설치 완료! 이력서 파일을 작업 폴더에 넣고 아래 문구로 시작하세요:" -ForegroundColor Cyan
Write-Host ""
Write-Host "  면접 준비해줘 / 이력서 분석해줘 / 모의 면접 해줘"
Write-Host ""
