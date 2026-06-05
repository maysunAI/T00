# AI00_Common — 框架设计原则

> 通用内容，可随 AI00_Common 复制到任何工作区（T01、T02…）
> 最后更新：2026-06-03

---

## 文件三分类系统

| 类型 | 谁写 | 谁读 | 例子 |
|------|------|------|------|
| 给 AI 看 | 人写好放着 | Claude 自动读 | CLAUDE.md、rules/、prompts/ |
| 给人看 | Claude 写 | 人来检查 | 设计书、变更日志、bug 记录 |
| 人机共用 | 双方都写 | 双方都读 | INBOX、session QA、slash 命令 |

---

## 工作区目录规则

```
T##\
├── CLAUDE.md                  ← 自动引用 AI00_Common
├── AI00_Common\               ← 本框架（复制到每个工作区）
│   ├── rules\
│   ├── docs\
│   ├── projects\
│   │   └── PROJECTS_INDEX.md  ← 本工作区的项目注册表
│   └── .claude\commands\
└── ProjectName\
    ├── ProjectName\            ← 代码
    └── ProjectName_docs\       ← 记忆备份（实际内容在这里）
```

---

## 10 个参考工具

| # | 工具 | 用途 |
|---|------|------|
| 1 | Claude Code VSCode Extension | Session 列表、Plan 视图、MCP 管理 |
| 2 | vscode-mcp (tjx666/vscode-mcp) | VSCode LSP 诊断实时送给 Claude |
| 3 | MCP 协议 | 给 Claude 接 filesystem/git/browser |
| 4 | Dynamic Workflows | 并行子 Agent，适合复杂任务 |
| 5 | Skills (.claude/commands/) | 自定义模式切换命令 |
| 6 | Hooks (settings.json) | 自动触发脚本 |
| 7 | CLAUDE.md 父目录继承 | 根目录规则对所有子项目生效 |
| 8 | claude-code-workflows (shinpr/GitHub) | 开源多 Agent 工作流模板 |
| 9 | Memory 文件系统 | 跨会话恢复上下文 |
| 10 | settings.json 双层配置 | 项目级（git）+ 个人级（.gitignore）分离 |

---

## AI00_Common 待填充内容

- [x] rules/R00_file_classification.md — 文件分类+双模式逻辑（已完成草稿）
- [ ] 命名规则具体对照表
- [ ] 切换模式的 slash command
- [ ] 手册 MANUAL.md（省token模式说明）
- [ ] rules/（其他开发规范）
- [ ] docs/AI_GUIDE/（AI 使用指南）
- [ ] .claude/commands/（其他 Slash 命令）
