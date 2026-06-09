---
name: t00-playwright-test
description: Playwright UI 测试 — 在真实浏览器中测试本地运行的 Web App，验证登录流程、功能路径、边缘案例。PJ90 等前端项目适用。
---

使用 Playwright MCP 在真实浏览器中测试本地 Web App。

## 使用方式

```
/t00-playwright-test                   → 测试当前项目默认 URL
/t00-playwright-test http://localhost:5175  → 指定 URL
/t00-playwright-test login             → 只测试登录流程
/t00-playwright-test $ARGUMENTS        → 测试指定功能
```

## 执行步骤

### 1. 确认 App 已启动

检查 $ARGUMENTS 指定的 URL（默认 `http://localhost:5175`）是否可访问。
若不可访问，提示用户先运行 `npm run dev`。

### 2. 核心流程测试（Golden Path）

按以下顺序测试：
1. **页面加载** — 导航到 URL，等待 DOMContentLoaded
2. **截图** — 保存当前页面截图，记录初始状态
3. **基础功能** — 根据 $ARGUMENTS 决定测试范围：
   - `login` → 测试登录/注册流程
   - `chat` → 测试 AI 对话发送接收
   - `memo` → 测试备忘录创建/编辑/删除
   - 无参数 → 顺序测试以上所有
4. **边缘案例** — 空输入、超长输入、网络断开后行为

### 3. 报告格式

```
测试报告（时间：YYYY-MM-DD HH:MM）
URL：[测试地址]

✅ 通过 | ⚠️ 警告 | ❌ 失败

[功能名]
  状态：✅ / ❌
  截图：[路径]
  问题：[如有]

总结：X 项通过，Y 项失败
失败原因：[列表]
建议修复：[列表]
```

## PJ90 专用测试流程

```
1. http://localhost:5175 → 检查是否显示 ApiKeyPage 或 ChatPage
2. 设置 API Key → 验证进入 ChatPage
3. 发送一条消息 → 验证 AI 回复
4. 切换到 Memo Tab → 验证标签切换
5. 添加一条备忘 → 验证保存和显示
```

## 注意

- Playwright MCP 需已安装：`claude mcp add playwright npx @playwright/mcp@latest --scope user`
- 截图保存到当前目录的 `test-screenshots/` 下
- 测试失败时**不**自动修复，只报告问题，等用户决策
