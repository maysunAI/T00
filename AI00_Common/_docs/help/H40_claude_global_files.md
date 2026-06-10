# H40 — Claude Code 全局文件说明

> T00 工作区之外，Claude Code 还会读写哪些文件？路径和作用一览。

---

## 全局文件位置

所有全局文件在 `C:\Users\<用户名>\.claude\`（Windows）
或 `~/.claude/`（Mac/Linux）

---

## 文件一览

| 文件/文件夹 | 作用 | 修改方式 |
|------------|------|---------|
| `settings.json` | 全局设置（权限、hooks、模型等）| `/config` 命令或手动编辑 |
| `settings.local.json` | 本地设置（不上传 git）| 手动编辑 |
| `CLAUDE.md` | 全局 AI 规则（对所有项目生效）| 手动编辑 |
| `keybindings.json` | 快捷键绑定 | `/config` 命令 |
| `projects/<hash>/memory/` | 项目专属 AI 记忆（跨会话）| AI 自动维护 |
| `projects/<hash>/memory/MEMORY.md` | 记忆索引文件 | AI 自动维护 |

---

## settings.json 常用配置

```json
{
  "model": "claude-sonnet-4-6",
  "permissions": {
    "allow": [
      "Bash(git *)",
      "Bash(npm *)",
      "Bash(node *)"
    ]
  },
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [{ "type": "command", "command": "echo 文件已修改" }]
      }
    ]
  }
}
```

---

## projects/ 目录结构

Claude Code 对每个工作区维护独立的记忆：

```
C:\Users\user\.claude\projects\
└── F--T00\                    ← F:\T00 的 hash 名
    └── memory\
        ├── MEMORY.md          ← 记忆索引
        ├── user_workflow.md   ← 用户偏好
        ├── feedback_*.md      ← 反馈记忆
        └── project_*.md       ← 项目上下文
```

---

## 全局 CLAUDE.md vs 项目 CLAUDE.md

| 文件 | 位置 | 作用范围 |
|------|------|---------|
| `~/.claude/CLAUDE.md` | 全局 | 对所有工作区生效 |
| `<project>/CLAUDE.md` | 项目根 | 仅对该项目生效 |
| `<subdir>/CLAUDE.md` | 子目录 | 仅对该子目录生效 |

优先级：子目录 > 项目 > 全局

---

## T00 框架中的对应关系

| T00 文件 | 全局对应 | 说明 |
|---------|---------|------|
| `F:\T00\CLAUDE.md` | — | 根规则 |
| `AI00_Common/CLAUDE.md` | — | 通用规则 |
| `AI00_Common/rules/` | — | 详细行为规则 |
| `~/.claude/projects/F--T00/memory/` | AI 记忆 | 跨会话记住用户偏好 |

---

## 常用操作

**查看当前设置**
```
/config
```

**查看全局记忆**
```
读取 C:\Users\<用户名>\.claude\projects\F--T00\memory\MEMORY.md
```

**清除全局记忆**（谨慎）
```powershell
Remove-Item "C:\Users\<用户名>\.claude\projects\F--T00\memory\" -Recurse
```

---

📎 相关文档：H09_claude_external_config.md — settings.json 详细配置
📎 相关文档：H29_hooks_guide.md — Hooks 配置指南
