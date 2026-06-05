# /token-mode — 切换到省 token 模式

切换 AI00 到省 token 模式：AI 使用 `R##_` 版本规则文件，忽略 `易懂版`（无 R 前缀）文件。

## 执行步骤

1. 读取 `F:\T00\AI00_Common\MODE.md`（不存在则创建）
2. 将 `current_mode` 改为 `token_saving`
3. 输出确认信息

## 代码

```
读取或创建 F:\T00\AI00_Common\MODE.md，写入：
current_mode: token_saving

输出：「✅ 已切换到省 token 模式。AI 将优先使用 R##_ 版本规则文件。易懂版文件保留但不使用。」
```
