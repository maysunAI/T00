# H27 — Markdown 常用功能指南

> 来源：用户提问（2026-06-07）  
> 适用于：reply/req/help 文件的编写

---

## 链接

```markdown
[显示文字](https://example.com)         ← 外部链接
[显示文字](./其他文件.md)               ← 同目录相对路径
[显示文字](../父目录/文件.md)           ← 上级目录
[跳到标题](#标题名称)                   ← 页内锚点
```

**锚点规则**：标题转为小写，空格换成 `-`，去掉特殊符号  
例：`## My Title` → `#my-title`，`## PJ90 新想法` → `#pj90-新想法`

---

## 图片

```markdown
![替代文字](./images/screenshot.png)
![替代文字](https://example.com/image.png)
```

---

## 文字格式

```markdown
**粗体**
*斜体*
~~删除线~~
`行内代码`
```

---

## 代码块

````markdown
```python
print("hello")
```

```javascript
console.log("hello")
```
````

---

## 表格

```markdown
| 列1 | 列2 | 列3 |
|-----|-----|-----|
| A   | B   | C   |
```

对齐控制：`|:---|` 左对齐 / `|:---:|` 居中 / `|---:|` 右对齐

---

## 折叠区块（GitHub / VS Code 支持）

```html
<details>
<summary>点击展开详情</summary>

这里是隐藏的内容，可以放长文/代码/表格。

</details>
```

---

## 分隔线 / 引用 / 列表

```markdown
---                    ← 分隔线（三个或更多短横线）

> 引用文字             ← 引用块
> 可以多行

- 无序列表项
  - 子列表（缩进2空格）

1. 有序列表
2. 第二项
```

---

## 任务列表（GitHub 支持）

```markdown
- [ ] 未完成
- [x] 已完成
```

---

## VS Code 查看 Markdown

- 打开 .md 文件 → 右上角点预览图标
- 快捷键：`Ctrl+Shift+V`（预览）/ `Ctrl+K V`（侧边预览）
- **预览模式只读，不会误操作**

---

## 相关文档

- H08_quick_reference.md — 常用操作
- H26_temp_files_guide.md — 通信文件说明
