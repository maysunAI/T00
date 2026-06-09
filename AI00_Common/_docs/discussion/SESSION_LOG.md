# SESSION_LOG — 会话记录

> 每次说「再见」时 AI 自动追加。给人看，AI 平时不读。

---

## [2026-06-09]（第十三、十四、十五次合并）

### 做了什么
- **PJ90 个性化记忆**：AI 自动提取 MEMORY: → profile.json → system prompt注入；设置页管理
- **PJ90 闹钟**：🔔 标签页，时间驱动 Web Notification，AI 自然语言设置
- **PJ90 AI 模型选择**：Llama/DeepSeek 免费强模型 + Claude/GPT 付费模型
- **PJ90 插件架构（接口化）**：App.jsx 重构，PLUGIN_REGISTRY 动态 Tab，增删功能只改一行
- **PJ90 数据中心（📊）**：新标签页，显示记忆/备忘/待办/历史统计，支持记忆管理
- **PJ26 MD Studio 作为 PJ90 插件**：iframe 沙箱加载，设置页开关控制
- **Cloudflare Worker 代码**：`cloudflare-worker/worker.js` + `SETUP.md`（5分钟部署指南）
- **FUTURE_FEATURES.md 大量更新**：事件闹钟/数据透明化/技能商店/MD架构/存储选项
- **PJ90/CLAUDE.md 核心7项锁定**：不可删除清单
- **req/reply 规则改进**：修缮出现两次，📦 建议保存用户说保存即执行
- **H23_session_end.md**：T00 会话结束 Help 文档（5W1H）
- **所有临时文件归档清空**：`Z01_archive/20260609_comms.md`
- PJ26_md_studio MVP 完成
- Context 81% → 主动说再见，开新会话

### 未完成 / 下次优先
- PJ90 事件驱动闹钟（核心，估 3h）
- PJ20 邮件测试（用户需要操作）
- Help 文档 5W1H 格式化（37 个文件，用户确认后执行）
- Cloudflare Worker 实际部署（用户操作，按 SETUP.md）

---

## [2026-06-08]（第十一、十二次合并）

### 做了什么
- PJ90 固定件全部完成：底部导航（聊天/备忘/待办/设置）+ PWA manifest + Service Worker（reply 第591行）
- PJ90 备忘录加 Markdown 预览功能，安装 marked 库（reply 第998行）
- 新建 H35_help_github_pages、H36_appstore_review、AI009_skill_ecosystem 三个文档
- 新建 `/hot-topics` 和 `/pj-status` 两个 Skills
- PJ03_mdhtml（想法阶段）、PJ26_md_studio（三合一：阅读+编辑+HTML生成）立项
- 大量 reply 内容存档到各项目 FUTURE_FEATURES.md（PJ20 大脑健康、PJ90 策略）
- T00_HELP.html 更新为 37 篇
- 新建 tasks/T001_pj90_remaining.md 记录 PJ90 剩余工作
- 格式改进：reply 修缮改为总-分结构，CLI 输出增加 reply 行号
- **PJ26_md_studio MVP 完成**：App.jsx 三合一组件（阅读+编辑+导出），dev server 5174 正常

### 未完成 / 下次优先
- PJ90 闹钟功能 → 已在下次完成
- PJ20 邮件测试（用户需要操作）

---

## [2026-06-07]（第十次）

### 做了什么
- CLAUDE.md 新增两条草稿规则：「草稿更新」/ 「草稿X以后更新」（读→追加req→回答→清空草稿）
- 建 `/market-research` slash 命令（支持 active/all/future/paused/pjXX 参数）
- 启动 PJzz_future（6项目）+ PJzz_paused（2项目）竞品研究 agents
- T00 API Key balance 建议：现在自填是正确选择；未来 Google OAuth 简化后只需改一行 scope
- ⚠️ PJzz_arch_old（历史存档）未做，等用户回来确认

### 未完成 / 下次优先
- PJzz_future/paused agent 结果（自动完成中）
- P001：PJ90 Gemini 测试（填 .env VITE_GEMINI_API_KEY）
- PJzz_arch_old 是否要分析（等确认）

---

## [2026-06-07]（第九次，自主工作）

### 做了什么
- PJ90 架构重构：Gemini 从 OAuth 改为用户自填 API Key（每人用自己的免费额度）
  - `auth.js`：移除 cloud-platform scope，只保留 drive.appdata + 身份验证
  - `gemini.js`：改用 localStorage 读取用户 API Key
  - `ApiKeyPage.jsx`：新建，首次使用引导页 + 验证
  - `App.jsx`：登录→检查 Key→设置页或聊天页
  - `PJ90_myai/_docs/help_gemini_key.md`：用户帮助文档
  - `PJ90_myai/_docs/TEST_TEMPLATE.md`：7项测试模板
  - `PJ90_myai/D01_design.md`：更新登录流程和 OAuth 范围定稿
