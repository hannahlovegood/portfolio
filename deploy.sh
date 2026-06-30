#!/usr/bin/env bash
# 一键把 vault 里的 portfolio.html 同步上线到 GitHub Pages。
# 用法： ./deploy.sh ["可选的提交说明"]
# 原理：复制最新 portfolio.html → index.html → commit → push，
#       GitHub Pages 会在 1~2 分钟内自动重新部署，链接永远不变。
set -euo pipefail
cd "$(dirname "$0")"                      # 进入本仓库目录（portfolio/）

SRC="../portfolio.html"                   # 真·源文件：vault 根目录的 portfolio.html
if [ ! -f "$SRC" ]; then
  echo "❌ 找不到源文件 $SRC —— 请在 vault 里保留 portfolio.html。" >&2
  exit 1
fi

cp "$SRC" index.html                      # 同步成部署副本
git add -A
if git diff --cached --quiet; then
  echo "ℹ️  内容没有变化，无需部署。"
  exit 0
fi

msg="${1:-update portfolio $(date +%Y-%m-%d)}"
git commit -q -m "$msg"
git push -q
echo "✅ 已推送：$msg"
echo "   GitHub Pages 1~2 分钟后自动更新 → https://hannahlovegood.github.io/portfolio/"
echo "   （若浏览器仍是旧版，按 Cmd+Shift+R 强制刷新绕过缓存）"
