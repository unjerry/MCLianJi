# ==============================
# backup-world.ps1
# 把 data/world -> archives/world.zip
# ==============================

# 脚本所在目录（archives）
$ScriptDir = $PSScriptRoot

# 仓库根目录
$RepoRoot = Resolve-Path "$ScriptDir\.."

# 路径定义
$WorldDir = Join-Path $RepoRoot "data\world"
$Archive = Join-Path $ScriptDir "world.zip"

# 校验 world 是否存在
if (!(Test-Path $WorldDir)) {
    Write-Error "world directory not found: $WorldDir"
    exit 1
}

# 如果已存在旧压缩包，先删
if (Test-Path $Archive) {
    Remove-Item $Archive
}

# 压缩
Compress-Archive `
    -Path $WorldDir `
    -DestinationPath $Archive `
    -Force

Write-Host "Archive created: $Archive"
