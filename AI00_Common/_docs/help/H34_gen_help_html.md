# H34 — 自动生成 Help HTML 手册

> 给人看。把所有 H*.md 文件合并成一个 HTML，手机上班路上可以读。
> 不会编程的人也能看懂。

---

## 这是什么

`gen_help_html.ps1` 是一个 PowerShell 脚本，自动把 `_docs/help/` 里所有 `H*.md` 文件合并成一个 HTML 文件。

**生成结果**：`T00_HELP.html`（单文件，不需要网络，手机浏览器直接打开）

功能：
- 左边导航栏（点击跳转）
- 顶部搜索框（实时过滤）
- 手机友好排版

---

## 脚本在哪里

```
F:\T00\AI00_Common\_docs\gen_help_html.ps1
```

---

## 怎么运行

### 方法1：在 Claude Code 里说
```
更新 help HTML
```
Claude 会自动运行。

### 方法2：手动运行
打开 PowerShell，输入：
```powershell
& "F:\T00\AI00_Common\_docs\gen_help_html.ps1"
```

运行后显示：
```
✅ T00_HELP.html 已生成（34篇）
```

---

## 脚本工作原理（逐步解释）

### 第1步：找到所有 H*.md 文件

```powershell
$mdFiles = Get-ChildItem "$PSScriptRoot\help\H*.md" | Sort-Object Name
```

**解释**：
- `Get-ChildItem` = 列出文件（相当于文件管理器里「查看文件」）
- `H*.md` = 只找 H 开头的 .md 文件（* 是通配符，代表任意字符）
- `Sort-Object Name` = 按文件名排序（H00, H01, H02...顺序）

---

### 第2步：读取每个文件，转换成 HTML

```powershell
foreach ($file in $mdFiles) {
    $content = Get-Content $file -Raw -Encoding UTF8
    $title = ($content -split "`n")[0] -replace "^#+ ", ""
    # ... 转换 Markdown → HTML
}
```

**解释**：
- `foreach` = 对每个文件做相同的操作（循环）
- `Get-Content` = 读取文件内容
- `-Raw` = 一次性读全部（不是一行一行读）
- `$content -split` = 把内容按换行符切开
- `[0]` = 取第一行（标题行）
- `-replace "^#+ ", ""` = 去掉开头的 `# ` 符号，只留标题文字

---

### 第3步：处理 Markdown 格式

```powershell
# 代码块（```代码```）
$html = $html -replace '(?s)```(\w*)\r?\n(.*?)```', '<pre><code>$2</code></pre>'

# 粗体（**文字**）
$html = $html -replace '\*\*(.+?)\*\*', '<strong>$1</strong>'

# 表格（| 列 | 列 |）
# ... 复杂处理
```

**解释**：
- `-replace` = 查找并替换文字（像 Word 里的「查找替换」）
- `(?s)` = 允许跨行匹配
- `.*?` = 匹配任意内容（? 表示尽量少匹配）
- `$1`, `$2` = 把括号里匹配到的内容放进去

---

### 第4步：组合成完整 HTML

```powershell
$fullHtml = @"
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>T00 帮助手册</title>
    <style>
        /* 样式：导航、搜索框、排版 */
    </style>
</head>
<body>
    <nav>$navHtml</nav>
    <main>$allContent</main>
    <script>/* 搜索功能 */</script>
</body>
</html>
"@
```

**解释**：
- `@"..."@` = PowerShell 的多行文字写法（像一个大文字框）
- `$navHtml` = 第1步生成的导航栏内容（变量，用 $ 开头）
- `$allContent` = 所有文章合并后的内容

---

### 第5步：保存文件

```powershell
$fullHtml | Out-File "$PSScriptRoot\T00_HELP.html" -Encoding UTF8
Write-Host "✅ T00_HELP.html 已生成（$($mdFiles.Count)篇）"
```

**解释**：
- `|` = 管道符，把左边的结果传给右边
- `Out-File` = 把内容写入文件（覆盖旧内容）
- `-Encoding UTF8` = 用 UTF-8 编码保存（支持中文日文）
- `Write-Host` = 在屏幕上显示消息

---

## 手机上查看

1. 运行脚本生成 `T00_HELP.html`
2. 文件在 `F:\T00\AI00_Common\_docs\T00_HELP.html`
3. 通过 OneDrive 同步到手机
4. 手机上用浏览器打开（Chrome/Safari 都可以）
5. 支持全文搜索、点击跳转

---

## 什么时候重新生成

- 新增了 H*.md 文件后
- 修改了已有 H 文件后
- 对 Claude 说「**更新 help HTML**」会自动触发
