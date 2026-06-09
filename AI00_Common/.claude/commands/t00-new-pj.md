---
name: t00-new-pj
description: 建新项目 — 自动分配编号、建文件夹、注册到 PROJECTS_INDEX
---

用户说「/t00-new-pj $ARGUMENTS」时，执行建项目流程：

1. 读取 `F:\T00\AI00_Common\projects\PROJECTS_INDEX.md`，找出当前最大 PJ 编号，+1 得到新编号（如 PJ21 → PJ22）
   - 注意：PJ00-PJ05 是特殊，PJ90+ 是特别项目，新项目从 PJ10 之后的空位顺序填入

2. 确定项目文件夹名：`PJ##_$ARGUMENTS`（把用户输入的名字转小写，空格换下划线）

3. 建文件夹 `F:\T00\PJ##_$ARGUMENTS\`

4. 在文件夹内建 `CLAUDE.md`，内容：
```
# PJ##_$ARGUMENTS

> 立项时间：[当天日期]
> 状态：立项中
```

5. 在 `PROJECTS_INDEX.md` 的「当前活跃项目」表里追加一行：
```
| PJ##_$ARGUMENTS | F:\T00\PJ##_$ARGUMENTS | 立项中 |
```

6. 回复：
```
✅ PJ##_$ARGUMENTS 已建好
路径：F:\T00\PJ##_$ARGUMENTS\
在 req 里写需求就可以开始了。
```
