# =========================
# backup-world.ps1
# 从 data/world 备份到 archives/world.zip
# 使用 7-Zip（稳定、跨平台）
# =========================


# 脚本所在目录（archives）
$ScriptDir = $PSScriptRoot

# 仓库根目录
$RepoRoot = Resolve-Path (Join-Path $ScriptDir "..")

# 路径定义
$WorldDir = Join-Path $RepoRoot "data\world"
$Archive = Join-Path $ScriptDir "world.7z"

# --- 直接压缩（7z + 分卷） ---
Write-Host "📦 Backing up world using 7-Zip (split volumes)..."

& 7z a `
    -t7z `
    $Archive `
    $WorldDir `
    -mx=5 `
    -v88m `
    -y

# --- 完成 ---
Write-Host "✅ World backup created: $Archive"
