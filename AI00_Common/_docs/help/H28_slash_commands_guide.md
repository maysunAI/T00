# H28 — T00 Slash 命令指南

> 适用：所有 T00/AI00 框架用户
> 更新：2026-06-10

---

## 什么是 Slash 命令

在 Claude Code 对话框输入 `/命令名` 触发预定义的操作流程。T00 内置 17 个命令，覆盖会话管理、项目操作、分析评估等场景。

---

## 命令总览

### 📋 会话管理

| 命令 | 功能 |
|------|------|
| `/session-end` | 会话结束时存档：写入 SESSION_LOG + 更新 RESUME.md + 输出下次开始命令 |
| `/t00-backup` | 手动备份 req/reply 到 `Z01_archive/`（含时间戳，不清空原文件）|
| `/t00-status` | 显示当前状态：req/reply 行数、进行中任务、上次会话下一步 |

### 🚀 项目管理

| 命令 | 功能 |
|------|------|
| `/new-project [名称]` | 自动分配编号、建文件夹、建 CLAUDE.md、注册到 PROJECTS_INDEX |
| `/pj-status [PJxx]` | 查看指定项目的状态和进度 |
| `/publish [项目]` | 发布项目到 github-pub 暂存区，执行安全检查后等待确认推送 |

### 🔍 分析与评估

| 命令 | 功能 |
|------|------|
| `/estimate [描述]` | 开始前：需求可达性预估；完成后：输出完成度报告 |
| `/t00-perf-check` | 检查 Claude 效率配置：@include 行数、skills 列表、hooks 状态 |
| `/code-review` | 代码审查，找 bug 和优化点 |

### 🌐 研究工具

| 命令 | 功能 |
|------|------|
| `/browse [URL]` | 打开网页并提取内容 |
| `/market-research [关键词]` | 市场调研：搜索竞品、整理对比表 |
| `/hot-topics` | 搜索当前热点话题 |

### ⚙️ 开发与模式

| 命令 | 功能 |
|------|------|
| `/ai-developer` | 切换到 AI 应用开发模式（含 API、agent、MCP 等专业上下文）|
| `/git-helper [操作]` | Git 操作助手：commit、push、branch 管理 |
| `/mode-token` | 切换省 token 模式（单文件 + [批注]）|
| `/mode-human` | 切换易懂模式（双文件，含详细说明）|

### ❓ 帮助

| 命令 | 功能 |
|------|------|
| `/t00-help [命令名]` | 无参数：列出所有命令；有参数：显示该命令详细用法 |

---

## 自动 Hooks（无需触发，后台运行）

| 触发时机 | 动作 |
|---------|------|
| 写入/编辑 `temp01_req.md` 或 `temp03_reply.md` 后 | 检查行数，超过 2000 行输出警告 |
| 写入任何 `H*.md` 帮助文件后 | 自动运行 `gen_help_html.ps1` 更新 HTML |
| Claude 停止回答时 | 提示「说再见运行 /session-end」|
| 会话开始时 | 显示 RESUME.md 前30行（上次会话摘要）|

---

## 使用示例

```
/new-project knowcard          → 建立 PJ16_knowcard 项目
/estimate 实现用户登录功能      → 评估可达性
/publish pj90                  → 发布 PJ90 到 github-pub
/t00-backup                    → 备份当前 req/reply
/t00-perf-check                → 检查效率配置
/t00-help publish              → 查看 publish 命令详细用法
```

---

## 添加自定义命令

在 `AI00_Common/.claude/commands/` 下新建 `.md` 文件，格式：

```markdown
---
name: 命令名
description: 一行说明
---

命令执行逻辑（用自然语言描述，Claude 会按此执行）
```

保存后立即生效，无需重启。

---

📎 相关文档：`AI00_Common/rules/R05_agent_roles.md` — 何时触发子 Agent
