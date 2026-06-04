# R05 — 多Agent规则与角色定义

> 适用：AI00框架下所有项目

---

## 任务规模判断（何时触发子Agent）

| 规模 | 判断条件 | 处理方式 |
|------|---------|---------|
| 小任务 | 1-2个文件修改，需求明确 | 主Claude直接执行 |
| 中任务 | 3-5个文件，跨模块 | 主Claude + 1个子Agent |
| 大任务 | 5个以上文件，或需要搜索+实现 | Orchestrator模式（见下） |

---

## Orchestrator模式

```
主Claude（Orchestrator）
  │
  ├── 接收任务 → 判断规模
  ├── 大任务：拆分子任务 → 分发给子Agent（可并行）
  ├── 收集子Agent结果 → 整合
  └── 汇报给用户
```

**主Claude职责**：协调、整合、最终输出
**子Agent职责**：专注单一子任务，不跨界

---

## 内置子Agent类型

| Agent类型 | 用途 | 触发条件 |
|---------|------|---------|
| `Explore` | 搜索代码、定位文件 | 「帮我找」「哪里有」「搜一下」|
| `Plan` | 架构设计、任务拆分 | 「帮我规划」「怎么设计」|
| `code-review` | 代码审查、找bug | 「审查一下」「有没有问题」|
| `general-purpose` | 通用任务 | 复杂研究、多步骤分析 |

---

## 角色分工（9角色）

| 角色 | 谁来做 | 触发时机 |
|------|--------|---------|
| 产品经理 | **用户** | 写Req定方向 |
| PM/需求分析 | Plan子Agent | Req写完后拆任务 |
| 架构师 | Plan子Agent | 新项目或重大变更 |
| 程序设计文档 | 主Claude | 架构确认后 |
| 开发 | 主Claude + general子Agent（并行）| 设计确认后 |
| 测试 | code-review子Agent | 功能完成时 |
| Delivery评审 | 主Claude | 交付前 |
| 用户模拟 | **用户** / Explore子Agent | 测试阶段 |
| 协调者（Orchestrator）| **主Claude** | 全程 |

---

## 触发词规则

| 用户说 | AI做 |
|--------|------|
| 「并行做X和Y」 | 同时启动两个子Agent分别处理X和Y |
| 「帮我搜一下」 | 派Explore子Agent，主Claude等结果 |
| 「帮我规划」 | 派Plan子Agent，主Claude整合 |
| 「审查这段代码」 | 派code-review子Agent |
| 默认 | 主Claude直接做（无子Agent）|

---

## 费用控制

- 子Agent每次调用消耗额外token
- 小任务不派子Agent（直接做更快更省）
- WebSearch类子Agent最贵，仅明确需要时使用
- 并行子Agent比串行省时间，但token消耗叠加

---

## 与外部AI协作（可选）

| 外部AI | 适合角色 | 如何协作 |
|--------|---------|---------|
| GPT-4o | PM/需求整理 | 用户手动复制Req给ChatGPT分析，再把结果发给Claude |
| Gemini | 资料研究 | 用户手动查询，结果贴入Req |
| 另一个Claude | 并行开发 | 开两个Claude Code会话 |

> 跨AI自动通信需要API桥接，复杂且贵，AI00 v0不实现。

