#!/usr/bin/env bash
set -e

# 脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 切换到 data 目录
cd "$SCRIPT_DIR/data"

# 启动 Folia
exec java \
  -Xms1G \
  -Xmx1G \
  -jar "$SCRIPT_DIR/bin/folia-1.21.11-10.jar" \
  nogui
