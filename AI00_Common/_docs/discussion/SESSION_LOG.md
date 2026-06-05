# SESSION_LOG — 会话记录

> 每次说「再见」时 AI 自动追加。给人看，AI 平时不读。

---

## [2026-06-03 ～ 2026-06-04]

### 做了什么
- T00 目录整理（归档旧文件、整理 maysunAI）
- 建立 AI00_Common 框架（rules / docs / projects）
- 制定文件四分类 + 双模式规则（R00）
- 建立 Req1 / Req2 / Reply 沟通工作流
- 创建 Help 文档 H01-H05
- 将 PJ00 优质内容迁移到 AI00（AI_GUIDE / R03 / R04 / 命令）
- 加入 Auto-Install 规则、「再见」触发协议
- 移动 R00_INBOX.md / R01_requests.md 到 PJ01_maysunAI 并更新代码路径

### 未完成
- 切换模式 slash command（/token-mode / /human-mode）
- 手册 MANUAL.md 内容
- 信任级别系统（trust: high/medium/low）

---

## [2026-06-04]

### 做了什么
- PJ00 优质内容迁移完成（AI_GUIDE×9 / R03 / R04 / 3个命令）
- Auto-Install 规则加入 AI00/CLAUDE.md
- 「再见」触发协议建立（总结 + 恢复命令 + 最高权限）
- 命名规则对照表写入 R00（人/AI区分、前缀约定）
- SESSION_LOG.md 创建
- H06 框架总览 help 文件创建
- R00_INBOX.md / R01_requests.md 移入 PJ01_maysunAI，更新所有代码路径
- Req1 / Req2 / Reply 工作流正式启用并测试

### 未完成
- 切换模式 slash command（/token-mode / /human-mode）
- 手册 MANUAL.md 内容
- 信任级别系统（trust: high/medium/low）

---

## [2026-06-04] 第三次

### 做了什么
- PJ10_quicknote：Python CLI 笔记工具，完整可运行（AI00 基准测试-简单）
- PJ11_classnote_jp：日语课堂 App，Phase 1 录音 UI（React Native/Expo）
- PROJECTS_INDEX.md 更新（PJ10 / PJ11 注册）
- H07 工具生态比较文件创建（10个 Claude Code 工具对比）
- AI00 定位 / GitHub建议 / 评估指标 / 工具分析 写入 Reply.md

### 未完成
- PJ11 Phase 2-6（STT接入 / 词汇面板 / 多人识别 / 发音评分 / 图片搜索）
- PJ12 中等难度测试项目
- AI00 GitHub 上传准备（README / 英文化）
- 切换模式 slash command
- 信任级别系统

---

## [2026-06-04] 第四次（06:39，最高权限执行，用户上班中）

### 做了什么
- Req2.md Q1-Q2（多Agent）→ Reply.md 写入
- Req2.md Q1-Q7（18行后）→ Reply.md 写入（含maysunAI分析报告）
- CLAUDE.md 规则更新：
  - 时间格式加到分钟
  - 5W1H回答规则
  - 快速建议/讨论模式规则（从Reply 547-557提取）
  - 相关文档引用规则（📎格式）
  - 未保存文件检查规则
  - CLI执行摘要规则
- tasks/ 文件夹建立（Q10确认执行）：
  - TASK_INDEX.md（32项任务全量整理）
  - T015_PJ11.md / T017_R05.md / T009_github.md / T027_orchestrator.md
- R05_agent_roles.md 创建（多Agent规则 + 9角色定义 + Orchestrator模式）
- H08_quick_reference.md 创建（人类一页快速参考手册）
- AI00内容整理：H08创建，CLAUDE.md引用更新
- maysunAI分析：REQ生命周期/Memory分层/源代码组件可利用性评估

### 未完成
- PJ11 Phase 2-6
- PJ12 中等难度项目
- T009 GitHub README
- T026 claude-forge commands比对
- T030 /token-mode /human-mode slash命令
- T031 信任级别系统

---

## [2026-06-06]

### 做了什么
- **GitHub发布规划确定**：两个 repo（T00 英文版 + T00-zh 中文版），github-pub/ai00/重命名为T00/，新建T00-zh/，R07规则同步更新
- **Reply备份限制**：1000行 → 2000行（CLAUDE.md更新）
- **H15 社媒全平台入门指南**：X/Reddit/知乎/小红书/LinkedIn/TikTok/Facebook/Instagram，含Xbox Game Bar录制教程
- **演示脚本**：英文版+中文版（PJ15/demo/），「演戏」staged demo方案，用Win+G录制
- **Logo 方案B**：T00·AI00 / maysun Projects，含Canva制作步骤
- **CK00历史项目全面分析**：扫描30+项目，生成CK00_INDEX.md（8章），包含进化时间线/项目全表/重复文件/市场分析/宣传素材
- **个人成长故事**：MY_AI_STORY.md（中文7章）+ story_en.md（英文），用于GitHub/社媒
- **CK00结构整理**：删Talk03空文件夹，建CK00/README.md，补PJ11/PJ12的README
- **日本認知症项目立项**：T043/PJ20，老龄化市场分析，7个创意扩展
- **TASK_INDEX**：新增T035-T043，T037/T040标记done

### 未完成（需用户操作）
- T034：PJ14 Gmail OAuth授权（运行 `python main.py`）
- T036：T00/T00-zh GitHub发布（需 `gh auth login`）
- T035：Demo录制（Win+G + demo_script_zh.md）
- T039：Logo制作（Canva，logo_B.md有步骤）
- T043：PJ20 認知症App 规划（下次会话继续）

---

## [2026-06-06] 第二次（用户休息前）

### 做了什么
- **CLI→Reply 新规则**：用户说「读resume」时，摘要同时写入 reply.md（从本次起生效）
- **PJ16_knowcard 建立**：知识卡片·AI记忆系统，三大功能（保存/整理/记忆），CLAUDE.md 含5个讨论话题（D01-D05）
- **PROJECTS_INDEX 更新**：注册 PJ16_knowcard + PJ20_dementia_app
- **回答 req 409-460**：序号规范、记忆方法对比（FSRS>艾宾浩斯）、AI主动建议痛点记为D05、T00发布步骤说明
- **Reply 写入**：reply 第1312行

### 未完成
- T034：PJ14 Gmail OAuth授权
- T036：gh auth login → T00/T00-zh 发布
- T035：Demo录制
- T043：PJ20 認知症App 规划
- PJ16：D01-D05 讨论话题（待空闲时逐个讨论）
