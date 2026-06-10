# H35 — Help 文档发布到 GitHub Pages

> 目标：把 T00_HELP.html 发布到公开网址，手机/电脑都能访问
> 关联：H34_gen_help_html.md（先生成 HTML 再发布）

---

## 发布前检查：哪些文件适合公开

**可以发布：**
- H00（索引）、H06（框架介绍）、H10（PWA安装）、H13（GitHub工作流）
- H20（API Key 设置）、H33（Playwright MCP）、H34（gen_help_html 说明）
- 所有通用教程类文件

**不发布（从 HTML 里删除或改写）：**
- 含个人账号、邮箱、真实 API Key 的内容
- 个人工作流细节（如 temp 文件使用方式）

---

## 步骤一：生成最新 HTML

> 注：以下命令均以 T00 根目录为起始路径（例如 `F:\T00`）。

```powershell
cd AI00_Common\_docs
.\gen_help_html.ps1
```

生成文件：`T00_HELP.html`

---

## 步骤二：创建 GitHub 仓库

```bash
# 方式A：用 gh CLI（推荐）
gh repo create maysunAI/t00-help --public --description "T00 Framework Help Documentation"

# 方式B：在 GitHub 网页手动创建
# https://github.com/new → 仓库名 t00-help → Public → Create
```

---

## 步骤三：上传 HTML 文件

```bash
# 创建本地文件夹（从 T00 根目录运行）
mkdir PJ02_publish\t00-help
cd PJ02_publish\t00-help

# 初始化 git
git init
git remote add origin https://github.com/maysunAI/t00-help.git

# 复制 HTML 文件（改名为 index.html）
copy ..\..\AI00_Common\_docs\T00_HELP.html index.html

# 提交推送
git add index.html
git commit -m "publish T00 help docs"
git push -u origin main
```

---

## 步骤四：开启 GitHub Pages

1. 打开仓库：`https://github.com/maysunAI/t00-help`
2. 点击 **Settings** → 左侧 **Pages**
3. Source 选 **Deploy from a branch**
4. Branch 选 **main** / (root)
5. 点击 **Save**

等待 1-2 分钟后访问：
```
https://maysunai.github.io/t00-help/
```

---

## 步骤五：更新流程（每次更新后）

```bash
cd PJ02_publish\t00-help
copy /Y ..\..\AI00_Common\_docs\T00_HELP.html index.html
git add index.html
git commit -m "update help docs $(date +%Y%m%d)"
git push
```

更新后 1-2 分钟内，网页自动刷新。

---

## 访问地址

| 地址 | 说明 |
|------|------|
| `https://maysunai.github.io/t00-help/` | 正式地址 |
| `https://maysunai.github.io/t00-help/?s=关键词` | 搜索直达（未来功能）|

---

## 自定义域名（可选）

如果你有自己的域名（如 maysun.ai）：
1. 在仓库根目录创建 `CNAME` 文件，内容：`help.maysun.ai`
2. 在域名 DNS 添加 CNAME 记录：`help` → `maysunai.github.io`
3. GitHub Pages 设置里填入自定义域名

📎 相关文档：H34_gen_help_html.md — 如何生成 T00_HELP.html
