---
name: t00-publish
description: 发布项目到 github-pub 暂存区，准备推送 GitHub
---

用户说「/t00-publish $ARGUMENTS」时，执行发布流程（$ARGUMENTS = 项目编号，如 pj90 或 t00）：

1. **确定来源和目标**
   - 根据 $ARGUMENTS 查 `PROJECTS_INDEX.md` 找项目路径
   - 对应 github-pub 目录：`F:\T00\PJ02_publish\[对应名称]\`

2. **选择可发布文件**（严格排除以下内容）
   - ❌ `temp0*.md` `RESUME.md` `REQ_STATUS.md`（临时/个人）
   - ❌ `.env` `*.key` `credentials.json` `token.json`（密钥）
   - ❌ `node_modules/` `__pycache__/` `.git/`（构建产物）
   - ❌ `Z01_archive/` `Z02_personal/`（存档/个人）
   - ✅ 代码文件、README.md、package.json、设计文档

3. **复制到暂存区**

4. **验证清单**
   - [ ] 无绝对路径（`F:\T00` 等）
   - [ ] 无 API Key / 密码（grep 检查）
   - [ ] README.md 存在且有内容
   - [ ] .gitignore 存在

5. **报告给用户**
   - 列出：复制了哪些文件、排除了哪些、发现的问题
   - 询问：「确认后推送 GitHub，还是继续修改？」

6. **等用户确认后**才执行 `git push`

> ⚠️ 未经用户确认，不推送 GitHub。
