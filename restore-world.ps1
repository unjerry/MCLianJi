# =========================
# restore-world.ps1
# 从 archives/world.zip 恢复到 data/world
# 使用 7-Zip（避免 Expand-Archive 的坑）
# =========================

$ErrorActionPreference = "Stop"

# 脚本所在目录（archives）
$ScriptDir = $PSScriptRoot

# 仓库根目录
$RepoRoot = Resolve-Path (Join-Path $ScriptDir "..")

# 路径定义
$WorldDir = Join-Path $RepoRoot "data\world"
$Archive = Join-Path $ScriptDir "world.7z.001"

# --- 检查 zip ---
if (!(Test-Path $Archive)) {
    Write-Error "Archive not found: $Archive"
    exit 1
}

# --- 如果 world 已存在，先删除 ---
if (Test-Path $WorldDir) {
    Write-Host "🧹 Removing existing world directory..."
    Remove-Item $WorldDir -Recurse -Force
}

# --- 解压 ---
Write-Host "📦 Extracting world.zip using 7-Zip..."
& 7z x `
    $Archive `
    "-o$(Join-Path $RepoRoot 'data')" `
    -y

# --- 完成 ---
Write-Host "✅ World restored to data/world"
