---
name: t00-help
description: 列出所有 T00 slash 命令及其用途，快速查阅
---

用户说「/t00-help」或「/t00-help $ARGUMENTS」时：

## 无参数：列出所有命令

扫描 `F:\T00\AI00_Common\.claude\commands\` 下所有 .md 文件，读取每个文件的 frontmatter（name + description），输出对照表：

```
=== T00 命令列表 ===

📋 会话管理
  /session-end     会话结束存档（SESSION_LOG + RESUME）
  /t00-backup      备份 req/reply 到 Z01_archive
  /t00-status      当前工作区状态总览

🚀 项目管理
  /new-project     新建项目（自动编号 + 注册）
  /pj-status       查看指定项目状态
  /publish         发布项目到 github-pub

🔍 分析与评估
  /estimate        需求预估 + 完成度报告
  /t00-perf-check  效率配置检查（@include/skills/hooks）
  /code-review     代码审查

🌐 研究工具
  /browse          浏览网页
  /market-research 市场调研
  /hot-topics      热点话题

⚙️ 开发模式
  /ai-developer    AI 应用开发模式
  /git-helper      Git 操作助手
  /mode-token      切换省 token 模式
  /mode-human      切换易懂模式

❓ 帮助
  /t00-help        显示此列表
```

## 有参数（如 /t00-help backup）：

显示对应命令的详细用法说明。读取对应 .md 文件内容并格式化输出。
