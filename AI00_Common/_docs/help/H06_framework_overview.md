# H06 — AI00 框架总览

> 给人看。AI 平时不读此文件。

---

## 目录结构

```
F:\T00\
├── CLAUDE.md                      ← 根规则，所有子项目自动继承
├── AI00_Common\                   ← 共通框架（跨项目通用）
│   ├── CLAUDE.md                  ← 框架规则主文件
│   ├── rules\
│   │   ├── R00_file_classification.md   ← 文件分类 + 双模式 + 命名规则
│   │   ├── R03_manual_edit_protection.md
│   │   └── R04_future_features.md
│   ├── docs\AI_GUIDE\             ← AI 使用指南（AI001-AI008）
│   ├── .claude\commands\          ← Slash 命令
│   │   ├── session-end.md
│   │   ├── git-helper.md
│   │   └── ai-developer.md
│   ├── projects\
│   │   └── PROJECTS_INDEX.md      ← 项目注册表
│   └── _docs\                     ← 人看，AI不自动读
│       ├── help\                  ← H01-H06 使用说明
│       └── discussion\
│           ├── CONTEXT.md         ← 框架设计背景
│           └── SESSION_LOG.md     ← 会话记录（再见时追加）
├── PJ01_maysunAI\                 ← 项目代码
├── Req1.md                        ← 发给 AI 的问题/需求
├── Req2.md                        ← 草稿
├── Reply.md                       ← AI 回复记录
├── RESUME.md                      ← /clear 后恢复说明
└── _archive\                      ← 归档

```

---

## 核心功能一览

| 功能 | 怎么用 |
|------|--------|
| 规则自动生效 | 放在 CLAUDE.md，session 开始自动读 |
| 发问题给 AI | 写 Req1.md → 告诉行号 → 看 Reply.md |
| 草稿 | 写 Req2.md，写好了再告诉 AI |
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
| `_` 前缀（_docs / _archive） | 人专用，AI 不自动读 |
| 无前缀（rules / docs / projects） | AI 读 |
| 根目录大写（CLAUDE.md / RESUME.md） | 双方，自动加载 |
