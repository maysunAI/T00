# H46 — VSCode 常用技巧（AI00 专用）

> 专门整理在 T00/AI00 工作流里最有用的 VSCode 操作。

---

## 常用快捷键

| 操作 | 快捷键 |
|------|--------|
| 快速打开文件 | `Ctrl+P` → 输入文件名片段 |
| 跳转到指定行 | `Ctrl+G` → 输入行号 |
| 文件内搜索 | `Ctrl+F` |
| 全局搜索 | `Ctrl+Shift+F` |
| 打开终端 | `` Ctrl+` `` |
| 拆分编辑器（左右分栏）| `Ctrl+\` |
| 关闭当前标签 | `Ctrl+W` |
| 切换标签 | `Ctrl+Tab` |
| 命令面板 | `Ctrl+Shift+P` |
| 快速打开最近文件 | `Ctrl+R`（在快速打开框里）|

---

## 常用文件快速打开

在 `Ctrl+P` 里直接输入这些片段：
- `PROMOTION` → 打开 PROMOTION.md
- `temp03` → 打开 temp03_reply.md
- `temp01` → 打开 temp01_req.md
- `H00` → 打开帮助索引
- `RESUME` → 打开 RESUME.md

---

## 问题：在 reply 里点击文字，光标跳到文件末尾

**原因**：temp03_reply.md 很长，AI 正在写入文件时 VSCode 会自动滚动到末尾（文件变化时的自动跟随行为）。

**解决方法**：
1. **用 Ctrl+G 跳到指定行**，不要用鼠标滚动（最稳定）
2. **固定标签页**：右键标签 → Pin Tab → 固定后不会被替换，但仍会滚动
3. **关闭自动滚动**：VSCode 设置里搜索 `editor.scrollBeyondLastLine` → 不影响跳转问题，但可以减少干扰
4. **最佳方案**：看 reply 时先按 `Ctrl+G` 输入目标行号跳过去，然后用键盘上下翻（↑↓），不要用鼠标点击

**根本原因说明**：AI 在追加内容到 reply 时，VSCode 检测到文件变化，自动把视图滚动到最新写入位置（文件末尾）。这是正常行为，不是 bug。

---

## 在 VSCode 里查看 reply 的最佳方式

```
方法1：Ctrl+P → temp03_reply → 打开 → Ctrl+G → 输入行号
方法2：Ctrl+Shift+F → 搜索关键词（如「GitHub Topics」）→ 点击结果
方法3：打开 OUTLINE 面板（左侧活动栏）→ 可见所有 ## 标题
```

---

## 左右分栏工作（推荐 AI00 使用）

```
左栏：temp01_req.md（写需求）
右栏：temp03_reply.md（看回答）
```

操作：打开 req → 按 `Ctrl+\` 拆分 → 右栏里 `Ctrl+P` 打开 reply

---

## 更多 VSCode 技巧

| 场景 | 操作 |
|------|------|
| 多行编辑 | Alt+Click（在多处放光标）|
| 选中相同词 | `Ctrl+D`（连续按选多个）|
| 整行移动 | `Alt+↑/↓` |
| 折叠代码块 | `Ctrl+Shift+[`（展开：`Ctrl+Shift+]`）|
| 全部折叠 | `Ctrl+K Ctrl+0`（展开：`Ctrl+K Ctrl+J`）|
| 格式化文件 | `Shift+Alt+F` |
| 打开设置 | `Ctrl+,` |

📎 相关文档：[H38_quick_start.md](H38_quick_start.md) — AI00 快速入门（含 VSCode 分栏截图）
