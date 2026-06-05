# H07 — Claude Code 工具生态比较

> 给人看。AI 平时不读此文件。更新日：2026-06-05

---

## 主流工具一览（VSCode + GitHub）

| # | 工具 | 类型 | VSCode集成 | GitHub星标 |
|---|------|------|-----------|-----------|
| 1 | **Continue**（continuedev/continue）| 多模型AI助手 | 专用扩展 | ⭐20k+ |
| 2 | **Aider**（paul-gauthier/aider）| 终端AI编程 | VSCode Terminal | ⭐20k+ |
| 3 | **Cline**（saoudrizwan/cline）| Claude专用助手 | 专用扩展 | ⭐15k+ |
| 4 | **RooCode**（RooVetGit）| AI助手 | 专用扩展 | ⭐5k+ |
| 5 | **awesome-claude-code-toolkit** | 资源集合 | — | ⭐1k+ |
| 6 | **claude-forge**（sangrokjung）| AI00类框架 | — | ⭐中等 |
| 7 | **ClaudeCodeExtension**（dliedke）| UI增强 | 专用扩展 | ⭐小众 |
| 8 | **Claudix**（Haleclipse）| UI美化 | 专用扩展 | ⭐小众 |
| 9 | **官方 Claude Code VSCode 扩展**（Anthropic）| 官方 | 专用扩展 | 2M+安装 |
| 10 | **Cursor** | AI编辑器 | 独立编辑器 | 非开源 |
| 11 | **Windsurf**（Codeium）| AI编辑器 | 独立编辑器 | 非开源 |
| 12 | **Copilot**（GitHub）| AI助手 | 深度集成 | 非开源 |
| 13 | ciscoittech/claude-agent-framework | 多Agent框架 | — | ⭐小众 |
| 14 | Dive-into-Claude-Code（VILA-Lab）| 研究分析 | — | ⭐中等 |
| 15 | claude-code-ultimate-guide | 指南 | — | ⭐中等 |

> 星标数据为截至2026年初估算值，以GitHub实时数据为准。

---

## 效率 / Token 使用比较

| 工具 | Token策略 | 效率特点 | 成本 |
|------|---------|---------|------|
| **AI00** | 行号读取省token，L1/L2分层 | 跨会话成本低 | 按API计费 |
| **Cline** | 自动读写文件，token较高 | 自动化强，消耗多 | 按API计费 |
| **Continue** | 支持local model | 可用免费本地模型 | 可免费 |
| **Aider** | 精确diff，高效 | SWE-bench高分 | 按API计费 |
| **Cursor** | 内置模型，月费 | 快，不透明 | $20/月起 |
| **官方扩展** | 直接接Claude | 标准效率 | 按API计费 |

**AI00 token优势：** 行号通信（只读新内容）+ RESUME.md分层（会话启动省80%）

---

## 不同人群推荐

| 人群 | 推荐工具 | 原因 |
|------|---------|------|
| 初学者（不会配置）| Cursor / Continue | 开箱即用，UI友好 |
| **个人开发者（多项目）**| **AI00** | 跨项目规则继承，需求跟踪 |
| 团队开发 | Cline / Continue | 有团队分享功能 |
| 省钱用户 | Continue（本地模型）/ Aider | 可用免费模型 |
| **重度Claude用户** | **AI00 + 官方扩展** | 充分利用Claude特性 |
| 快速prototype | Cursor / Windsurf | AI自动补全 |
| 研究/学习 | Aider / AI00 | 透明可控有记录 |

---

## AI00 vs 其他工具定位

| 维度 | AI00 | 其他工具 |
|------|------|---------|
| 安装复杂度 | 极低（复制文件夹）| 低~中 |
| 跨会话记忆 | ✅ RESUME.md + SESSION_LOG | 大多数无 |
| 跨项目规则继承 | ✅ CLAUDE.md父目录继承 | ❌ 基本无 |
| 需求跟踪 | ✅ req/reply/tasks/ | ❌ 无 |
| 设计书功能 | ✅ D01格式+批注 | ❌ 无 |
| UI | ⚠️ PJ13开发中 | ✅ 有UI |
| 学习成本 | 中（H00-H12指南）| 低~中 |

**关键结论：** AI00是「规则+记忆+流程」框架，其他是「AI执行引擎」。可叠加使用（AI00规则 + Cline执行），不是替代关系。

---

## 推荐组合

- **个人日常开发**：AI00 + 官方 VSCode 扩展
- **找现成 Agent**：awesome-claude-code-toolkit
- **速度参考**：ciscoittech 并行 Agent 设计
- **直接用 Sub-Agent**：a-list-of-claude-code-agents
- **省钱**：Continue + 本地模型（Ollama）
