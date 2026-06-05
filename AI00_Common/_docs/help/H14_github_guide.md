# H14 — GitHub 速成手册

> 给人看。完全不懂 GitHub 的用户从这里开始。

---

## GitHub 是什么（一句话）

程序员的「作品集 + 代码云盘 + 社交网络」。
你把代码放上去，别人能看到、学习、使用，也能关注你。

---

## 第一步：从哪里开始看一个项目

打开任何 GitHub 链接（如 https://github.com/sangrokjung/claude-forge）：

```
仓库页面布局：

[项目名]                    ← 名字
[描述一句话]                 ← 是什么
[⭐ 713  Fork 89]           ← 星标数（人气）和被复制次数
──────────────────────────
README.md 的内容            ← 最重要！从这里开始读
──────────────────────────
文件列表（右侧或下方）        ← 代码结构
```

**✅ 看的顺序：**
1. README.md（项目说明，怎么用）
2. Stars 数（人气参考）
3. 最近更新时间（项目是否活跃）
4. Issues（有什么已知问题）

---

## 星标在哪里

页面右上角，仓库名旁边：
```
⭐ Star  [713]   👁 Watch   🍴 Fork
```
点 ⭐ Star 就是给这个项目加星标，相当于「收藏」。

**你的星标列表：** 登录后 → 右上角头像 → Your stars

---

## 怎么关注别人（Follow）

打开某人的主页（如 https://github.com/sangrokjung）：
页面有个 **Follow** 按钮，点一下就关注了。

- 关注后：他们的动态会出现在你的首页 Feed
- 对方会收到通知「xxx followed you」
- 对方能看到你的公开主页，但不会自动关注你回来

---

## 怎么看一个项目更新了什么

**方法1：Watch（订阅通知）**
仓库页面 → 👁 Watch → 选「Watching」→ 有更新时收邮件

**方法2：看 Commits（历史）**
仓库页面 → 点「X commits」→ 每行是一次更新，有时间和说明

**方法3：Releases（正式版本发布）**
仓库右侧 → Releases → 看版本号和更新说明（比 commits 更友好）

---

## 能邀请朋友吗

**关注/被关注：** 直接 Follow 对方用户名，不需要邀请

**合作一个项目：** 仓库 Settings → Collaborators → 输入对方用户名 → 发邀请

**组织（Organization）：** 可以建一个组织，把朋友都加进来，一起维护项目

---

## 值得关注的中国 AI 开发者（GitHub）

| 用户名 | 方向 | 备注 |
|--------|------|------|
| [binary-husky](https://github.com/binary-husky) | gpt_academic 作者 | ⭐65k+，AI学术工具 |
| [acheong08](https://github.com/acheong08) | ChatGPT 逆向工程 | 早期 AI 工具先驱 |
| [tw93](https://github.com/tw93) | Pake、Weekly | 中文 AI 工具周刊 |
| [yihong0618](https://github.com/yihong0618) | 各种小工具 | 活跃、有趣 |
| [GaiZhenbiao](https://github.com/GaiZhenbiao) | ChuanhuChatGPT | ⭐15k+ |

---

## 怎么搜索好项目

GitHub 搜索框 → 输入关键词 → 左侧选「Most stars」排序

**常用搜索词：**
- `claude code workflow` — Claude 工作流
- `awesome claude` — Claude 资源合集
- `AI productivity` — AI 效率工具

**Topic 标签搜索：**
https://github.com/topics/claude-code

---

## 你的 GitHub 主页显示什么

别人打开你的页面会看到：
- 你的仓库列表（公开的）
- 你的 contribution 图（绿色方块，显示你每天有没有提交代码）
- 你关注的人 / 关注你的人

你可以在个人资料里加头像、简介、联系方式。

---

## claude-forge 在哪里 / 怎么用

**找到它：**
- 直接访问：https://github.com/sangrokjung/claude-forge
- GitHub 搜索：`claude-forge`

**是什么：**
给 Claude Code 加 36 个命令 + 11 个 Agent，灵感来自 oh-my-zsh（zsh 的插件系统）。

**怎么安装：**
```bash
curl -fsSL https://raw.githubusercontent.com/sangrokjung/claude-forge/main/install.sh | bash
```

**看什么：**
1. README 里的命令列表（36个命令是什么）
2. 和 AI00 比：claude-forge = 执行命令多，AI00 = 记忆+流程
3. 可以两者叠加用

---

📎 相关文档：H13_github_publish.md — 发布自己的项目到 GitHub
