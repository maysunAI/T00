# H06 — AI00 框架总览

> 给人看。AI 平时不读此文件。

---

## 目录结构

```
F:\T00\
├── CLAUDE.md                      ← 根规则，所有子项目自动继承
├── AI00_Common\                   ← 共通框架（跨项目通用）
│   ├── CLAUDE.md                  ← 框架规则主文件
│   ├── rules\                     ← AI规则（R01/R03/R05-R07/R09-R10）
│   │   ├── R01_priority.md        ← 规则优先级系统（L1-L4）
│   │   ├── R03_manual_edit_protection.md
│   │   ├── R05_agent_roles.md
│   │   ├── R06_trust_levels.md
│   │   ├── R07_github_workflow.md
│   │   ├── R09_requirement_estimation.md
│   │   └── R10_market_research.md
│   ├── docs\AI_GUIDE\             ← AI 使用指南（AI001-AI008）
│   ├── .claude\commands\          ← Slash 命令（全部 t00- 前缀，共19个）
│   ├── projects\
│   │   ├── PROJECTS_INDEX.md      ← 项目注册表
│   │   └── T00_SEARCH_INDEX.md   ← 多维搜索索引（按技术栈/状态/功能域）
│   └── _docs\                     ← 人看，AI不自动读
│       ├── help\                  ← H00-H36 使用说明
│       └── discussion\
│           └── SESSION_LOG.md     ← 会话记录（再见时追加）
├── PJxx_项目名\                   ← 各项目代码
├── temp01_req.md                  ← 发给 AI 的问题/需求
├── temp02_草稿.md                 ← 草稿（写好了再告诉AI）
├── temp03_reply.md                ← AI 回复记录
├── RESUME.md                      ← /clear 后恢复说明
└── Z01_archive\                   ← 归档

```

---

## 核心功能一览

| 功能 | 怎么用 |
|------|--------|
| 规则自动生效 | 放在 CLAUDE.md，session 开始自动读 |
| 发问题给 AI | 写 temp01_req.md → 告诉行号 → 看 temp03_reply.md |
| 草稿 | 写 temp02_草稿.md，写好了再告诉 AI |
| /clear 后恢复 | 见 H04，或说「读 RESUME.md」 |
| 会话记录 | 说「再见」→ 自动写 SESSION_LOG.md |
| 自动装工具 | AI 发现缺包自动安装，不问你 |
| 保护手动修改 | 代码里加 `[手动修改]` 注释 |
| 记录未来想法 | 说「以后想做 XX」→ AI 记录不实现 |
| 新项目 | 在 PROJECTS_INDEX.md 加一行 |

---

## /clear 后快速恢复

```
请读取 F:\T00\AI00_Common\_docs\discussion\SESSION_LOG.md 最后一条
继续上次的工作。
```

---

## 文件人/AI 区分速查

| 看文件夹名 | 含义 |
|-----------|------|
| `_` 前缀（_docs）/ `Z` 前缀（Z01_archive / Z02_personal） | 人专用，AI 不自动读 |
| 无前缀（rules / docs / projects） | AI 读 |
| 根目录大写（CLAUDE.md / RESUME.md） | 双方，自动加载 |
