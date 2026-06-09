---
name: t00-hot
description: 热点话题搜索 — 查找当前热门话题，帮助发现产品创意和用户痛点。
---

# /t00-hot — 热点话题搜索

查找当前热门话题，帮助发现产品创意和用户痛点。

## 使用方式

```
/t00-hot
/t00-hot 教育
/t00-hot 健康 日本
```

## 执行步骤

1. 用 `/t00-browse` 访问以下热搜源（根据地区选择）：
   - 微博热搜：https://weibo.com/hot/search
   - 百度热搜：https://www.baidu.com/s?rtt=4&tn=news
   - 抖音热点：https://www.douyin.com/discover
   - Google Trends：https://trends.google.com/trends/trendingsearches/daily?geo=CN
   - 日本 Twitter 热搜：https://twitter.com/explore/tabs/trending

2. 如果指定了分类关键词，搜索：
   - `[关键词] 话题 2026`
   - `[关键词] 痛点 需求`

3. 整理输出格式：

```
今日热点 Top10（来源：[平台]，时间：[时间]）

排名 | 话题 | 热度 | App 机会分析
-----|------|------|------------
  1  | XXX  | 高   | 可以做：XXX 类型的 App
  2  | XXX  | 中   | 相关产品：XXX
  ...

最有潜力的方向：
- [话题1] → [产品想法]
- [话题2] → [产品想法]
```

## 注意

- Playwright MCP 需要已安装并激活（见 H33_playwright_mcp.md）
- 部分网站需要登录才能看到完整热搜
- 建议每天早晨运行一次，记录灵感到 PJ90 的备忘录
