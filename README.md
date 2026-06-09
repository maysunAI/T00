# AI00 — AI 协作框架

> 让每次 AI 对话都可追溯、可复用

---

## 解决什么问题

长期与 AI 合作时，最大的痛点是：
**对话越来越长，找不到之前讨论过的内容。**

AI00 用简单的 req→reply 工作流解决这个问题：需求写入固定文件，回答写入固定文件，每条回答都注明来源行号。

---

## 30 秒入门

**第 1 步：在 `temp01_req.md` 写需求**

```
1. 检查登录功能有没有 bug
2. 确认测试覆盖率
```

**第 2 步：AI 在 `temp03_reply.md` 整理后回答**

```
══════════════════════════════
❓ [2026-06-10 10:30]
原文：
[1] 检查登录功能有没有 bug
[2] 确认测试覆盖率

AI整理后的问题（mapping 原文）
1. (原文 [1]) 登录 bug 检查
2. (原文 [2]) 测试覆盖率确认
───────────────────────────────
回答

1. (原文 [1]) 发现 session 过期问题 — 已在 auth.js:42 修复

2. (原文 [2]) 当前覆盖率 73%，建议优先补充登录模块。

📌 req 第 1-2 行 → reply 第 8 行 ✅
```

**效果**：任何时候，`📌` 标记都能追溯到原始需求行，`(原文 [n])` 注明对应哪条需求。

---

## 目录结构

```
T00/
├── CLAUDE.md                    ← 根规则（自动加载）
├── AI00_Common/
│   ├── CLAUDE.md                ← 通用规则（含沟通协议）
│   ├── rules/                   ← AI 行为规则（R01–R10）
│   ├── .claude/commands/        ← Slash 命令
│   └── projects/PROJECTS_INDEX.md
├── temp01_req.md                ← 用户写需求
├── temp02_草稿.md               ← 草稿区
├── temp03_reply.md              ← AI 写回答
└── PJxx_项目名/                  ← 各项目文件夹
```

---

## 关键触发词

| 说这句话 | AI 执行 |
|---------|---------|
| `req X行以后` | 从第 X 行读 req，回答写入 reply |
| `建项目 xxx` | 自动建文件夹 + 注册到 PROJECTS_INDEX |
| `草稿更新` | 读草稿 → 追加到 req → 回答 → 清空草稿 |
| `再见` | 自动存档 + 更新 RESUME.md |

---

## 特性

- **中文优先**：所有回答输出中文
- **行号追踪**：每条回答注明 req/reply 行号
- **快速建议模式**：直接给推荐方案，不啰嗦
- **自动存档**：会话结束自动更新 RESUME.md
- **Slash 命令**：`/t00-session-end` `/t00-git` `/t00-new-pj` 等

---

## Help 文档系统

AI00 内置 39 篇使用指南，覆盖从入门到高级的全部用法。

| 类别 | 文件 | 内容 |
|------|------|------|
| 入门 | H10_getting_started.md | 5 分钟上手 |
| 工作流 | H02_req_reply_workflow.md | req→reply 完整流程 |
| 命令 | H05_slash_commands.md | 全部 Slash 命令说明 |
| 发布 | H13_github_publish.md | GitHub 发布指南 |
| 提示词 | H25_prompt_cheatsheet.md | 常用触发词速查 |
| … | [查看全部 39 篇](https://github.com/maysunAI/help) | |

**生成合并 HTML**（单文件，手机可用）：

```powershell
# 自动合并所有 H*.md 为 T00_HELP.html
.\AI00_Common\_docs\gen_help_html.ps1
```

**在线阅读**：发布到 `maysunAI/help` repo（GitHub Pages 开启后可手机访问）

---

## 使用协议

[MIT License](LICENSE) — 自由使用、修改、分发。
