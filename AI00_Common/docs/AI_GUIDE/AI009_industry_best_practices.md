# AI009 — 业界 Top Claude Code 最佳实践

> 来源：awesome-claude-code、firecrawl.dev、Medium 6个月调优报告、smartscope 11技巧
> 整理日期：2026-06-10

---

## 顶级 Skills 清单

| # | Skill 名 | 核心功能 | 亮点 |
|---|---------|---------|------|
| 1 | **Handoff** | 上下文快用完时压缩会话 | 防止 120k token 断档，生成 transfer doc |
| 2 | **Caveman** | 压缩 AI 输出 token 65% | 去除废话/叙述，只留结论；`/caveman full` 全局启用 |
| 3 | **Context Mode** | 过滤 shell 噪音 + 恢复会话状态 | 可延伸会话长度 3-4 倍 |
| 4 | **Grill Me** | 编码前审问假设 | 防止盲目实现错误需求 |
| 5 | **Webapp Testing** | Playwright 自动测试本地 UI | 真实浏览器跑登录/流程测试 |
| 6 | **Trail of Bits Security** | CodeQL + Semgrep 漏洞扫描 | 自动跑 auth 模块安全审计 |
| 7 | **Skill Creator** | 交互式创建新 skill | 解决「我不会创建 skill」的元问题 |
| 8 | **code-simplifier** | 不改逻辑只提升可读性 | PR 前专用精简 |
| 9 | **Vercel React Best Practices** | 57条性能优化规则 | 大型 React 项目自动套用 |
| 10 | **Superpowers** | 多 Agent 编排工作流 | 脑暴→规划→执行三段式 |

---

## 顶级 Hooks 实践

### PreToolUse — 硬保证机制

```bash
# 阻止写入敏感文件（唯一的硬保证，比 CLAUDE.md 规则强）
if ($path -match '[.](env|pem|key)$') { exit 2 }
```

| Hook 类型 | 用途 | 关键点 |
|----------|------|--------|
| PreToolUse（exit 2）| 阻止写入 .env/.key/.pem | 硬拦截，无法绕过 |
| PostToolUse | 自动格式化、lint 检查 | 每次 Write 后自动跑 |
| 权限白名单 | 减少审批疲劳 | `"allow": ["Bash(npm run test:*)"]` |

### Hook 设计原则

- Hook 要快（< 2秒），慢的逻辑放到 skill
- PreToolUse exit 2 = 硬拦截；exit 0 = 放行；非0非2 = 警告继续
- PostToolUse 加 `2>/dev/null || true` 避免阻塞主流程

---

## 顶级 Memory 实践

- 主 memory 文件 **≤ 500 tokens**（约 30-40 条）
- **只存「代码读不出来」的内容**：决策原因、个人偏好、错误教训
- **禁止存**：架构、文件路径、git 历史（这些读代码就有）
- 定期清理过期 memory（发现过时就删除）
- 每条 memory 加 `Why:` 行，帮助未来判断是否还有效

---

## 顶级 CLAUDE.md / Rules 实践

### 规模控制

- **CLAUDE.md ≤ 2500 tokens（约100行）**，超了就拆到 skill 或 rules
- CLAUDE.md 写「需要判断的建议」；Hooks 写「强制执行的要求」
- 太长的规则 → 移到 skill（按需加载，节省每次会话 token）

### 路径作用域 rules

```markdown
---
description: PJ90 React 开发规范（仅在 PJ90_myai/ 下生效）
globs: ["PJ90_myai/**"]
---
规则内容...
```

### Progressive Disclosure 架构

```
CLAUDE.md（每次会话加载，≤ 100行）
  └── @rules/R06_trust_levels.md（按需）
  └── skills/（触发时才加载 metadata ~100 tokens）
       └── 完整 skill 内容（需要时加载）
```

---

## 参考资源

- [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code)
- [awesome-claude-code-toolkit](https://github.com/rohitg00/awesome-claude-code-toolkit)
- [Claude Code Advanced Best Practices 2026](https://smartscope.blog/en/generative-ai/claude/claude-code-best-practices-advanced-2026/)
- [Best Claude Code Skills 2026](https://www.firecrawl.dev/blog/best-claude-code-skills)
