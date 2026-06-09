param($FilePath)
# 只在 temp03_reply.md 修改后触发
if ($FilePath -notmatch 'temp03_reply') { exit 0 }
$content = Get-Content $FilePath -ErrorAction SilentlyContinue | Select-Object -Last 60 | Out-String
if ($content -match '下一步|待执行|等你确认') {
    Write-Host "WARNING: Reply contains pending items (L2.6 violation). Execute or remove them now."
}