- T00 规则更新：「改善」→「修缮」，清空保留末尾，R10 Mapping 三段格式
- `.claude/commands/t00-capture.md`：新建 slash 命令
- 设计书新建：`PJ20_dementia_app/D01_design.md` / `PJ17_ai_desk/D01_design.md`
- 并行启动 3 个研究 Agent：PJ20+PJ11 / PJ14+PJ16 / PJ17+PJ12 竞品研究（进行中）
- CLAUDE.md / R10 规则更新（3条新规则）

### 未完成 / 下次优先
- P001 PJ90 Gemini 测试：填入 `VITE_GEMINI_API_KEY`（`.env`），测试 localhost:5173
- 安装 Playwright MCP
- Agent 研究结果整合（自动完成中）
- 为 PJ14/PJ16/PJ11/PJ12 写 D01 设计书（等 agent 结果）

---

## [2026-06-07]（第八次）

### 做了什么
- PJ90 OAuth 错误修复：invalid_scope（pj90-002）→ 改用 cloud-platform scope；Gemini 403（pj90-003）→ 分析连锁原因，auth.js 更新
- dev server 重启，localhost:5173 正常运行
- 大量 T00 框架改进（reply 第1257-1955行可查详情）：
  - CLAUDE.md 更新：reply 格式（复制原文 + 改善文）、清空前确认规则、原文→改善文→回答三步流程
  - 新建 help 文档：H23（自动保存+交流）/ H24（文件夹归属）/ H25（Prompt速查）/ H26（temp文件说明）/ H27（Markdown）/ H28（Slash命令）/ H29（Hooks）
  - 新建 temp04_pending.md（待确认事项 P编号系统）
  - PJ15 宣传素材：PROMO_CONTENT.md（7条素材）
  - PJ90 更新：IDEAS.md（老人提醒按钮 / 两台手机方案）/ REQUIREMENTS.md（按钮发送模式）
- 确认：T00 = Claude Code 专用框架；Memory 系统由 Claude 自动写入 + T00 结构化管理

### 未完成 / 下次优先
- P001 PJ90 Gemini 实际通信测试（cloud-platform scope 已加，待测试）
- 安装 Playwright MCP（浏览器自动测试）
- 建 t00-status / t00-save / t00-clear-check 等自定义 slash 命令
- PJ14 Gmail OAuth / T036 GitHub 发布 / PJ20 認知症 App

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

---

## [2026-06-06] 第四次

### 做了什么
- **R10 市场调研规则**：AI00_Common/rules/R10_market_research.md（每项目立项前10个竞品分析）
- **5个新项目**：PJ22_health / PJ23_dream / PJ24_divination / PJ25_omikuji / PJ26_myai
- **CK00完全扁平化**：15个ARCH_文件夹，T01-T08/T99全删，有代码项目写摘要
- **PROJECTS_INDEX 全量更新**：含PJ22-PJ26 + [CK00]ARCH历史15个

### 未完成
- T034：PJ14 Gmail OAuth授权
- T036：gh auth login → GitHub发布
- T035：Demo录制
- T043：PJ20 認知症App规划
- PJ26：MyAI助手 MVP规划（用户最感兴趣）
- item 7（用户写到一半未完成）

---

## [2026-06-06] 第三次（用户出门前）

### 做了什么
- **PJ17_ai_desk 建立**：VSCode风格AI工作台，布局设计 + 参考图片 + 7类自动收集类型
- **CK00 完整重整**：T01-T08/T99（9个文件夹）移到T00根目录，非项目内容进_archive，CK00现在完全空可删除
- **pic 整理**：T00_resource/pic/p01_ai_desk001.png → PJ17_ai_desk/assets/
- **PJ18/19/21 建立**：起名字软件、算命软件、AI陪伴+每日计划
- **PROJECTS_INDEX 更新**：注册PJ17-PJ21 + [CK00]历史项目11个（带标记）
- **发布排名给出**：3个维度（Star潜力/技术含量/成熟度），推荐发布顺序

### 未完成
- CK00文件夹本身（现在空了，用户需手动 rmdir 删除）
- T034：PJ14 Gmail OAuth授权
- T036：gh auth login → T00/T00-zh GitHub发布
- T035：Demo录制
- T043：PJ20 認知症App规划
- PJ16：D01-D05讨论话题

---

## [2026-06-06] 第六次（PJ14修复 + PJ90需求确认）

