# FUTURE_FEATURES.md — 未来功能记录

> AI00 框架待实现的想法。说「开始做○○」时才实现。

---

## UI001 — AI00 图形界面（参考 maysunAI）

来源：req 第138-147行（2026-06-04）

### 功能描述

**设置页框**
- Claude 原生部分（settings.json 可视化编辑）
- AI00 部分（省token模式切换等）

**产品页框**
- a. 项目启动内容展示在产品框，点击 → 对话框显示 `@xxx ...`，后面可输入内容
- b. 按按钮 → 内容写入 temp01_req.md + 自动在 terminal 生成提示词（如「req XX行后，更新了」）
- c. 参考 Visual Studio 的 design/code 切换或嵌入式 code 显示

**AI00 内容页框**
- 左侧导航，右侧内容，显示 help 文档

### 参考
- maysunAI：ClaudeBrain.tsx / ReqPanel.tsx / ExecLog.tsx
- Visual Studio Code：侧边栏 + 编辑器布局

---

## CMD001 — 模式切换 Slash 命令

来源：SESSION_LOG 多次记录

- `/token-mode` → 切换到省 token 模式
- `/human-mode` → 切换到易懂模式
- 修改 MODE.md，AI 读取后切换行为

---

## TRUST001 — 信任级别系统

来源：SESSION_LOG 多次记录

```
trust: high    → 删除前只记录日志，不每次确认
trust: medium  → 删除前简短确认（默认）
trust: low     → 删除前详细确认
```

---

## BENCH001 — AI00 基准测试套件

来源：req 第25行

用相同项目在 AI00 / 裸 Claude Code / claude-forge / Cursor 各做一遍，比较：
token 消耗 / 交互次数 / 完成时间 / 完成率
