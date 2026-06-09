---
name: t00-pj-status
description: 查询所有项目状态 — 快速列出当前所有活跃项目的状态和下一步。
---

# /t00-pj-status — 查询所有项目状态

快速列出当前所有活跃项目的状态和下一步。

## 使用方式

```
/t00-pj-status
/t00-pj-status pj90
```

## 执行步骤

1. 读取 `F:\T00\AI00_Common\projects\PROJECTS_INDEX.md`
2. 对每个「当前活跃项目」：
   - 读取 `PJxx_xxx/CLAUDE.md` 的状态行
   - 读取 `PJxx_xxx/REQUIREMENTS.md`（如存在）
   - 检查是否有 FUTURE_FEATURES.md

3. 输出格式：

```
项目状态总览（更新时间：YYYY-MM-DD）

PJ## | 项目名 | 状态 | 下一步
-----|--------|------|------
PJ90 | MyAI   | 开发中 | 加闹钟功能
PJ20 | 認知症 | MVP完成 | 测试邮件功能
...
```

如果指定了项目（如 `/t00-pj-status pj90`），输出该项目的详细待办清单。
