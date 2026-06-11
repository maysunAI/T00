# H48 — Claude Code 版本检查与升级

---

## 检查当前版本

```bash
claude --version
```

示例输出：`2.1.173 (Claude Code)`

---

## 检查是否有新版本

```bash
npm show @anthropic-ai/claude-code version
```

如果两个版本号相同 → 已是最新，无需操作。

---

## 升级命令

```bash
npm update -g @anthropic-ai/claude-code
```

或强制安装最新：
```bash
npm install -g @anthropic-ai/claude-code@latest
```

---

## 在哪里执行

在 VSCode 终端（`` Ctrl+` ``），确认当前目录任意位置均可。

---

## 2.1.x 版本重要功能

| 功能 | 说明 |
|------|------|
| 子Agent 并行 | 可同时启动多个代理任务（Agent tool）|
| 上下文压缩 | 超长会话自动压缩，无需手动管理 |
| /ultrareview | 多 Agent 云端深度代码审查 |
| MCP 改进 | Playwright/Gmail MCP 更稳定 |
| Fast 模式 | /fast 命令切换，更快输出 |

---

## 版本发布在哪里看

- npm: https://www.npmjs.com/package/@anthropic-ai/claude-code
- 更新日志: https://github.com/anthropics/claude-code/releases

📎 相关文档：[H46_vscode_tips.md](H46_vscode_tips.md) — VSCode 操作和终端使用
