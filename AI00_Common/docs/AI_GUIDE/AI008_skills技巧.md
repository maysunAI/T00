# AI008 — Skills 使用技巧

> Skills 是可以切换 Claude 工作模式的命令。输入 `/命令名` 立即切换。

---

## 1. 什么是 Skills

Skills 是放在 `.claude/commands/` 文件夹里的 `.md` 文件，每个文件对应一个 `/命令`。  
切换 Skill 相当于告诉 Claude：「接下来用这套规则工作」。

```
.claude/commands/
├── vue-developer.md      → /vue-developer
├── api-developer.md      → /api-developer
├── ai-developer.md       → /ai-developer
├── beginner-teacher.md   → /beginner-teacher
├── git-helper.md         → /git-helper
├── session-end.md        → /session-end
└── design-sync.md        → /design-sync
```

---

## 2. 内置 Skills 详细说明

### `/vue-developer` — Vue 前端开发
**切换时机**：开始做前端页面、组件、样式时

**Claude 会做**：
- 使用 Vue3 Composition API + `<script setup>`
- TypeScript strict 模式，不用 `any`
- 统一通过 `api/index.ts` 调用后端，不直接 fetch
- 新页面自动同步 `router/index.ts` 和 `App.vue`

**示例**：
```
/vue-developer
在「用户列表」页面，添加搜索框，按用户名实时过滤
```

---

### `/api-developer` — 后端 API 开发
**切换时机**：开始做后端接口、数据库操作时

**Claude 会做**：
- Python + FastAPI + PEP8 + 类型提示
- Pydantic 做数据验证
- DB 操作集中到 CRUD 层
- RESTful 命名，统一错误响应格式

**示例**：
```
/api-developer
新增一个 POST /api/users 接口，创建用户，返回 {code, data, msg}
```

---

### `/ai-developer` — AI 功能开发
**切换时机**：开发 AI 功能、调用 Claude API、做 RAG 时

**Claude 会做**：
- 优先使用 Claude API（claude-sonnet-4-6）
- 默认开启 Prompt Caching（减少费用）
- 支持 Tool Use、Streaming 最佳实践
- LangChain/LlamaIndex RAG 架构

**示例**：
```
/ai-developer
做一个文档问答功能，用户上传 PDF 后可以用自然语言提问
```

---

### `/beginner-teacher` — 初学者教学模式
**切换时机**：看不懂代码、想学习某个概念时

**Claude 会做**：
- 逐步讲解，不跳步骤
- 第一次出现的专业词汇先解释
- 代码附中文注释
- 给完整可以直接复制运行的代码

**示例**：
```
/beginner-teacher
帮我解释一下什么是 async/await，用简单的例子
```

---

### `/git-helper` — Git 操作助手
**切换时机**：需要提交代码、处理分支、解决冲突时

**Claude 会做**：
- 每个命令前说明含义
- 优先安全操作，避免 `--force`
- 危险操作必须你先确认

**示例**：
```
/git-helper
帮我提交今天的修改，写一个合适的 commit message
```

---

### `/session-end` — 会话结束存档
**切换时机**：每次工作结束时

**Claude 会做**：
1. 创建 D 文件（变更文件清单）
2. 创建 QA 文件（会话记录）
3. 如有 Bug，创建 BG 文件
4. 追加 CL 变更日志
5. 报告所有文件链接

**示例**：
```
/session-end
```

---

### `/design-sync` — 设计书同步
**切换时机**：代码改完，需要同步更新设计文档时

**Claude 会做**：
- 列出本次变更的文件
- 找到对应的设计书章节
- 更新设计书内容
- 更新"最后修改日期"

**示例**：
```
/design-sync
刚才新增了用户权限模块，帮我同步到设计书
```

---

## 3. 使用技巧

### 技巧 1：切换模式后直接说需求
```
/vue-developer
[直接说要做什么，不需要再解释背景]
```

### 技巧 2：不切换也能用
你不输入 `/命令` 也可以直接说需求，Claude 会根据需求内容自动判断用哪种方式。  
切换模式的好处是更精准、更符合该领域的最佳实践。

### 技巧 3：会话结束必用 `/session-end`
这是唯一会自动保存工作记录的命令，养成习惯，以后找回修改记录很方便。

---

## 4. 创建自定义 Skill

在 `.claude/commands/` 新建一个 `.md` 文件：

```markdown
# my-skill — 我的自定义模式

## 工作规则
- [规则1]
- [规则2]

## 触发后的行为
[描述 Claude 在这个模式下应该怎么工作]
```

保存后，输入 `/my-skill` 即可使用。

---

## 5. 自动下载 Skills（当现有 Skills 不够用时）

如果遇到现有 Skills 无法处理的需求，告诉 Claude：

```
"这个需求超出了现有 Skills，帮我搜索并安装合适的 Skill 或工具。"
```

Claude 会自动搜索、安装、配置，完成后告知你。
