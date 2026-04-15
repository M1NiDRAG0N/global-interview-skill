# 🌏 Global Interview Skill

**한국·일본·미국 다국적 면접관 페르소나**를 탑재한 개발자 면접 코칭 AI 스킬입니다.  
A developer interview coaching AI skill with **Korean, Japanese, and American interviewer personas**.

---

## ✨ 주요 기능 / Features

| 모드 | 설명 |
|------|------|
| **A) 이력서 분석** | 6개 항목 점수화 (완성도·임팩트·가독성·키워드·직무연관·차별성) |
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

## 🚀 설치 및 사용 방법 / Installation & Usage

### 1. Claude Code (권장)

Claude Code의 스킬 시스템을 활용하면 가장 강력하게 사용할 수 있습니다.

**설치:**

```bash
# 스킬 디렉터리로 복사
cp -r skills/interview-agent ~/.claude/skills/

# Windows의 경우
xcopy /E /I skills\interview-agent %USERPROFILE%\.claude\skills\interview-agent
```

또는 수동으로 `skills/interview-agent/SKILL.md` 파일을 `~/.claude/skills/interview-agent/SKILL.md` 경로에 복사하세요.

**사용:**

Claude Code를 실행한 후, 이력서 파일(PDF, DOCX, MD, TXT)이 있는 폴더에서 아래 트리거 문구를 입력합니다.

```
면접 준비해줘
이력서 분석해줘
모의 면접 해줘
이력서 보완해줘
interview coach
resume review
```

---

### 2. ChatGPT (Custom GPT / System Prompt)

**방법 A — Custom GPT 만들기:**
1. [ChatGPT](https://chat.openai.com) → **Explore GPTs** → **Create**
2. **Configure** 탭 → **Instructions** 항목에 `prompts/system-prompt.md` 내용을 붙여넣기
3. 이력서 파일 업로드를 위해 **Capabilities → Code Interpreter & Data Analysis** 활성화
4. 저장 후 사용

**방법 B — 대화에서 바로 사용:**
1. `prompts/system-prompt.md` 내용을 복사
2. ChatGPT 새 대화에 붙여넣기
3. 이력서 내용을 함께 붙여넣거나 파일 업로드 후 사용

---

### 3. Claude.ai (Web)

1. [claude.ai](https://claude.ai) 접속
2. **Projects** → **New Project** 생성
3. **Project Instructions**에 `prompts/system-prompt.md` 내용 붙여넣기
4. 이후 해당 프로젝트에서 이력서 파일을 업로드하거나 내용을 붙여넣어 사용

---

### 4. Gemini / Gemini Advanced

1. [gemini.google.com](https://gemini.google.com) 접속
2. `prompts/system-prompt.md` 내용을 첫 메시지에 붙여넣기 후 전송
3. 이후 이력서 내용을 붙여넣거나 파일 업로드 후 사용

---

### 5. Cursor / Windsurf / Continue (IDE AI)

1. `.cursor/rules/` 또는 `.continue/rules/` 디렉터리 생성
2. `prompts/system-prompt.md`를 해당 디렉터리에 복사
3. IDE AI와 대화 시 인터뷰 에이전트로 동작

---

### 6. API 직접 호출 (OpenAI / Anthropic / 기타)

```python
import anthropic

with open("prompts/system-prompt.md", "r", encoding="utf-8") as f:
    system_prompt = f.read()

with open("my-resume.pdf", "rb") as f:
    resume_content = f.read()  # PDF 파싱 별도 처리 필요

client = anthropic.Anthropic()
message = client.messages.create(
    model="claude-opus-4-6",
    max_tokens=4096,
    system=system_prompt,
    messages=[
        {
            "role": "user",
            "content": "이력서 분석해줘\n\n[이력서 내용 붙여넣기]"
        }
    ]
)
print(message.content[0].text)
```

```python
# OpenAI 예시
from openai import OpenAI

client = OpenAI()
response = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "system", "content": open("prompts/system-prompt.md").read()},
        {"role": "user", "content": "이력서 분석해줘\n\n[이력서 내용 붙여넣기]"}
    ]
)
print(response.choices[0].message.content)
```

---

## 📁 파일 구조 / Repository Structure

```
global-interview-skill/
├── README.md                          # 이 파일
├── LICENSE                            # MIT License
├── skills/
│   └── interview-agent/
│       └── SKILL.md                   # Claude Code 전용 스킬 파일
└── prompts/
    └── system-prompt.md               # 범용 시스템 프롬프트 (모든 AI 지원)
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
