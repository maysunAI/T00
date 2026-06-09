# H29 — Claude Code Hooks 指南

> 来源：用户提问（2026-06-07）

---

## 什么是 Hooks（5W1H）

| | 说明 |
|--|------|
| **What** | Claude Code 在特定事件发生时自动运行的 shell 命令 |
| **Why** | 自动化重复操作，不需要每次手动执行 |
| **Who** | 你在 settings.json 里配置；Claude 触发事件时自动执行 |
| **When** | 特定事件：工具调用前后、AI 停止时等 |
| **Where** | `.claude/settings.json`（项目级）或 `~/.claude/settings.json`（全局）|
| **How** | 在 settings.json 的 `hooks` 数组中添加配置，或用 `/update-config` skill |

---

## 可用事件类型

| 事件 | 触发时机 |
|------|---------|
| `PreToolUse` | Claude 调用工具之前 |
| `PostToolUse` | Claude 调用工具之后 |
| `Stop` | Claude 完成回复停止时 |
| `SubagentStop` | 子 Agent 停止时 |

---

## 配置格式（settings.json）

```json
{
  "hooks": [
    {
      "event": "Stop",
      "command": "echo 'AI 已完成，请检查 reply'"
    },
    {
      "event": "PostToolUse",
      "matcher": "Edit",
      "command": "git add -A"
    }
  ]
}
```

---

## T00 推荐使用场景

| Hook | 事件 | 命令示例 | 用途 |
|------|------|---------|------|
| AI 停止提醒 | Stop | `echo 记得保存📦` | 提醒执行建议保存 |
| 自动暂存修改 | PostToolUse(Edit) | `git add -A` | 防止忘记 git add |
| reply 自动备份 | Stop | 备份脚本 | 定期备份 reply |

---

## 你目前是否在用

是的，T00 系统中已配置了 hooks（用于工具权限控制等）。
用 `/update-config` skill 可以查看和修改现有 hooks 配置。

---

## 相关文档

- H28_slash_commands_guide.md — Slash 命令自定义
- update-config skill — 配置 settings.json 的工具
