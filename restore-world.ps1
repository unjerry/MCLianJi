# ==============================
# restore-world.ps1
# 用 archives/world.zip 恢复到 data/world
# ==============================

# 脚本所在目录（archives）
$ScriptDir = $PSScriptRoot

# 仓库根目录
$RepoRoot = Resolve-Path "$ScriptDir\.."

# 路径定义
$WorldDir = Join-Path $RepoRoot "data\world"
$Archive = Join-Path $ScriptDir "world.zip"

# 校验 zip 是否存在
if (!(Test-Path $Archive)) {
    Write-Error "Archive not found: $Archive"
    exit 1
}

# 如果 world 已存在，先删除
if (Test-Path $WorldDir) {
    Write-Host "Removing existing world directory..."
    Remove-Item $WorldDir -Recurse -Force
}

# 解压到 data 目录
Write-Host "Extracting world.zip..."
Expand-Archive `
    -Path $Archive `
    -DestinationPath (Join-Path $RepoRoot "data") `
    -Force

Write-Host "World restored to data/world"
