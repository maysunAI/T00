# R00 — 文件分类与模式规则

> 状态：讨论中（2026-06-03）
> 命名规则、slash command、手册：待填充

---

## 文件四分类

| # | 类别 | 谁写 | 谁读 | 核心规则 |
|---|------|------|------|---------|
| ① | 给人看 | AI 生成 | 人读 | 有易懂/省token两种模式 |
| ② | AI 自用 | AI | AI | 准确第一，不省token |
| ③ | 人+AI 共用 | 双方各自区域 | 双方 | 人写的需求 AI 不改；含规则、需求、mapping |
| 设计书 | 特殊 | AI起草，人改细节 | AI按改的做代码 | 有易懂/省token两种模式 |

### ③ 共用文件内部结构
- **需求区**：人写，AI 只读不改
- **理解/实现区**：AI 写，人可参考
- **Mapping**：需求 ↔ 实现位置对照表

### 设计书两种模式
- 省 token 模式：单文件 + `[批注]` 标记，人在批注区写修改意见
- 易懂模式：两套文件（`Design_XX.md` 原版 + `Design_XX_edit.md` 批注版）

---

## 双模式开关逻辑

```
两套文件同时存在，MODE.md 决定 AI 用哪套
```

| 切换方向 | AI 动作 | 提醒用户 |
|---------|---------|---------|
| 易懂 → 省token | 只改 MODE.md | 「已切换，易懂文件保留但不使用」 |
| 省token → 易懂 | 改 MODE.md + 自动从省token文件生成易懂版 | 「已切换，已补全 X 个文件，请检查」 |

### MODE.md 格式
```
current_mode: token_saving  # 或 human_friendly
```

### 文件并存结构
```
rules/
├── R01_code.md        ← 省token版
└── CodeRules.md       ← 易懂版（省token模式时AI忽略）

design/
├── D01_login.md       ← 省token版（含[批注]区）
└── Design_Login.md    ← 易懂版
```

---

## 手册（MANUAL.md）特殊规则
- AI 平时做项目：不读手册
- AI 何时读/改：只有人明确说「改手册」时
- 内容：省token模式的说明、命名对照表、切换方法

---

---

## 命名规则对照表

### 按位置区分人/AI

| 位置 | 谁用 | 说明 |
|------|------|------|
| `_docs/` （下划线前缀文件夹） | 人 | AI 不自动读 |
| `rules/` `docs/` `projects/` `.claude/` | AI | 自动读取 |
| 根目录大写文件（CLAUDE.md / RESUME.md） | 双方 | 特殊，自动加载 |
| `Req1.md` `Req2.md` `Reply.md` | 双方 | 沟通专用 |

### 文件命名约定

| 类型 | 前缀/格式 | 例子 |
|------|---------|------|
| AI 规则文件 | `R##_` | `R00_file_classification.md` |
| AI 指南文件 | `AI###_` | `AI001_提示词手册.md` |
| 人看帮助文件 | `H##_` | `H01_file_line_communication.md` |
| Slash 命令 | kebab-case | `session-end.md` |
| 项目注册 | UPPER_CASE | `PROJECTS_INDEX.md` |
| 会话记录 | UPPER_CASE | `SESSION_LOG.md` |

### 双模式文件并存命名

| 模式 | 命名 |
|------|------|
| 省token版（规则） | `R01_code.md` |
| 易懂版（规则） | `CodeRules.md` |
| 省token版（设计书） | `D01_login.md` |
| 易懂版（设计书） | `Design_Login.md` |

---

## 待完成
- [ ] 切换用 slash command（/token-mode / /human-mode）
- [ ] 手册 MANUAL.md 内容
