# H41 — GitHub 星标获取指南（欢迎度建议）

> 来源：T00 推广实践讨论（2026-06-11）
> 核心原则：**先考虑欢迎度，再去推广**

---

## 核心洞察

> **星标来自「被需要」，不来自「被推广」。**

用户给你星标的原因只有一个：**它解决了我的问题**。

推广前先检查三件事：
1. README 第一屏，5 秒内看懂这是什么吗？
2. 快速开始，10 分钟内能用起来吗？
3. 有真实解决的问题吗（不是「另一个工具」）？

---

## 提升欢迎度的 5 件事（先于推广）

### 1. GitHub Topics（最省力，30 秒）

这是 GitHub 内部搜索流量的来源。

**操作**：
1. 打开仓库 → 右上角 About 旁齿轮 ⚙️
2. Topics 填入：
```
claude-code  anthropic  ai-workflow  productivity
prompt-engineering  developer-tools  llm  chinese
workflow-automation  context-management
```

### 2. README 第一屏优化

第一屏（不滚动就能看到的部分）必须包含：
- **一句话说清楚**：这是什么，解决什么问题
- **对谁有用**：目标用户明确
- **如何开始**：10 分钟能用起来

✅ T00 当前状态：已完成（中文版 README.md）

### 3. 项目描述（About）

GitHub 仓库右侧的 About 描述，会出现在搜索结果里。

**建议填写**：
```
Claude Code AI 协作框架 — 会话记忆 + 规则继承 + 行号追踪，解决 AI 上下文丢失问题
```

**操作**：About 旁齿轮 → Description 填入描述 → Website 填入 GitHub Pages 网址（如有）

### 4. Demo 截图/GIF

README 里加一张能「1 秒看懂是什么」的图：
- VSCode 分栏截图（已有：`assets/vscode_split.png`）
- 或：req→reply 工作流的 GIF 动图

### 5. CONTRIBUTING.md

表明项目在维护中，欢迎贡献：

```markdown
# Contributing to AI00

Issues, PRs, and feedback are welcome!

## Ways to contribute
- 🐛 Report bugs via [Issues](link)
- 💡 Suggest features via [Discussions](link)
- 🌍 Translate help docs
- ⭐ Star the repo to help others find it
```

---

## 获取星标的 5 个渠道（按效果排序）

### 渠道1：帮助别人解决问题（最可持续）

**在 r/ClaudeAI 里找「求助帖」，认真回答 + 末尾附 T00 链接**

操作流程：
1. 打开 https://www.reddit.com/r/ClaudeAI
2. 搜索：`context loss` OR `how to remember` OR `session reset`
3. 找到相关问题 → 先完整回答 → 最后说：
   > "I've also built a framework called AI00/T00 that automates this pattern — [link]. Might be useful."
4. **不要只发链接** — 那是 spam；完整回答才是真诚的

**效果**：每 10 个认真回答 → 约 1-3 个 star

### 渠道2：Reddit 发帖（最快见效）

**文案**：`PJ15_ai00_publish/POSTING_GUIDE.md` 第一章

**最佳发帖时间**：UTC 周二-周四 10:00-14:00（北美工作日上午）

**注意**：先积累 karma（见 POSTING_GUIDE.md）

### 渠道3：Hacker News Show HN（高风险高回报）

格式：`Show HN: AI00 – A workflow framework for Claude Code that makes sessions resumable`

- 如果进首页 Top 10 → 可得 100-500 stars 单日
- 如果没反应 → 0 效果
- 最佳时机：周一-周三 UTC 09:00-11:00

**准备充分后再发**（先在 Reddit 验证反响）

### 渠道4：dev.to 文章（稳定流量）

写一篇教程文章：
> 「I got tired of re-explaining context to Claude every session — here's what I built」

把 T00 的功能用故事形式讲出来。末尾引流到 GitHub。

### 渠道5：微信群/知乎（中文用户）

文案：`AI00_Common/_docs/PROMOTION.md` 第一章节（中文版）

---

## 注意：不要做的事

| 行为 | 为什么不做 |
|------|----------|
| 买 Stars（刷星）| GitHub 会检测并撤销，损害信誉 |
| 只发链接不解释 | 被标记为 spam |
| 在不相关版块发 | 惹人反感 |
| 连续发多次相同帖子 | 封号 |

---

## 实际时间线预期

| 方法 | 时间投入 | 预期效果 |
|------|---------|---------|
| GitHub Topics | 30 秒 | 长期搜索流量 |
| 第一次 Reddit 帖子 | 1 小时 | 5-50 stars |
| 连续帮助 10 个用户 | 1-2 周 | 10-30 stars |
| Hacker News（如果爆了）| 1 篇文章 | 100-500 stars |
| dev.to 文章 | 2-3 小时 | 10-50 stars/月（持续）|

**现实期望**：前 3 个月 50-200 stars 是正常范围；「一夜爆红」少见，不要作为目标。

---

📎 相关文档：PJ15_ai00_publish/POSTING_GUIDE.md — 各平台发帖步骤
📎 相关文档：AI00_Common/_docs/PROMOTION.md — 推广文案库
