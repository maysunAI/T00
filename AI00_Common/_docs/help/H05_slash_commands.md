# H05 — 可用 Slash 命令

> 给人看。AI 平时不读此文件。

---

## Claude Code 内建命令

| 命令 | 说明 |
|------|------|
| `/clear` | 清除对话上下文（规则仍生效） |
| `/compact` | 压缩上下文，节省 token |
| `/context` | 查看当前 token 使用量 |
| `/memory` | 查看记忆文件列表 |
| `/mcp` | 查看 MCP 工具 |

---

## PJ01_maysunAI 项目命令

| 命令 | 说明 |
|------|------|
| `/req-check` | 读取 R01_requests.md 最新内容并执行 |
| `/project-status` | 查看 maysunAI 当前开发状态 |

---

## 自然语言触发（不需要斜杠）

| 说法 | 效果 |
|------|------|
| `Req1.md XX行后更新了` | 读取并写入 Reply.md（AI00 通用） |
| `req XX行以后更新了` | 读取 R01_requests.md 执行需求（maysunAI） |
| `inbox XX行以后更新了` | 读取 R00_INBOX.md 执行（maysunAI） |
| `doc XX行以后更新了` | 读取设计书变更并执行（maysunAI） |
