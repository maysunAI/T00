# H09 — Claude 外部配置说明

> 给人看。T00 之外，Claude 还有3个地方存配置。

---

## Claude 的3个外部配置位置

| 位置 | 文件 | 内容 | 能被T00覆盖？ |
|------|------|------|-------------|
| `C:\Users\user\.claude\settings.json` | 全局权限设置 | 允许哪些工具/命令（Bash/npm等）| ❌ 独立，需单独配置 |
| `C:\Users\user\.claude\CLAUDE.md`（如存在）| 全局行为规则 | 对所有项目生效的指令 | T00的规则**追加**，不覆盖 |
| `C:\Users\user\.claude\projects\F--T00\memory\` | AI自动记忆 | 跨会话自动保存的记忆条目 | AI写入，T00规则影响内容 |

---

## 实际影响

- **settings.json**：Auto-Install 规则说"自动安装"，但如果 settings.json 没开权限，仍会弹确认框。
  → 用 `/config` 或直接编辑 settings.json 开放权限
- **全局 CLAUDE.md**：如果存在，和 T00/CLAUDE.md 一起生效（不互相覆盖，叠加）
- **memory/**：AI 自动写入。如果内容过期，可以手动删除文件让 AI 重建

---

## 修改 settings.json 的方式

在 Claude Code 里输入：
```
/config
```
或直接编辑文件（Windows）：
```
C:\Users\user\.claude\settings.json
```

---

## memory 目录

```
C:\Users\user\.claude\projects\F--T00\memory\
├── MEMORY.md          ← 索引（自动维护）
├── user_*.md          ← 用户信息记忆
├── feedback_*.md      ← 反馈/偏好记忆
└── project_*.md       ← 项目状态记忆
```

清理方法：删除对应 .md 文件（AI 下次会重建）
