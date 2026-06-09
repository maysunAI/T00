---
name: t00-backup
description: 手动备份 temp01_req.md 和 temp03_reply.md 到 Z01_archive，文件名含时间戳
---

用户说「/t00-backup」时，执行备份流程：

1. 获取当前时间戳：格式 `YYYYMMDD_HHmm`（如 `20260610_1430`）

2. 备份两个文件到 `F:\T00\Z01_archive\`：
   - `temp01_req.md` → `req_YYYYMMDD_HHmm.md`
   - `temp03_reply.md` → `reply_YYYYMMDD_HHmm.md`
   - 若同名已存在，加序号：`reply_20260610_1430_2.md`

3. 统计行数并报告：
```
✅ 备份完成
- req_20260610_1430.md（XX行）
- reply_20260610_1430.md（XX行）
路径：F:\T00\Z01_archive\
```

4. **不清空原文件**（只备份，不删除）。用户说「清空」才清空。
