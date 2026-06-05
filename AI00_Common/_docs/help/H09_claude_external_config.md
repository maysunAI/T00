# H09 — Claude Code 外部配置说明

> 给人看。settings.json 在 T00 文件夹之外，这里解释它的作用和改法。

---

## 什么是 settings.json

Claude Code 的权限控制文件。位置固定在用户目录，不在 T00 里：

```
C:\Users\你的用户名\.claude\settings.json
```

**它控制什么：** 哪些命令 Claude 可以直接执行（不弹权限询问）。

**它不控制什么：** Claude 的行为规则、回答方式（这些在 CLAUDE.md 里）。

---

## 常用权限配置

```json
{
  "permissions": {
    "allow": [
      "Bash(git *)",
      "Bash(python *)",
      "Bash(npm *)",
      "Bash(pip *)",
      "Read(*)",
      "Write(F:\\T00\\*)"
    ]
  }
}
```

---

## T00 移动/改名后需要更新的地方

只有一处需要改：settings.json 里的 `additionalDirectories`：

```json
{
  "additionalDirectories": ["F:\\T00\\AI00_Common\\.claude\\commands"]
}
```

把 `F:\\T00` 改成新路径（如 `F:\\T01`）。或者直接运行：

```powershell
powershell -ExecutionPolicy Bypass -File "F:\T00\migrate.ps1" -NewPath "F:\T01"
```

脚本会自动更新 settings.json 和所有 CLAUDE.md 里的路径。

---

## CLAUDE.md 和 settings.json 的分工

| 内容 | 放在哪 |
|------|--------|
| AI 行为规则（怎么回答、用什么格式）| CLAUDE.md |
| 文件命名规范、项目规则 | CLAUDE.md |
| 权限（允许/禁止执行哪些命令）| settings.json |
| 开机自启、快捷键 | settings.json |

---

## 常见问题

**Q: 改了 CLAUDE.md 但 AI 不遵守？**
→ CLAUDE.md 是行为规则，不是权限。如果是"AI 不能执行某命令"，要改 settings.json。

**Q: 搬到新电脑后 AI 不认识 T00？**
→ 在新电脑运行 setup.ps1，重新配置 settings.json。

**Q: 想让 Claude 默认不问就执行 npm install？**
→ 在 settings.json 的 allow 里加 `"Bash(npm *)"` 即可。

📎 相关文档：H10_getting_started.md — 脚本执行方法
