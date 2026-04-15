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

## 🚀 설치 방법

### 공통 — 먼저 clone

```bash
git clone https://github.com/M1NiDRAG0N/global-interview-skill.git
cd global-interview-skill
```

### 자동 설치 (권장)

```bash
# macOS / Linux
bash install.sh

# Windows
./install.ps1
```

설치할 AI를 선택하면 알아서 복사해줍니다:

```
1) Claude Code
2) Gemini CLI
3) Cursor
4) Windsurf
5) 전체 설치
```

---

### 수동 설치

#### ⚡ Claude Code

```bash
# macOS / Linux
cp -r skills/claude-code ~/.claude/skills/interview-agent

# Windows
xcopy /E /I skills\claude-code %USERPROFILE%\.claude\skills\interview-agent
```

사용: 이력서 파일이 있는 폴더에서 `claude` 실행 후 트리거 입력

```
면접 준비해줘 / 이력서 분석해줘 / 모의 면접 해줘 / 이력서 보완해줘
```

---

#### 🔷 Gemini CLI

clone한 폴더에 `GEMINI.md`가 이미 포함되어 있어서 **별도 설치 불필요**:

```bash
# 이력서 파일을 clone한 폴더에 복사 후
gemini

# 바로 입력
면접 준비해줘
```

다른 프로젝트에서 사용하려면:

```bash
cp GEMINI.md /path/to/your/project/
```

---

#### 🖱️ Cursor

```bash
# macOS / Linux (글로벌 룰)
mkdir -p ~/.cursor/rules
cp skills/cursor/interview-agent.md ~/.cursor/rules/

# Windows
mkdir %USERPROFILE%\.cursor\rules
copy skills\cursor\interview-agent.md %USERPROFILE%\.cursor\rules\
```

또는 특정 프로젝트에만 적용:

```bash
mkdir -p .cursor/rules
cp skills/cursor/interview-agent.md .cursor/rules/
```

---

#### 🌊 Windsurf

```bash
# macOS / Linux (글로벌 룰)
mkdir -p ~/.windsurf/rules
cp skills/windsurf/interview-agent.md ~/.windsurf/rules/

# Windows
mkdir %USERPROFILE%\.windsurf\rules
copy skills\windsurf\interview-agent.md %USERPROFILE%\.windsurf\rules\
```

---

#### 🖥️ Claude Desktop / MCP 지원 에이전트

`npx`로 MCP 서버를 실행합니다. 설정 파일에 추가:

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

---

## 📁 파일 구조

```
global-interview-skill/
├── install.sh                         # 자동 설치 (macOS/Linux)
├── install.ps1                        # 자동 설치 (Windows)
├── GEMINI.md                          # Gemini CLI용 (clone 후 바로 사용)
├── index.js                           # MCP 서버 (Claude Desktop 등)
├── package.json
├── README.md
├── LICENSE
├── skills/
│   ├── claude-code/
│   │   └── SKILL.md                   # Claude Code 전용 스킬
│   ├── cursor/
│   │   └── interview-agent.md         # Cursor 룰
│   └── windsurf/
│       └── interview-agent.md         # Windsurf 룰
└── prompts/
    └── system-prompt.md               # 원본 프롬프트
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
