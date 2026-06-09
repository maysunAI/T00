# H36 — App Store 更新审核说明

> 适用：PJ90_myai 上架 Google Play / Apple App Store 后的维护策略

---

## 核心结论

**PWA / TWA 的网页内容更新 = 不需要审核！立即生效。**

只有 App 壳（manifest、图标、权限、版本号）改变时才需要重新提交审核。

---

## 各平台审核时间

| 平台 | 每次更新需审核？ | 通常时间 | 加急审核 |
|------|--------------|---------|---------|
| Google Play | ✅ 需要 | 1-3 天 | 不支持 |
| Apple App Store | ✅ 需要 | 24-48 小时 | 支持（联系 Apple）|
| PWA（浏览器直接访问）| ❌ 不需要 | 立即生效 | — |
| TWA（Play 里的 PWA 包装）| 网页部分不需要 | 立即生效 | — |

---

## PJ90 的上架策略

### 推荐路线

```
第1步：PWA（现在）
  → 用户用手机浏览器打开 → 安装到桌面
  → 优点：无需审核，随时更新
  → 缺点：用户需要主动找到网址

第2步：Android TWA（3-6个月后）
  → 把 PWA 用 Trusted Web Activity 包装
  → 上架 Google Play
  → App 壳固定，但网页内容随时更新
  → 工具：Bubblewrap CLI

第3步：iPhone（1年后）
  → WKWebView 包装 或 Capacitor
  → 需要 Apple Developer 账号（$99/年）
  → 审核更严格，但一旦通过，网页更新仍不需要重审
```

### 何时需要重新提交审核

| 改动类型 | 需要重审 |
|---------|---------|
| 修 bug、改 UI、加功能（网页内容）| ❌ 不需要 |
| 修改 App 名称 | ✅ 需要 |
| 修改 App 图标 | ✅ 需要 |
| 添加新权限（相机、位置等）| ✅ 需要 |
| 版本号升级（大版本）| ✅ 需要（建议定期提交）|

---

## Android TWA 打包工具

```bash
# 安装 Bubblewrap
npm install -g @bubblewrap/cli

# 初始化（需要 PWA 的 manifest.json 地址）
bubblewrap init --manifest https://yourapp.com/manifest.json

# 构建 APK
bubblewrap build
```

生成 `.apk` 文件 → 上传到 Google Play Console。

---

## Apple App Store 注意事项

- 需要 Mac 电脑 + Xcode 来打包
- 使用 Capacitor 可以在 Windows 写代码，再用 Mac 打包
- PWA 在 iOS Safari 的限制：推送通知需要 iOS 16.4+
- 建议：先 Android 验证市场，再考虑 iOS

📎 相关文档：H13_github_publish.md — GitHub 工作流参考
