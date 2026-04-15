#!/bin/bash

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo "🌏 Global Interview Skill — Installer"
echo "======================================"
echo ""
echo "어떤 AI CLI에 설치할까요? (복수 선택 가능: 예 1 3)"
echo ""
echo "  1) Claude Code"
echo "  2) Gemini CLI  (현재 프로젝트 폴더에 설치)"
echo "  3) Cursor      (글로벌 룰)"
echo "  4) Windsurf    (글로벌 룰)"
echo "  5) 전체 설치"
echo ""
read -rp "선택: " choices

install_claude_code() {
  DEST="$HOME/.claude/skills/interview-agent"
  mkdir -p "$DEST"
  cp "$REPO_DIR/skills/claude-code/SKILL.md" "$DEST/SKILL.md"
  echo -e "${GREEN}✅ Claude Code${NC} → $DEST"
}

install_gemini() {
  DEST="${TARGET_DIR:-$REPO_DIR}"
  cp "$REPO_DIR/GEMINI.md" "$DEST/GEMINI.md"
  echo -e "${GREEN}✅ Gemini CLI${NC} → $DEST/GEMINI.md"
  echo -e "   ${CYAN}cd $DEST && gemini${NC} 으로 바로 사용 가능"
}

install_cursor() {
  DEST="$HOME/.cursor/rules"
  mkdir -p "$DEST"
  cp "$REPO_DIR/skills/cursor/interview-agent.md" "$DEST/interview-agent.md"
  echo -e "${GREEN}✅ Cursor${NC} → $DEST/interview-agent.md"
}

install_windsurf() {
  DEST="$HOME/.windsurf/rules"
  mkdir -p "$DEST"
  cp "$REPO_DIR/skills/windsurf/interview-agent.md" "$DEST/interview-agent.md"
  echo -e "${GREEN}✅ Windsurf${NC} → $DEST/interview-agent.md"
}

echo ""
for choice in $choices; do
  case $choice in
    1) install_claude_code ;;
    2) install_gemini ;;
    3) install_cursor ;;
    4) install_windsurf ;;
    5)
      install_claude_code
      install_gemini
      install_cursor
      install_windsurf
      ;;
    *) echo "⚠️  알 수 없는 선택: $choice" ;;
  esac
done

echo ""
echo "설치 완료! 이력서 파일을 작업 폴더에 넣고 아래 문구로 시작하세요:"
echo ""
echo "  면접 준비해줘 / 이력서 분석해줘 / 모의 면접 해줘"
echo ""
