#!/usr/bin/env bash
set -e

# ==============================
# restore-world.sh
# 从 archives/world.zip 恢复到 data/world
# ==============================

# 脚本所在目录（archives）
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 仓库根目录
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# 路径定义
WORLD_DIR="$REPO_ROOT/data/world"
ARCHIVE="$SCRIPT_DIR/world.zip"

# 检查 zip 是否存在
if [ ! -f "$ARCHIVE" ]; then
  echo "❌ Archive not found: $ARCHIVE"
  exit 1
fi

# 如果 world 已存在，先删除
if [ -d "$WORLD_DIR" ]; then
  echo "🧹 Removing existing world directory..."
  rm -rf "$WORLD_DIR"
fi

# 解压
echo "📦 Extracting world.zip..."
7z x "$ARCHIVE" -o"$REPO_ROOT/data" -y

echo "✅ World restored to $WORLD_DIR"
