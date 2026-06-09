# H20 — OpenRouter API Key 申请指南（免费）

> PJ90 / PJ20 使用 OpenRouter 免费 AI。无需信用卡。

---

## 步骤

### 1. 注册账号
打开：https://openrouter.ai/
→ 右上角「Sign In」→ 用 **Google 账号**登录（最简单）

### 2. 创建 API Key
登录后 → 左侧菜单「**Keys**」→「**Create Key**」
→ 名称随意（如 `myai`）→ 点「Create」
→ **立刻复制保存**（只显示一次！）

### 3. 写入项目配置

**PJ90（MyAI）**：打开 `F:\T00\PJ90_myai\pj90-app\.env`
```
VITE_OPENROUTER_API_KEY=sk-or-v1-xxxxxxxx
VITE_MOCK_AI=false
```

**PJ20（吃药提醒）**：不需要 API Key（EmailJS 单独配置）

### 4. 在 App 内输入 Key
首次登录后 → 设置页面 → 粘贴 Key（`sk-or-` 开头）

---

## 注意事项
- Key 以 `sk-or-` 开头
- 只在创建时显示一次，务必立刻保存
- 不要把 Key 提交到 GitHub（`.env` 已在 `.gitignore` 中）
- 免费额度足够个人日常使用

---

## 免费模型（PJ90 当前使用）

| 模型 | 说明 |
|------|------|
| `google/gemma-4-31b-it:free` | Google 出品，中文好，当前使用 |
| `moonshotai/kimi-k2.6:free` | 月之暗面，中文极好（备用）|

---

## 如果需要 Anthropic Claude API（付费）

→ 打开 https://console.anthropic.com/ 注册，最低充值 $5
→ Key 格式：`sk-ant-...`
→ 参考费用：Sonnet 4.6 约 $0.001/次对话

📎 相关文档：[H33](H33_playwright_mcp.md) — Playwright MCP 安装（需要 API 时使用）
