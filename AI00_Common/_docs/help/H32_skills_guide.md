# H32 — Skill（自定义命令）完全指南

> 给人看。T00 的 Skill 是什么、能做什么、怎么用。

---

## What — Skill 是什么

Skill = 放在 `.claude/commands/` 里的 `.md` 文件。  
在对话里输入 `/skill-name` 就会激活，Claude 读取该文件内容后执行。

```
.claude/commands/
├── session-end.md    ← /session-end
├── market-research.md ← /market-research
└── my-skill.md       ← /my-skill
```

---

## Why — 为什么用 Skill，不全放进 CLAUDE.md

| 比较项 | CLAUDE.md | Skill（.md in commands/） |
|--------|-----------|--------------------------|
| 触发方式 | 每次会话自动加载 | 手动输入 `/skill-name` 才触发 |
| Token 消耗 | 每次都消耗（始终占用 context）| 只在触发时消耗 |
| 适合内容 | 规则、原则、始终要遵守的习惯 | 步骤性流程、偶尔执行的任务 |
| 参数传递 | 靠关键词触发 | 可传入 `$ARGUMENTS`（如 `/market-research pj90`）|
| 修改影响 | 改了影响所有会话 | 改了只影响触发时 |

**一句话**：规则放 CLAUDE.md，流程放 Skill。

---

## Who — 谁写，谁用

| 角色 | 做什么 |
|------|--------|
| AI（Claude）| 根据你的需求生成 .md 文件 |
| 你 | 输入 `/skill-name` 激活，传参数 |

---

## When — 什么时候适合做成 Skill

适合：
- 有 3 步以上的多步骤操作（如：会话结束存档、发布流程）
- 需要参数（如：`/market-research pj90` 只分析 PJ90）
- 偶尔才做，不需要每次都加载

不适合（保留在 CLAUDE.md）：
- 始终要遵守的规则（如：回答格式、语言要求）
- 每次会话都需要 AI 知道的背景信息

---

## Where — 文件放在哪里

```
F:\T00\AI00_Common\.claude\commands\    ← 所有项目共用（推荐）
F:\T00\PJxx_xxx\.claude\commands\       ← 该项目专用 Skill
```

T00 的 Skill 通过 `AI00_Common/CLAUDE.md` 里的 `@rules/` 等机制继承到所有项目。

---

## How — 怎么创建和使用

### 创建 Skill

```markdown
---
name: my-skill
description: 一句话说明这个 Skill 做什么
---

请执行以下步骤：
1. 读取 $ARGUMENTS 指定的项目
2. 分析...
3. 输出结果到 reply
```

> `$ARGUMENTS` = 用户在 `/my-skill` 后面输入的内容

### 使用 Skill

```
/market-research active        ← 调研所有活跃项目
/market-research pj90          ← 只调研 PJ90
/session-end                   ← 会话结束存档（无参数）
```

---

## Skills 加载机制

### 我的 Skills 怎么加载

Claude Code 启动时自动扫描以下位置的 `.claude/commands/` 文件夹：

```
当前打开的项目根目录
  └── .claude/commands/    ← 项目专用 Skills（只在此项目可用）

父级目录（逐级向上）
  └── .claude/commands/    ← 上级共用 Skills

全局目录（用户级）
  C:\Users\user\.claude\commands\   ← 所有项目都可用
```

**T00 的 Skills 存放位置：**
```
F:\T00\AI00_Common\.claude\commands\    ← T00 共用（在 AI00_Common 下打开时生效）
F:\T00\PJxx_xxx\.claude\commands\       ← 项目专用
```

> 说明：如果你在 `F:\T00` 下打开项目，需要在 `F:\T00\.claude\commands\` 放 Skills 才能全局生效。
> 目前 AI00_Common 的 Skills 放在子目录，在任意项目下使用时要确认是否被自动发现。

---

### 别人的 Skills 怎么加载

**方法：把对方的 `.md` 文件放进你的 `.claude/commands/` 即可。**

来源渠道：
| 来源 | 说明 |
|------|------|
| GitHub 仓库 | 搜索 `awesome-claude-code skills` 或直接下载 `.md` |
| 朋友分享 | 复制 `.md` 文件内容，新建同名文件 |
| 自己写 | 参考「创建 Skill」格式写 |

步骤：
1. 拿到 `.md` 文件（例如 `react-developer.md`）
2. 放入 `F:\T00\AI00_Common\.claude\commands\react-developer.md`
3. 重启 Claude Code（或新开会话）
4. 输入 `/react-developer` 即可使用

---

## T00 现有 Skill 一览

| 命令 | 功能 | 参数 |
|------|------|------|
| `/session-end` | 会话结束 — 写 SESSION_LOG + RESUME | 无 |
| `/git-helper` | Git 操作辅助 | 操作描述 |
| `/ai-developer` | 切换到 AI 应用开发模式 | 无 |
| `/new-project` | 新建项目（自动分配编号）| 项目名 |
| `/publish` | 发布项目到 github-pub | pjXX |
| `/market-research` | 竞品调研 + 设计书分析 | active / all / pjXX |
| `/t00-capture` | 保存当前对话要点到 reply | 无 |
| `/mode-token` | 切换到省 token 模式 | 无 |
| `/mode-human` | 切换到易读模式 | 无 |

---

## 更新 HTML 帮助文档

每次新增帮助文件（H32 等）或修改现有文件后，运行以下命令重新生成 HTML：

```powershell
& "F:\T00\AI00_Common\_docs\gen_help_html.ps1"
```

生成结果：`F:\T00\AI00_Common\_docs\T00_HELP.html`
