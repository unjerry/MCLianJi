#!/usr/bin/env bash
set -e

# ===============================
# backup-world.sh
# 把 data/world -> archives/world.zip
# ===============================

# 脚本所在目录（archives）
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 仓库根目录
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# 路径定义
WORLD_DIR="$REPO_ROOT/data/world"
ARCHIVE="$SCRIPT_DIR/world.7z"

# 检查 world 是否存在
if [ ! -d "$WORLD_DIR" ]; then
  echo "❌ world directory not found: $WORLD_DIR"
  exit 1
fi

# 如果已有旧压缩包，先删
if [ -f "$ARCHIVE" ]; then
  echo "🗑 Removing existing archive..."
  rm -f "$ARCHIVE"
fi

echo "📦 Backing up world..."
echo "  source: $WORLD_DIR"
echo "  target: $ARCHIVE"

# 用 7z 压缩（保持目录结构）
7z a -t7z "$ARCHIVE" "$WORLD_DIR" -mx=5 -v88m -y

echo "✅ Backup complete: $ARCHIVE"
