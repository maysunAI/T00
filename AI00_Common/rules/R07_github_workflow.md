# R07 — GitHub 工作流规则

> 适用：AI00框架下所有项目的 GitHub 发布管理

---

## 目录结构约定

```
F:\T00\
├── github-pub\          ← 发布暂存区（不上传，本地专用）
│   ├── T00\             ← 对应 GitHub: maysunAI/T00（英文版）
│   ├── T00-zh\          ← 对应 GitHub: maysunAI/T00-zh（中文原版）
│   ├── pj11\            ← 对应 GitHub: maysunAI/classnote-jp
│   └── pj12\            ← 对应 GitHub: maysunAI/bookmarks
└── 各项目原始文件（不动）
```

**原则：原始文件永不修改，只在 github-pub\ 里操作。**

---

## 发布流程（AI 执行）

用户说「**帮我发布 [项目名] 到 github-pub**」时：

1. **选择文件** — 从原始项目挑选可发布内容（排除个人信息、API Key、temp文件）
2. **复制到暂存区** — 放入 `github-pub\对应文件夹\`
3. **验证** — 检查：无绝对路径、无 API Key、README 存在、.gitignore 存在
4. **报告** — 列出放入了什么、排除了什么、发现的问题
5. **等用户确认** — 确认后再推送 GitHub

**不经确认不推送 GitHub。**

---

## 各仓库发布规则

### T00（框架本体 — 英文版）→ `github-pub/T00/`

发布内容：
- `CLAUDE.md`（根目录）
- `AI00_Common/CLAUDE.md`
- `AI00_Common/rules/R*.md`
- `AI00_Common/.claude/commands/`
- `AI00_Common/_docs/help/H00.md` `H06.md` `H10.md` `H13.md`（仅公开4个）
- `setup.ps1` `migrate.ps1`
- `README.md`（英文）
- `LICENSE`

### T00-zh（框架本体 — 中文原版）→ `github-pub/T00-zh/`

发布内容：与 T00 相同，但 README.md 为中文版本。

排除内容：
- `temp0*.md` `RESUME.md` `REQ_STATUS.md`
- `tasks/` `_archive/` `_personal/`
- `PJ*/` 所有项目
- `github-pub/`

### PJxx 项目仓库

发布内容：视项目而定，基本规则：
- 代码文件（src/、app/、lib/ 等）
- README.md
- package.json / requirements.txt（依赖说明）

排除内容：
- `node_modules/` `__pycache__/`
- `.env` `*.key` `credentials.json` `token.json`
- 个人测试数据

---

## 验证清单（每次发布前）

- [ ] 无 `F:\T00` 等绝对路径
- [ ] 无 API Key / 密码（grep 检查）
- [ ] README.md 存在且有内容
- [ ] .gitignore 存在
- [ ] 代码可运行（有 README 说明运行方法）

---

## GitHub 事务处理

用户说「**帮我处理 GitHub [操作]**」时，AI 用 `gh` CLI 执行：

| 用户说 | AI 执行 |
|--------|---------|
| 创建仓库 | `gh repo create` |
| 推送代码 | `git push` |
| 建 PR | `gh pr create` |
| 看 Issues | `gh issue list` |
| 关闭 Issue | `gh issue close` |

---

## 新项目开始前：先搜索现有方案

见 R08_search_first.md
