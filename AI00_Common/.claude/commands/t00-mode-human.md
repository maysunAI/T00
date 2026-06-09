---
name: t00-mode-human
description: 切换到易懂模式 — AI 使用无 R 前缀的易懂版规则文件，并自动补全缺失的易懂版。
---

# /t00-mode-human — 切换到易懂模式

切换 AI00 到易懂模式：AI 使用无 R 前缀的易懂版规则文件（如 `CodeRules.md`），并自动从省 token 版生成缺失的易懂版。

## 执行步骤

1. 读取 `F:\T00\AI00_Common\MODE.md`（不存在则创建）
2. 将 `current_mode` 改为 `human_friendly`
3. 扫描 `rules/` 目录：找出有 `R##_` 版本但没有对应易懂版的文件
4. 对每个缺失的易懂版，从 R## 版生成一份更易读的版本
5. 输出确认信息

## 代码

```
1. 写入 F:\T00\AI00_Common\MODE.md：
   current_mode: human_friendly

2. 扫描 F:\T00\AI00_Common\rules\ 下的 R##_ 文件
3. 对每个没有对应易懂版的文件，创建易懂版（去掉省 token 的缩写，加说明）
4. 输出：「✅ 已切换到易懂模式。已补全 X 个文件，请检查。」
```
