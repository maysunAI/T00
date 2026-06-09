---
name: t00-status
description: 显示当前工作区状态：项目列表、req/reply 行数、未完成任务、上次会话摘要
---

用户说「/t00-status」时，输出当前状态报告：

## Step 1：文件状态

读取并统计：
- `temp01_req.md` → 总行数，最后有效内容行
- `temp03_reply.md` → 总行数，最后一个 ══════ 块的位置

## Step 2：任务状态

读取 `F:\T00\tasks\TASK_INDEX.md`，列出「进行中 🔄」和「待处理 📋」的任务（高优先级优先）。

## Step 3：RESUME 摘要

读取 `F:\T00\RESUME.md`，提取「下一步」部分。

## 输出格式

```
=== T00 当前状态 ===

📄 通信文件
  req:   XX 行（最后处理到第XX行）
  reply: XX 行（最后区块第XX行）

🔄 进行中任务
  T015 PJ11 Phase 2-6
  T018 任务化系统

📋 待处理（高优先）
  T033 AI00发布到GitHub
  T036 T00/T00-zh 发布

📌 上次会话下一步
  （RESUME.md 下一步内容）
```
