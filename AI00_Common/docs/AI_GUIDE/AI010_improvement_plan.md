# AI010 — T00 改进计划（业界 vs 现状 Gap 分析）

> 基于 AI009 业界最佳实践，对 T00 现状的差距分析与行动清单
> 分析日期：2026-06-10

---

## T00 现状盘点

**Commands（18个，全部 t00- 前缀）：**
t00-session-end / t00-ai-dev / t00-git / t00-mode-token / t00-mode-human /
t00-capture / t00-perf-check / t00-backup / t00-status / t00-help /
t00-research / t00-new-pj / t00-publish / t00-browse / t00-hot /
t00-pj-status / t00-estimate / t00-compact（新）

**Rules（10个）：** R00~R11（文件分类/手动保护/未来功能/Agent角色/信任级别/GitHub/搜索优先/需求预估/市调/能力扩展）

**Memory（6条）：** Electron重启/启动清理/协作方式/AI00框架/项目注册/Reply格式

**Hooks（4个）：** PreToolUse（敏感文件防护）+ PostToolUse（行数检查 + HTML更新）+ Stop + SessionStart

---

## Gap 清单与行动状态

| 优先级 | 业界实践 | 状态 | 完成时间 |
|--------|---------|------|---------|
| 🔴 高 | PreToolUse Hook（防写 .env/.pem/.key） | ✅ 完成 | 2026-06-10 |
| 🔴 高 | Token 压缩 Skill（t00-compact） | ✅ 完成 | 2026-06-10 |
| 🔴 高 | Handoff 上下文压缩（t00-session-end 升级） | ✅ 完成 | 2026-06-10 |
| 🟡 中 | Context 监控（t00-perf-check 加 token 估算） | ✅ 完成 | 2026-06-10 |
| 🟡 中 | Playwright UI 测试（t00-playwright-test） | ✅ 完成 | 2026-06-10 |
| 🟡 中 | 路径作用域 rules（PJ17/PJ90 专属规则） | ✅ 完成 | 2026-06-10 |
| 🟢 低 | Skill Creator | ⏳ 暂缓 | 低优，自己懂怎么建 |
| 🟢 低 | Security Audit（CodeQL/Semgrep） | ⏳ 暂缓 | Cloudflare 上线前再加 |

---

## 具体建议（结合 T00 项目）

### PJ90（MyAI）
- Playwright UI 测试（`/t00-playwright-test`）— 已建
- 路径作用域 rules：`F:\T00\.claude\rules\pj90-rules.md` — 已建
- PreToolUse 防止意外写 .env — ✅ 已覆盖全局

### PJ17（AI Desk）
- 路径作用域 rules：`F:\T00\.claude\rules\pj17-rules.md` — 已建
- Electron 特有规则（重启提醒、端口清理）— 已在 memory 中

### 全局
- CLAUDE.md 优化：AI00_Common/CLAUDE.md 已超 100 行，考虑将「沟通规则」中不常用部分拆到 skill

---

## 未来中期计划

- **Context 监控增强**：在 PostToolUse 中加入自动提示「你已使用约 X% context」
- **Security Audit**：Cloudflare Worker 上线前，给 `t00-session-end` 加安全检查步骤
- **Skill Creator**：参考 awesome-claude-code 的 Skill Creator 模板，进一步简化建 skill 流程
