[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude_Code-compatible-blueviolet)](https://claude.ai/claude-code)
[![GitHub stars](https://img.shields.io/github/stars/maysunAI/T00?style=social)](https://github.com/maysunAI/T00/stargazers)

# AI00 — AI Collaboration Framework for Claude Code

> **Stop losing your AI conversations. Every answer is tracked, every session continues.**

[中文版](README_zh.md) · [Help Docs (42 articles)](AI00_Common/_docs/help/H00_help_index.md) · [Quick Start →](#30-second-quickstart)

---

## The Problem

You've been working with AI for hours. The conversation grows long.
Then you start a new session — and **everything is gone.**

- Can't find the decision you made 3 sessions ago
- AI has no idea what you built last week
- Every session starts from scratch

**AI00 solves this with one simple rule: write requests in a file, read answers from a file.**

---

## 30-Second Quickstart

**Step 1 — Write your request in `temp01_req.md`**

```
1. Check if the login function has any bugs
2. Confirm test coverage
```

**Step 2 — Tell the AI which line to start from**

```
req 1 onwards
```

**Step 3 — AI writes a tracked answer in `temp03_reply.md`**

```
══════════════════════════════
❓ [2026-06-10 10:30]
Original:
[1] Check if the login function has any bugs
[2] Confirm test coverage
───────────────────────────────
1. Found session expiry bug — fixed in auth.js:42

2. Current coverage: 73%. Suggest adding login module tests.

📌 req line 1-2 → reply line 8 ✅
```

Every answer has a `📌` line number tag — **always traceable back to the original request.**

---

## Who Is This For

- Developers who use Claude Code daily
- Solo builders who want to remember what they built
- Anyone frustrated by losing AI context between sessions

---

## Features

| Feature | AI00 | Plain CLAUDE.md | Cursor Rules |
|---------|------|-----------------|--------------|
| Line-number traceability | ✅ every answer | ❌ | ❌ |
| Session auto-archive | ✅ RESUME.md | ❌ | ❌ |
| Multi-project management | ✅ PROJECTS_INDEX | ❌ | ❌ |
| 42 help articles | ✅ | ❌ | ❌ |
| Slash commands (14) | ✅ | few | few |
| Rule inheritance system | ✅ R01–R10 | single file | single file |
| AI memory across sessions | ✅ | ❌ | ❌ |

---

## Key Trigger Words

| Say this | AI does this |
|---------|-------------|
| `req line X onwards` | Read from line X, write answer to reply |
| `new project xxx` | Auto-create folder + register in PROJECTS_INDEX |
| `draft update` | Read draft → append to req → answer → clear draft |
| `goodbye` | Auto-archive + update RESUME.md for next session |

---

## Directory Structure

```
T00/
├── CLAUDE.md                    ← Root rules (auto-loaded)
├── AI00_Common/
│   ├── CLAUDE.md                ← Shared rules (workflow protocol)
│   ├── rules/                   ← AI behavior rules (R01–R10)
│   ├── .claude/commands/        ← Slash commands (/t00-*)
│   └── projects/PROJECTS_INDEX.md
├── temp01_req.md                ← Write your requests here
├── temp02_draft.md              ← Draft area
├── temp03_reply.md              ← AI writes answers here
└── PJxx_project-name/           ← Individual project folders
```

---

## Help Documentation

42 articles covering everything from basics to advanced workflows.

| Category | File | Content |
|----------|------|---------|
| Start here | H38_quick_start.md | 5-minute onboarding |
| Workflow | H02_req_reply_workflow.md | Full req→reply flow |
| Commands | H28_slash_commands_guide.md | All slash commands |
| Publish | H13_github_publish.md | GitHub publishing guide |
| Cheatsheet | H25_prompt_cheatsheet.md | All trigger words |

**Generate a single HTML file** (readable on mobile):

```powershell
.\AI00_Common\_docs\gen_help_html.ps1
```

---

## Setup

1. Clone this repo
2. Open the folder in Claude Code (`claude` CLI or VS Code extension)
3. Write your first request in `temp01_req.md`
4. Tell Claude: `req 1 onwards`

That's it. No installs, no config files, no API keys needed.

---

## Contact

Questions or feedback? [Open an issue](https://github.com/maysunAI/T00/issues)

GitHub: [@maysunAI](https://github.com/maysunAI)

---

## License

[MIT License](LICENSE) — free to use, modify, and distribute.

---

> ⭐ **If AI00 saves you time, a star helps others find it.** ⭐
>
> [Star on GitHub →](https://github.com/maysunAI/T00)
