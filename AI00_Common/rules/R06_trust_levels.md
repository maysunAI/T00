# R06 — 信任级别系统

> 适用：AI00框架下所有项目
> 状态：实验性（v0.1）

---

## 什么是信任级别

对文件、代码段、模块标注信任度，影响 AI 的修改策略：

| 级别 | 标注 | AI 行为 |
|------|------|---------|
| `trust: high` | 核心业务逻辑，人工审查过 | 尽量不改，改前说明原因 |
| `trust: medium` | 一般代码，正常修改 | 正常修改，告知变更点 |
| `trust: low` | 实验性/临时代码 | 可大胆修改或重写 |
| `[手动修改]` | 注释标记，绝对不改 | 完全跳过（R03）|

---

## 使用方式

### 方式1：文件头注释

```python
# trust: high
# 手动调校过的参数，不要自动修改
LEARNING_RATE = 0.001
```

```javascript
// trust: low
// 临时测试代码，随时可删
function debugHelper() { ... }
```

### 方式2：在 CLAUDE.md 里声明

```markdown
## 信任级别声明
- `src/core/` — trust: high（核心算法）
- `src/utils/` — trust: medium
- `tests/fixtures/` — trust: low
- `config/prod.yaml` — trust: high（生产配置）
```

### 方式3：对话中临时指定

```
这段代码是 trust: high，帮我只改第20行
```

---

## AI 行为规则

### trust: high 时

- 修改前：说「这段标注了 trust: high，建议只改 XX，理由是 YY」
- 不自作主张重构
- 不「顺便清理」周边代码
- 只修改明确要求的部分

### trust: low 时

- 可以大胆重写
- 可以建议替换方案
- 可以合并或删除

### 未标注时

- 默认按 `trust: medium` 处理

---

## 与 [手动修改] 的关系

`[手动修改]` 注释（来自 R03）= 绝对不改，无论信任级别如何。  
`trust: high` = 谨慎改，改前说明。

两者可以叠加：`# [手动修改] trust: high`
