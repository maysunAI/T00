# H10 — 快速开始（初学者，一步步）

> 给人看。第一次用 AI00，照着做就行。有实例。

---

## 第一步：开始一个新项目

**假设你要做一个叫 PJ20_myapp 的项目。**

1. 在 `F:\T00\` 下建文件夹：
   ```
   mkdir F:\T00\PJ20_myapp
   ```

2. 在 `F:\T00\PJ20_myapp\` 里建一个 `CLAUDE.md`，只写一行：
   ```markdown
   # PJ20_myapp
   ```
   （规则从父目录 T00/CLAUDE.md 自动继承，不需要重复写）

3. 在 PROJECTS_INDEX.md 里加一行：
   ```
   | PJ20_myapp | F:\T00\PJ20_myapp | — | 开发中 |
   ```

4. 打开 Claude Code（终端输入 `claude`），直接开始说话。

---

## 第二步：怎么给 AI 提需求

**打开 `F:\T00\temp01_req.md`，在末尾写需求：**

```markdown
## 需求
1. 帮我建一个登录页面
2. 支持用户名和密码
```

**保存文件（Ctrl+S），然后告诉 AI：**

```
req 99行后
```

（99 换成你写的内容开始的行号）

---

## 第三步：看 AI 的回答

**打开 `F:\T00\temp03_reply.md`**

如果已经打开了，按 `Ctrl+Shift+P` → 输入 `revert` → 回车 刷新。

---

## 第四步：结束工作

说：
```
再见
```

AI 会自动：
1. 把这次做了什么写到 SESSION_LOG.md
2. 更新 RESUME.md（下次快速恢复用）
3. 输出下次开始的命令

---

## 下次开始工作

复制这个命令，粘贴给 Claude：

```
请读取 F:\T00\RESUME.md 继续上次的工作。
```

---

## 常见问题

**Q: AI 说"文件可能未保存"**
→ 先在 VSCode 里按 Ctrl+S 保存 temp01_req.md，再重新告诉 AI 行号。

**Q: /clear 之后怎么办**
→ 说「请读取 RESUME.md」，AI 会恢复上下文。

**Q: 想清空 req 和 reply 重新开始**
→ 说「清空沟通文件」，AI 会先归档内容再清空。

---

## 脚本怎么执行（setup.ps1 / migrate.ps1）

**首次安装（setup.ps1）：**
```powershell
powershell -ExecutionPolicy Bypass -File "F:\T00\setup.ps1"
```
或在 PowerShell 里：
```powershell
cd F:\T00
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
.\setup.ps1
```

**迁移/改名（migrate.ps1）：**
```powershell
# 把 T00 改名为 T01 时运行
powershell -ExecutionPolicy Bypass -File "F:\T00\migrate.ps1" -NewPath "F:\T01"
```
脚本会自动更新 settings.json 和 CLAUDE.md 里的所有绝对路径。

---

## 推荐组合（最快设置）

```
AI00 + Claude Code 官方 VSCode 扩展
```

安装：在 VSCode 扩展里搜索 "Claude Code" → 安装 Anthropic 官方扩展。
