# 🌏 Global Interview Skill

**한국·일본·미국 다국적 면접관 페르소나**를 탑재한 개발자 면접 코칭 AI 스킬입니다.  
A developer interview coaching AI skill with **Korean, Japanese, and American interviewer personas**.

---

## ✨ 주요 기능 / Features

| 모드 | 설명 |
|------|------|
| **A) 이력서 분석** | 신입/경력 기준으로 6개 항목 점수화 |
| **B) 모의 면접** | 7가지 다국적 페르소나로 실전 면접 시뮬레이션 |
| **C) 이력서 보완** | Before/After 형식의 항목별 개선 문구 제안 |
| **D) 전체** | A → B → C 순서로 모두 진행 |

### 🎭 지원 페르소나 / Supported Personas

| 국가 | 페르소나 | 특성 |
|------|---------|------|
| 🇰🇷 | 한국 대기업 테크 리드 (네이버/카카오/라인) | 기술 설계, 트러블슈팅, 코드 품질 |
| 🇰🇷 | 한국 스타트업 CTO | 자기 주도성, 빠른 실행력 |
| 🇯🇵 | 일본 대기업 면접관 (소니/야후재팬/리쿠르트) | 팀 조화, 형식적 어투, 장기 커리어 |
| 🇯🇵 | 일본 스타트업 면접관 (메르카리/사이버에이전트) | 기술 호기심, 글로벌 마인드 |
| 🇺🇸 | FAANG 인터뷰어 (구글/메타/아마존) | Technical + Behavioral 라운드 |
| 🇺🇸 | 미국 스타트업 인터뷰어 (YC 스타일) | 제품 감각, 임팩트, 오너십 |
| ✏️ | 사용자 정의 | 직접 설명하는 커스텀 페르소나 |

> 🇯🇵 일본 / 🇺🇸 미국 페르소나 선택 시, **해당 국가 언어로 질문 → 한국어 번역**이 함께 제공됩니다.

---

## 🚀 설치 및 사용 방법

### 🖥️ 데스크탑 AI 에이전트 (MCP)

Claude Desktop, Cursor, Windsurf 등 MCP를 지원하는 에이전트에서 사용합니다.

**설치 — 별도 설치 불필요, 아래 설정만 추가:**

**Claude Desktop** (`~/Library/Application Support/Claude/claude_desktop_config.json`)
```json
{
  "mcpServers": {
    "interview-agent": {
      "command": "npx",
      "args": ["-y", "global-interview-skill"]
    }
  }
}
```

**Cursor / Windsurf** (`.cursor/mcp.json` 또는 `.windsurf/mcp.json`)
```json
{
  "mcpServers": {
    "interview-agent": {
      "command": "npx",
      "args": ["-y", "global-interview-skill"]
    }
  }
}
```

설정 후 AI 에이전트에서 `interview-agent` 프롬프트를 선택하거나 아래처럼 입력하면 됩니다:
```
면접 준비해줘 / 이력서 분석해줘 / 모의 면접 해줘
```

---

### 🌐 웹 AI (Claude.ai / ChatGPT / Gemini)

웹 환경은 MCP를 지원하지 않으므로 시스템 프롬프트를 직접 붙여넣어 사용합니다.

**1단계 — 프롬프트 복사:**

```bash
# 터미널에서 바로 복사 (macOS)
curl -s https://raw.githubusercontent.com/M1NiDRAG0N/global-interview-skill/master/prompts/system-prompt.md | pbcopy

# Windows
curl -s https://raw.githubusercontent.com/M1NiDRAG0N/global-interview-skill/master/prompts/system-prompt.md | clip
```

또는 [system-prompt.md 직접 보기](https://github.com/M1NiDRAG0N/global-interview-skill/blob/master/prompts/system-prompt.md) → 내용 복사

**2단계 — AI에 붙여넣기:**

| AI | 방법 |
|----|------|
| **Claude.ai** | Projects → New Project → Instructions에 붙여넣기 |
| **ChatGPT** | Explore GPTs → Create → Instructions에 붙여넣기 |
| **Gemini** | 대화 첫 메시지에 붙여넣기 후 전송 |

---

### ⚡ Claude Code (스킬 설치)

```bash
git clone https://github.com/M1NiDRAG0N/global-interview-skill.git
cp -r global-interview-skill/skills/interview-agent ~/.claude/skills/

# Windows
xcopy /E /I global-interview-skill\skills\interview-agent %USERPROFILE%\.claude\skills\interview-agent
```

설치 후 이력서 파일이 있는 폴더에서 트리거:
```
면접 준비해줘 / 이력서 분석해줘 / 모의 면접 해줘 / 이력서 보완해줘
```

---

## 📁 파일 구조

```
global-interview-skill/
├── index.js                           # MCP 서버 (데스크탑 AI용)
├── package.json
├── README.md
├── LICENSE
├── skills/
│   └── interview-agent/
│       └── SKILL.md                   # Claude Code 전용 스킬
└── prompts/
    └── system-prompt.md               # 웹 AI용 시스템 프롬프트
```

---

## 🤝 기여 / Contributing

페르소나 추가, 번역 개선, 버그 제보 모두 환영합니다!

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/add-persona`)
3. Commit your changes
4. Open a Pull Request

**추가하고 싶은 페르소나 아이디어:**
- 🇬🇧 영국 기업 스타일
- 🇸🇬 싱가포르 테크 기업 스타일
- 🇩🇪 독일 엔지니어링 기업 스타일

---

## 📄 라이선스 / License

MIT License — 자유롭게 사용, 수정, 배포 가능합니다.
