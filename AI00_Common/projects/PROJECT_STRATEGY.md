# PROJECT_STRATEGY — 项目优先级与推进策略

> 来源：2026-06-07 全项目竞品调研 + 可行性分析
> 更新：随项目进展更新

---

## 推进顺序（已确认）

```
① PJ90 MyAI（手机AI助手）← 现在推进
    ↓ MVP完成后
② PJ20 認知症App（日本认知症）
    ↓ 进入中期
③ PJ20 部分功能 → 做成 PJ90 插件
    → 发布到 GitHub，作为开放平台参考实现
```

**理由**：PJ90 是平台基础；PJ20 是高优先、日本市场；PJ20 作为插件演示 PJ90 开放平台价值，对社区有参考意义。

---

## 活跃项目优先级

| 项目 | 建议 | 优先级 | 核心理由 |
|------|------|--------|---------|
| PJ90 MyAI | ✅ 推荐 | 🔴 高 | 数据主权+免费 = 市场空白 |
| PJ20 認知症App | ✅ 推荐 | 🔴 高 | 270亿日元市场，消费级空白 |
| PJ12 书签管理 | ✅ 推荐 | 🟡 中 | Pocket 关闭，2000万用户流离 |
| PJ14 邮件Agent | ⚠️ 谨慎 | 🟡 中 | 方向独特，安全沙盒是硬需求 |
| PJ16 知识卡片 | ⚠️ 谨慎 | 🟡 中 | 高度同质化，需差异化切入 |
| PJ11 日语笔记 | ⚠️ 谨慎 | 🟡 中 | Anki 生态深，需找课堂场景差异化 |
| PJ17 AI Desk | ⚠️ 谨慎 | 🟢 低 | Cursor 竞争激烈，需重新定位 |

**立即可开发**：PJ20（D01已建）/ PJ12（代码已有，需加扩展+AI）

---

## 全项目调研结果（含 PJzz）

| 项目 | 建议 | 调研文件 |
|------|------|---------|
| PJ90 MyAI | ✅ 推荐（高优）| `PJ90_myai/MARKET_RESEARCH.md` |
| PJ20 認知症 | ✅ 推荐（高优）| `PJ20_dementia_app/MARKET_RESEARCH.md` |
| PJ18 起名 | ✅ 推荐 | `PJzz_future/PJ18_naming/MARKET_RESEARCH.md` |
| PJ19 算命 | ✅ 推荐 | `PJzz_future/PJ19_fortune/MARKET_RESEARCH.md` |
| PJ23 解梦 | ✅ 推荐 | `PJzz_future/PJ23_dream/MARKET_RESEARCH.md` |
| PJ24 占卜 | ✅ 推荐 | `PJzz_future/PJ24_divination/MARKET_RESEARCH.md` |
| PJ25 解签 | ✅ 推荐 | `PJzz_future/PJ25_omikuji/MARKET_RESEARCH.md` |
| PJ12 书签 | ✅ 推荐 | `PJ12_bookmarks/MARKET_RESEARCH.md` |
| PJ14 邮件Agent | ⚠️ 谨慎 | `PJ14_email_agent/MARKET_RESEARCH.md` |
| PJ16 知识卡片 | ⚠️ 谨慎 | `PJ16_knowcard/MARKET_RESEARCH.md` |
| PJ11 日语笔记 | ⚠️ 谨慎 | `PJ11_classnote_jp/MARKET_RESEARCH.md` |
| PJ17 AI Desk | ⚠️ 谨慎（重新定位）| `PJ17_ai_desk/MARKET_RESEARCH.md` |
| PJ22 看病 | ⚠️ 谨慎（监管风险）| `PJzz_future/PJ22_health/MARKET_RESEARCH.md` |
| PJ10 快速笔记 | ❌ 不恢复 | `PJzz_paused/PJ10_quicknote/MARKET_RESEARCH.md` |
| PJ13 AI00 UI | ❌ 不恢复（代码给PJ17用）| `PJzz_paused/PJ13_ai00_ui/MARKET_RESEARCH.md` |

⚠️ `PJzz_arch_old`（15个历史代码项目）：等用户确认是否做（token 消耗大）

---

## 关键洞察

### 灵性产品矩阵
PJ19/PJ23/PJ24/PJ25 用户群高度重叠（18-35岁灵性文化用户）
→ 可作为**「灵性产品矩阵」**统一运营，共享用户 + 互相导流

### PJ12 窗口期
Pocket 关闭，2000万用户流离 → 2026年是切入窗口

### PJ17 重新定位建议
Cursor/Copilot 全面占领 AI 编辑器市场 → PJ17 需要重新找切入点（非全功能竞争）

---

## 已停止项目决策验证

| 项目 | 停止原因 | 市场数据验证 |
|------|---------|------------|
| PJ10 快速笔记 | 系统内置笔记太强 | ✅ 正确：Google Keep/Apple Notes 内置，无法竞争 |
| PJ13 AI00 UI | 被PJ17取代 | ✅ 正确：Cursor 等已主导；Electron 代码给 PJ17 参考用 |
