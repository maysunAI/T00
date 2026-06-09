# AI009 — Skill 生态系统调查与改进方向

> 更新：2026-06-08
> 背景：调查业界 AI 编程助手的 Skill/Command 系统，找出 AI00 框架的改进方向

---

## 同类系统对比

| 工具 | Skill 方式 | 触发方式 | 可下载？ |
|------|-----------|---------|---------|
| **Claude Code（我们）** | `.claude/commands/*.md` | `/命令名` | 手动创建 |
| Continue.dev | `.continuerules` + 斜杠命令 | `/命令名` | 插件市场 |
| Cursor | `.cursorrules` 全局规则 | 自动读取 | 社区分享 |
| Aider | `CONVENTIONS.md` | 自动读取 | 无市场 |
| Zed AI | rules 文件 | 自动读取 | 无市场 |
| GitHub Copilot | `.github/copilot-instructions.md` | 自动读取 | 无 |

**我们的优势：**
- 规则系统最完善（R00-R11 分层）
- Skill 可以有复杂逻辑（多步骤 + 条件判断）
- 通过 CLAUDE.md 自动加载

**差距：**
- 没有 Skill 市场（无法一键下载别人的 Skill）
- 没有版本管理（Skill 改了不知道）

---

## AI00 框架现有 Skills

| Skill | 路径 | 功能 |
|-------|------|------|
| `/session-end` | `.claude/commands/session-end.md` | 会话结束存档 |
| `/git-helper` | `.claude/commands/git-helper.md` | Git 操作 |
| `/ai-developer` | `.claude/commands/ai-developer.md` | AI应用开发模式 |
| `/browse` | `.claude/commands/browse.md` | 浏览网页（Playwright MCP）|
| `/hot-topics` | `.claude/commands/hot-topics.md` | 热点话题搜索 |
| `/pj-status` | `.claude/commands/pj-status.md` | 项目状态总览 |

---

## 适合各项目的 Skill 推荐

| 项目 | 推荐 Skill | 说明 |
|------|-----------|------|
| 所有项目 | `/browse` | 查文档/网页 |
| PJ90 | `/ai-developer` | AI应用开发流程 |
| PJ90/PJ20 | `/git-helper` | 版本管理 |
| 所有项目 | `/pj-status` | 快速了解全局状态 |
| 新项目构思 | `/hot-topics` | 从热点找需求 |

---

## 改进方向

1. **Skill 打包发布**：把 AI00 的 Skills 打包成 npm 包
   - `npx install-ai00-skills` → 自动复制到 `.claude/commands/`
   
2. **自动触发（R11 方向）**：
   - 当 AI 说「无法访问网页」→ 自动触发 `/browse`
   - 当新建项目 → 自动触发 `/pj-status` 检查冲突
   
3. **Skill 模板库**：
   - `creative-writing.md` — 写作辅助
   - `code-review.md` — 代码审查
   - `translate.md` — 翻译模式
