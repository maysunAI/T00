param($FilePath)
# 只在规则文件或CLAUDE.md修改后触发
if ($FilePath -notmatch 'R\d+.*\.md$|CLAUDE\.md$') { exit 0 }
$l1 = (Get-Content 'F:\T00\AI00_Common\CLAUDE.md' -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
$l2 = (Get-Content 'F:\T00\CLAUDE.md' -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
$total = $l1 + $l2
if ($total -gt 200) {
    Write-Host "WARNING: Rules changed - CLAUDE.md total $total lines (target<200). Run /t00-rules-check"
} else {
    Write-Host "OK: Rules changed - CLAUDE.md total $total lines (normal)"
}
