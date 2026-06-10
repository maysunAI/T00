# H13 — GitHub 发布与 LICENSE 说明

> 给人看。第一次把 AI00 发布到 GitHub 时参考。

---

## LICENSE 是什么

放在仓库根目录的一个文本文件，叫 `LICENSE`（无扩展名）。
告诉别人「你可以怎么用这个项目」。**没有 LICENSE 的项目法律上不能随便用。**

### MIT License（推荐）

| 别人能做什么 | 说明 |
|------------|------|
| ✅ 免费使用 | 个人/商业项目都可以 |
| ✅ 复制、修改 | 可以基于你的代码改 |
| ✅ 分发 | 可以再发布 |
| ⚠️ 必须保留版权声明 | 保留你名字就行 |
| ✅ 作者免责 | 出了问题不找你 |

### 怎么加（两种方法）

**方法A：GitHub 网页（最简单）**
1. 创建仓库时，勾选 「Add a license」→ 选 MIT → 填你的名字
2. GitHub 自动生成 `LICENSE` 文件

**方法B：我来建**
告诉我你的名字，我在本地 T00 根目录建 `LICENSE` 文件。

---

## 发布到 GitHub 的步骤

### 前提
- 安装了 [GitHub CLI](https://cli.github.com/)：`winget install GitHub.cli`
- 登录：`gh auth login`

### 发布命令

```powershell
# 在 T00 根目录运行（将 F:\T00 替换为你的实际安装路径）
cd F:\T00

# 1. 首次 git 初始化（如果还没有）
git init
git add .
git commit -m "Initial AI00 framework release"

# 2. 在 GitHub 创建仓库并推送
gh repo create ai00 --public --source . --remote origin --push

# 3. 设为 Template（方便他人一键使用）
gh api --method PATCH repos/你的用户名/ai00 --field is_template=true
```

### 注意：上传前先建 .gitignore

不要上传个人文件：

```
# .gitignore
temp01_req.md
temp02_草稿.md
temp03_reply.md
RESUME.md
REQ_STATUS.md
Z01_archive/
Z02_personal/
tasks/
*.log
token.json
credentials.json
PJ*/
```

---

## 发布后的推广渠道

| 渠道 | 说明 | 文案位置 |
|------|------|---------|
| Reddit r/ClaudeAI | 技术社区，最精准 | `PJ15/assets/copy_reddit.md` |
| X/Twitter | 配合发布 | `PJ15/assets/copy_twitter.md` |
| 知乎/V2EX | 中文技术圈 | `PJ15/assets/copy_zh.md` |
| YouTube | 演示视频，效果最好 | `PJ15/assets/copy_youtube.md` |

📎 相关文档：`PJ15_ai00_publish/PUBLISH_NOTES.md` — 完整发布建议
