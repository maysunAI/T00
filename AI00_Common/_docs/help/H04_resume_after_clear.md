# H04 — /clear 后如何恢复上下文

> 给人看。AI 平时不读此文件。

---

## 说明

- `/clear` 后 AI 忘记对话内容，但 CLAUDE.md 仍自动生效
- AI 仍然知道规则，但不知道「我们聊到哪里了」
- 用下面的恢复命令补充上下文

---

## 恢复命令

### 恢复 AI00_Common 框架讨论
```
请读取 AI00_Common\rules\R00_file_classification.md
我们继续讨论 AI00_Common 的命名规则。
```

### 恢复 T00 目录结构上下文
```
请读取 AI00_Common\_docs\discussion\CONTEXT.md
告诉我现在 AI00_Common 的进展和待完成的事项。
```

### 恢复任意项目（通用）
```
请读取 AI00_Common\projects\PROJECTS_INDEX.md
然后读取 [项目docs路径]/CONTEXT.md
告诉我项目现在的状态和下一步。
```

---

## 当前进展快照（2026-06-03）

| 已完成 | 文件 |
|--------|------|
| T00 目录整理 | `AI00_Common/_docs/discussion/CONTEXT.md` |
| 文件四分类 + 双模式逻辑 | `AI00_Common/rules/R00_file_classification.md` |
| 项目注册表 | `AI00_Common/projects/PROJECTS_INDEX.md` |
| Req/Reply 工作流 | `_docs/help/H02` |

| 待讨论 | 说明 |
|--------|------|
| 命名规则对照表 | 省token/易懂 各类文件的具体命名 |
| 切换模式 slash command | `/token-mode` `/human-mode` |
| 手册 MANUAL.md | 省token模式的使用说明 |