### 做了什么
- **PJ14 邮箱改为 j6016086@gmail.com**：config.py + TRUSTED_SENDERS
- **PJ14 乱码修复**：gmail_client.py 编码 Bug → `.encode('utf-8')` 修复
- **PJ14 SETUP.md**：追加「アクセスをブロック」报错的排查方法
- **Google Cloud 新项目**：帮用户创建新 Google Cloud 项目用于 Gmail API
- **PJ90 架构确认**（全天讨论）：
  - 纯前端 PWA + Google OAuth + 用户自己 Gemini 账号 + Google Drive 存储
  - 开发者零费用，用户完全免费，数据主权在用户手里
  - Function Calling 机制（Gemini=大脑，PJ90=手）
  - Firebase FCM 推送通知 / 闹钟（100用户×10条/天完全在免费额度内）
  - 文件夹分类：tasks / help / archive / resume / history
  - 插件系统设计（MCP协议，VSCode模式，第三方开发者扩展）
- **PJ90 文档**：
  - REQUIREMENTS.md（完整需求文档，含 Reply 面板新功能）
  - MARKET_RESEARCH.md（20个竞品比较，含 PJ90 定位空白分析）
  - USE_CASES.md（营销使用场景 × 10个，含宣传语候选）
- **H21 修复**：日文 → 中文（Gemini Web搜索功能说明）
- **CLAUDE.md 规则强化**：
  - 禁止日文回复规则
  - 实质性回答必须写进 reply.md 规则
  - 项目内容存放规则（不散落在T00根目录）

- **PJ90 社交三功能**（会话末尾追加）：
  - 场景11：考前笔记共享（共享链接 → 好友一键导入）
  - 场景12：订阅作者文章推送（和价格监控同一机制）
  - 加好友功能（Google账号/邀请链接，中期开发）

### 未完成
- PJ90 MVP 开发（需求已确认，待开始）
- PJ14 Gmail OAuth 新项目授权（T034）
- T036：GitHub 发布
- PJ20 認知症App 规划
- PJ90 Reply 面板（新功能，已写入需求）
- PJ90 社交功能（加好友 + 笔记共享，中期）

---

## [2026-06-07] 第七次（PJ90 MVP 開発）

### 做了什么
- **D01 設計書完成**：`PJ90_myai/D01_design.md`（技術スタック/ディレクトリ/データ構造/開発順序）
- **MVP 第一弾コード完成**（ビルド成功）：
  - React 18 + Vite + PWA（vite-plugin-pwa / Tailwind）
  - `src/pages/LoginPage.jsx` — Google ログイン画面
  - `src/pages/ChatPage.jsx` — チャット画面（RESUME カード付き）
  - `src/components/ChatBubble.jsx` — メッセージ気泡
  - `src/components/ChatInput.jsx` — 入力欄（Enter=改行、ボタン=送信）
  - `src/components/ReplyPanel.jsx` — Reply 面板（行番号付き、クリックで引用）
  - `src/services/auth.js` — Google OAuth 2.0
  - `src/services/gemini.js` — Gemini API + Function Calling
  - `src/services/drive.js` — Google Drive 読み書き
- **Google Cloud Console 設定**：
  - プロジェクト PJ90-MyAI 作成
  - OAuth クライアント ID 取得：`770662301516-2v0qkbmurmf1devo7nlefvj4nfi9ltcn`
  - テストユーザー追加：j6016086@gmail.com
- **動作確認**：ログイン成功 → UI 表示 ✅ → Gemini 403 エラー発生
- **Gemini 403 修正**（次回確認）：
  - スコープ追加：`generative-language`
  - 認証ヘッダー修正：`Authorization: Bearer {token}`

### 未完成・次回やること
- Google Cloud Console で Generative Language API を有効化（必須）
  - URL: `https://console.cloud.google.com/apis/library/generativelanguage.googleapis.com?project=pj90-myai-498614`
- 「退出」→ 再ログインして Gemini 動作確認
- Google Drive 保存確認
- Firebase FCM 推送通知設定

---

## [2026-06-07〜08]（第十一次）

### 做了什么
- PJ90：切换 AI API Gemini → Groq → OpenRouter（免费），`google/gemma-4-31b-it:free` 通过测试
- PJ90：T01-T07 全部测试通过（真实 AI + 对话历史 + 退出登录）
- PJ20：建立项目，React+Vite PWA，吃药提醒 + EmailJS 家属通知（reply 第283行可查详情）
- PJ20：配置 EmailJS（service_op7zp6p / template_nlnen5n），模板变量对齐
- PJ20：PWA 图标生成，manifest 配置完成
- 安装 Playwright MCP（全局）：`claude mcp add playwright npx @playwright/mcp@latest --scope user`
- 新增 R11 能力扩展规则、`/browse` skill、H33 Playwright指南、H34 gen_help_html 详解
- T00_HELP.html 更新（36篇，128.5KB）

### 未完成
- PJ20 EmailJS 邮件发送未实际测试（重启 Claude Code 后测试）
- PJ20 未来功能已记录：LINE/WeChat/SMS/电话/119 通知（FUTURE_FEATURES.md）
- PJ90 完善：Settings页、Memo、Todo UI、PWA配置 还未做
- GitHub 发布：PJ90 + PJ20 两个产品完成后再做
