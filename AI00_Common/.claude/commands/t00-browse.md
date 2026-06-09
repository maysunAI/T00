---
name: t00-browse
description: 用 Playwright MCP 打开网页，查看内容、确认配置、截图。需要先安装 Playwright MCP。
---

使用 Playwright MCP 工具执行以下操作：

1. 导航到 $ARGUMENTS 指定的 URL
2. 等待页面完全加载
3. 截图保存当前页面
4. 读取页面主要内容并总结
5. 如果是配置页面（EmailJS/Google/API设置等），检查关键字段并报告是否正确

如果 $ARGUMENTS 为空，截取当前活动页面。

报告格式：
- 页面标题
- 关键内容摘要
- 发现的问题（如有）
- 截图路径（如有保存）

注意：如果 Playwright MCP 未安装，提示用户运行：
`claude mcp add playwright npx @playwright/mcp@latest --scope user`
然后重启 Claude Code。
