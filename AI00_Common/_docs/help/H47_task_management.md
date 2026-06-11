# H47 — 任务管理：不再错过待办事项

> **问题**：和 AI 聊了很多，结论太多记不住，重要事项经常漏掉。

---

## T00 的任务管理文件

`temp04_pending.md` = 你的待办清单，AI 和你共同维护。

---

## 如何使用

### 新增待办

对 AI 说：
```
加入待办：P008 GitHub Topics 设置
```
```
提醒我：Reddit 帖子草稿需要确认
```
```
放到待做里：PJ32 上线 MVP
```

AI 会自动追加到 temp04_pending.md，格式：
```
- [ ] P012 事项描述
```

---

### 查看待办

```
查看 pending
```
或
```
查看待办
```

AI 会读取 temp04_pending.md，列出所有未完成（`[ ]`）的事项。

---

### 标记完成

```
P008 完成了
```

AI 会把 `[ ]` 改为 `[x]` 并加日期标注。

---

## 文件在哪里

`F:\T00\temp04_pending.md`

在 VSCode 里：`Ctrl+P` → 输入 `temp04` → 打开

---

## 与 SESSION_LOG 和 RESUME 的关系

| 文件 | 用途 |
|------|------|
| `temp04_pending.md` | 待做事项（你要做的）|
| `RESUME.md` | 下次 AI 会话恢复用（AI 读）|
| `SESSION_LOG.md` | 每次会话记录（人查历史用）|

**流程**：reply 里出现 ⏳ 等待的事 → 加入 pending → 完成后打 ✅

---

## 子Agent 触发词（进阶）

如果你想让 AI 分工处理任务：

| 说这句 | AI 执行 |
|--------|---------|
| 帮我搜 [X] | 派 Explore 子Agent 搜索代码/文件 |
| 帮我规划 [X] | 派 Plan 子Agent 设计实现方案 |
| 审查这段代码 | 派 code-review 子Agent 检查代码 |

📎 相关文档：[H44_daily_memory.md](H44_daily_memory.md) — 每天做了什么/会话记忆
📎 相关文档：[H45_reply_query.md](H45_reply_query.md) — 如何查找 reply 里的信息
