# H33 — Playwright MCP：让 AI 直接看网页

> 给人看。不需要截图，AI 直接打开网页确认内容。

---

## 这是什么

Playwright MCP 是微软官方出的工具，让 Claude 能直接：
- 打开任意网页
- 截图保存
- 读取页面内容
- 填写表单、点击按钮

装好后对 Claude 说「用 Playwright MCP 打开 xxx 网址」，它就直接去看，不需要你截图。

---

## 安装（一次性，全局生效）

### 前提条件
- Node.js 20 以上（终端运行 `node --version` 确认）
- Claude Code 已安装

### 安装命令（在终端运行）

```powershell
claude mcp add playwright npx @playwright/mcp@latest --scope user
```

运行后会显示：
```
Added stdio MCP server playwright ... to user config
```

### 重启 Claude Code
安装后**必须重启** Claude Code 才生效。

---

## 使用方法

### 方法1：直接说
```
用 Playwright MCP 打开 https://dashboard.emailjs.com/admin/templates/xxx
帮我确认模板变量是否正确
```

### 方法2：用 /browse 命令
```
/browse https://dashboard.emailjs.com/admin/templates/xxx
```

### 第一次使用的提示
提问时明确说「**Playwright MCP**」这4个字，Claude 才会用 MCP 而不是普通方式。

---

## 实际使用场景

| 场景 | 以前 | 现在 |
|------|------|------|
| 确认 EmailJS 模板 | 截图→发给AI→等分析 | `/browse 网址` 一步完成 |
| 检查 API 配置页面 | 手动截图 | AI 直接看 |
| 日文界面找按钮 | 截图说明 | AI 直接导航 |
| 网页内容已更新 | AI 知识可能过时 | 实时读取最新内容 |

---

## 注意事项

- **需要登录的页面**：AI 无法自动登录，你先登录后让 AI 操作已登录的浏览器
- **费用**：Playwright MCP 本身免费，不消耗额外 token
- **浏览器**：会打开一个 Chromium 浏览器窗口（正常现象）

---

## 相关规则

📎 相关文档：`AI00_Common/rules/R11_capability_expansion.md` — 能力自动扩展规则（何时安装新工具）
