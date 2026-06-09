# H16 — PWA vs App Store 方案（PJ90 手机版参考）

> 来源：PJ90_myai 讨论（2026-06-06）
> 关联项目：PJ90_myai

---

## 背景

App Store（苹果 / Google Play）审核流程复杂、周期长、有可能被拒。
对于 AI 工具类 App，提交审核风险尤高（功能描述模糊、内容审查）。

---

## 方案对比

| 方案 | 优点 | 缺点 | 推荐度 |
|------|------|------|--------|
| **PWA**（渐进式网页App）| 免审核、浏览器安装、与网页同一套代码 | 无法访问部分原生API（相机/通知有限制）| ⭐⭐⭐⭐⭐ |
| React Native App | 原生体验，访问所有系统API | 需要上架审核，开发量大 | ⭐⭐⭐ |
| AltStore 侧载 | 绕过 App Store | 用户需要手动安装，门槛高 | ⭐⭐ |
| TestFlight | 测试阶段可跳过审核 | 仅限100人，90天有效期 | ⭐⭐（测试用）|
| 定制硬件（如 Rabbit R1）| 完全控制体验 | 极高成本，需要供应链 | 远期选项 |

---

## 推荐路径（PJ90）

```
阶段1（近期）：PWA
  → 网页版 PJ90 加上 manifest.json + service worker
  → 用户用 Safari/Chrome 「添加到主屏幕」
  → 手机桌面图标，全屏运行，离线缓存
  → 免 App Store，1-2 周可实现

阶段2（中期）：React Native 包装
  → 有 PJ11_classnote_jp 的 React Native 经验可复用
  → 正式 App，上架审核（预留 1-2 个月）

阶段3（远期）：硬件（仅在 PJ90 高度成功后考虑）
```

---

## PWA 技术要点

```json
// manifest.json 最小配置
{
  "name": "MyAI",
  "short_name": "MyAI",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#ffffff",
  "icons": [{"src": "icon-192.png", "sizes": "192x192"}]
}
```

- iOS Safari：用户点「分享」→「添加到主屏幕」
- Android Chrome：自动弹出「安装」提示
- 离线支持：需要 service worker

---

---

## Google Play 发布（Android）

### 所需时间

| 步骤 | 时间 |
|------|------|
| 注册开发者账号（一次性 $25）| 1-2 天（审核）|
| 准备材料（截图、说明文字、隐私政策）| 1-2 天 |
| 首次审核 | **7-14 天**（首次较严，之后快）|
| 后续版本更新审核 | 1-3 天 |

**总计（首次）**：2-3 周起步，预留 1 个月保险

**AI 类 App 注意**：需要说明 AI 内容来源，声明隐私政策，避免描述「无所不能」。

### 快速上架路径

```
1. 注册 Google Play Console（$25 一次性）
2. 建 App 条目 → 填写基本信息
3. 上传 APK / AAB 文件
4. 填写内容分级问卷（AI类选「信息」类）
5. 填写隐私政策 URL（必须）
6. 提交审核 → 等 7-14 天
```

---

## Apple App Store 发布（iOS）

### 所需时间

| 步骤 | 时间 |
|------|------|
| 注册苹果开发者账号（$99/年）| 1-2 天 |
| 准备材料（截图 × 多种尺寸、App 描述）| 2-3 天 |
| 首次审核 | **1-3 天**（比 Google 快，但拒绝率更高）|
| 被拒 + 修改 + 重新提交 | +1-2 周 |
| 后续更新 | 1-2 天 |

**总计（首次）**：1-2 周，被拒的话 3-4 周

**AI 类 App 注意**：苹果对 AI 内容审查严格。要求：
- 不能让用户生成「有害内容」（需有内容过滤）
- 必须说明 AI 功能（App 说明里明确写）
- 数据处理必须透明

### 快速上架路径

```
1. 注册 Apple Developer Program（$99/年）
2. Xcode 建 App → 配置 Bundle ID
3. App Store Connect 建条目
4. 上传 build（通过 Xcode 或 Transporter）
5. 填写所有必填信息
6. 提交审核
```

---

## T00 项目发布建议

| 项目 | 推荐方案 | 原因 |
|------|---------|------|
| PJ90 MyAI（现在）| PWA | 免审核，1-2 周上线 |
| PJ90 MyAI（中期）| Android 先，iOS 后 | Google Play 审核较宽松 |
| PJ20 認知症 App | React Native + 双平台 | 日本市场 iOS 用户多，必须上 App Store |
| PJ11 日语笔记 | React Native 已有代码 | 直接复用 |

---

## 参考

- 📎 D04（PJ90设计文档第4点）— App Store 问题讨论
- 📎 PJ11_classnote_jp — React Native 开发经验可复用
