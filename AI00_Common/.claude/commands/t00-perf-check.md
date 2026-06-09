---
name: t00-perf-check
description: 检查 Claude 效率配置：自动加载量、token 估算、skills、hooks，输出优化建议
---

用户说「/t00-perf-check」时，执行以下检查并输出报告：

## Step 0：Context 用量估算

基于已加载内容估算 token 使用量：
- 计算公式：`行数 × 15 tokens/行`（中英混合平均值）
- Claude Sonnet 有效工作区间：≤ 150k tokens（总 200k，留 50k 给对话）
- 自动加载内容目标：≤ 5k tokens（约 333 行）

输出：
```
📊 Context 估算
  自动加载：约 XXX tokens（占总量 X%）
  状态：✅ 正常 / ⚠️ 偏多（> 5k tokens）/ 🔴 过多（> 10k tokens）
```

## Step 1：统计自动加载量

读取以下文件，统计 @include 数量和对应文件行数：
- `F:\T00\CLAUDE.md`
- `F:\T00\AI00_Common\CLAUDE.md`

对每个 @include 文件，读取并统计行数。汇总「自动加载总行数」。

## Step 2：列出所有 Skills

扫描 `F:\T00\AI00_Common\.claude\commands\` 下的所有 .md 文件，列出：
- 文件名（= 命令名）
- frontmatter 里的 description

## Step 3：列出所有 Hooks

读取 `F:\T00\.claude\settings.local.json`，列出所有配置的 hooks（类型 + 触发条件）。
若无 hooks，注明「⚠️ 未配置任何 hook」。

## Step 4：输出报告

格式：
```
=== Claude 效率配置报告 ===

📦 自动加载（每次会话）
  @include 数量：X 个
  总行数：约 XXX 行
  明细：
  - [文件名]：XX 行
  - ...

⚡ Skills（按需加载，共 X 个）
  /命令名 — 描述
  ...

🪝 Hooks（自动执行，共 X 个）
  PostToolUse / Write → [描述]
  ...（若无：⚠️ 未配置）

💡 优化建议
  - [如有问题列出，如「XX 文件 XX 行可移至 skill」]
  - [若无问题：「✅ 配置正常」]
```

## 判断逻辑（优化建议）

- 自动加载 > 333 行（5k tokens）→ 提示「建议精简 @include 或拆到 skill」
- 自动加载 > 667 行（10k tokens）→ 🔴 「严重过多，影响工作效率」
- hooks 为 0 → 提示「建议添加备份检查和HTML更新 hook」
- 发现重复内容（某 @include 与某 skill 内容重叠）→ 指出
- rules/ 目录有文件 → 列出路径作用域规则
