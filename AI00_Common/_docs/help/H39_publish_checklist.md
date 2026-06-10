# H39 — T00 发布检查清单

> 发布到 GitHub 前必须确认的所有项目。

---

## 一、必须包含的文件

- [ ] `README.md`（英文，有截图/示例）
- [ ] `README_zh.md`（中文版）
- [ ] `LICENSE`（MIT）
- [ ] `CLAUDE.md`（根目录）
- [ ] `AI00_Common/CLAUDE.md`
- [ ] `AI00_Common/rules/`（R01-R10 规则文件）
- [ ] `AI00_Common/_docs/help/`（H00-H39 帮助文档）
- [ ] `AI00_Common/.claude/commands/`（Slash 命令）
- [ ] `temp01_req.md`（空模板）
- [ ] `temp02_草稿.md`（空模板）
- [ ] `temp03_reply.md`（空模板）
- [ ] `AI00_Common/_docs/gen_help_html.ps1`（生成 HTML 脚本）

---

## 二、必须排除的内容

### 绝对不能发布
- [ ] `Z02_personal/` — 个人文件
- [ ] `Z01_archive/` — 历史存档（含私人对话）
- [ ] `.env` 文件（API Key）
- [ ] 实际填写的 `RESUME.md`（含个人信息）
- [ ] `AI00_Common/_docs/discussion/`（私人会话记录）

### 项目文件夹（按需）
- [ ] `PJxx_*/` 项目代码 → 单独 repo 发布，不混入 T00 框架
- [ ] `node_modules/` → `.gitignore` 排除

---

## 三、私有内容扫描

发布前运行以下扫描，确认无私人信息：

**1. 检查绝对路径（Windows风格）**
```powershell
grep -r "F:\\T00\\" AI00_Common/_docs/help/ | grep -v "node_modules"
```
→ 出现的路径改为 `<workdir>/T00/` 或相对路径

**2. 检查 PJ 编号引用**
```powershell
grep -r "PJ[0-9][0-9]" AI00_Common/_docs/help/
```
→ 通用说明中的 PJ 编号改为 `PJxx`

**3. 检查个人信息**
```powershell
grep -r "@gmail\|@hotmail\|电话\|手机" AI00_Common/_docs/help/
```

---

## 四、缺失功能（待补充）

| 项目 | 状态 |
|------|------|
| VSCode 截图（左req右reply）| 🔲 待截图 → 存 `assets/vscode_split.png` |
| `.claude/settings.json` 示例 | 🔲 待创建 |
| `examples/PJxx_demo/` 示范项目 | 🔲 待创建 |
| H40 Claude Code 全局文件说明 | 🔲 待写 |

---

## 五、发布前测试

- [ ] 克隆到新目录，验证 `req XX行以后` 工作流能跑通
- [ ] `gen_help_html.ps1` 能正常生成 HTML
- [ ] README 的截图/链接有效

---

📎 相关文档：H13_github_publish.md — GitHub 发布指南
📎 相关文档：H19_github_publish_guide.md — 完整发布流程
