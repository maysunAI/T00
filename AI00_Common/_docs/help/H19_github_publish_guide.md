# H19 — GitHub 发布完整指南（一步步）

> 针对 T00 / T00-zh 首次发布到 GitHub

---

## 是什么，为什么做

把你的 T00 框架（AI00）发布到 GitHub，让全球开发者能看到、使用、给 Star。
这是你的公开作品集的第一步。

---

## 前置条件

- [ ] Windows 11 电脑
- [ ] GitHub 账号（maysunAI）已注册
- [ ] 已安装：Git（`git --version` 有输出）
- [ ] 已安装：GitHub CLI（`gh --version` 有输出）

---

## 第1步：GitHub 认证（只做一次）

打开 Claude Code 终端，输入：
```
! gh auth login
```

出现提示，按以下选择：
1. `? What account do you want to log into?` → 选 **GitHub.com**
2. `? What is your preferred protocol?` → 选 **HTTPS**
3. `? How would you like to authenticate?` → 选 **Login with a web browser**
4. 复制显示的一次性代码（如 `ABCD-1234`）
5. 浏览器会自动打开 → 粘贴代码 → 点 Authorize
6. 回到终端，看到 `✓ Logged in as maysunAI`

---

## 第2步：确认发布内容（我帮你检查）

在 Claude Code 里说：
```
帮我检查发布内容
```
我会列出 `PJ02_publish/T00/` 和 `PJ02_publish/T00-zh/` 的内容，确认没有私人信息。

---

## 第3步：创建仓库并推送

**T00-zh（中文版，先发）**：
```
! cd F:\T00\PJ02_publish\T00-zh
! git init
! git add .
! git commit -m "Initial release: AI00 framework"
! gh repo create maysunAI/T00-zh --public --source=. --push --description "AI00 Framework - AI Collaboration Rules for Claude Code (中文版)"
```

**T00（英文版）**：
```
! cd F:\T00\PJ02_publish\T00
! git init
! git add .
! git commit -m "Initial release: AI00 framework"
! gh repo create maysunAI/T00 --public --source=. --push --description "AI00 Framework - AI Collaboration Rules for Claude Code"
```

---

## 第4步：验证

发布后检查：
```
! gh repo view maysunAI/T00-zh --web
```
浏览器打开仓库页面，确认内容正常。

---

## 常见问题

**问题**：`gh: command not found`
→ 安装 GitHub CLI：访问 https://cli.github.com/ 下载安装

**问题**：`remote: Repository not found`
→ 确认已经执行了 `gh auth login` 且是 maysunAI 账号

**问题**：仓库已存在
→ 改用 `git remote add origin [url]` + `git push -u origin main`

---

## 后续

发布成功后：
1. 在 README 里加 Star 按钮说明
2. 发布到 Reddit r/ClaudeAI 或 Hacker News
3. 按 `PJ15_ai00_publish/PUBLISH_PRIORITY.md` 的顺序继续发布其他项目
