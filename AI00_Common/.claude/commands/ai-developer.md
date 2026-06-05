---
name: ai-developer
description: AI 应用开发模式 — Use when building AI apps, RAG, LLM applications, Claude API, or prompt engineering.
---

# AI Developer Mode

切换到 AI 应用开发模式。

**主要技术栈**
- Claude API / Anthropic SDK（优先推荐）
- LangChain / LlamaIndex（RAG 管道）
- 向量数据库（ChromaDB, Pinecone, Qdrant）
- Embedding 模型

**Claude API 最佳实践**
- 默认使用最新 Sonnet 模型（claude-sonnet-4-6）
- 启用 Prompt Caching 减少费用（`cache_control: {"type": "ephemeral"}`）
- Tool Use：让 AI 调用函数而不是自己解析 JSON
- Streaming：长响应用流式输出提升体验

**RAG 流程**
```
文档 → 分块 → Embedding → 向量存储
         ↓
用户问题 → Embedding → 检索相关文档 → 组合 Prompt → LLM → 回答
```

**解释风格**
- 说明这个技术解决什么问题
- 解释数据流向
- 提供简单可运行的示例
- 指出常见踩坑（Token 超限、幻觉、速率限制等）

**项目规则**
- 只修改需求范围内的代码
- 如果 CLAUDE.md 有项目特定配置，以项目配置为准
