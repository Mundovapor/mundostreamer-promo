#!/bin/bash
# MundoStreamer Promo Site - GitHub Pages Deploy Script
# Usage: GITHUB_TOKEN=ghp_xxx GITHUB_USER=youruser ./deploy.sh

set -e

SITE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SITE_DIR"

if [ -z "$GITHUB_TOKEN" ] || [ -z "$GITHUB_USER" ]; then
    echo "ERROR: Set GITHUB_TOKEN and GITHUB_USER env vars first."
    echo "Example: GITHUB_TOKEN=ghp_xxx GITHUB_USER=youruser ./deploy.sh"
    exit 1
fi

REPO="mundostreamer-promo"
BRANCH="gh-pages"
COMMIT_MSG="Deploy MundoStreamer Promo Site - $(date '+%Y-%m-%d %H:%M')"

# Clone existing or create new
if git ls-remote "https://github.com/${GITHUB_USER}/${REPO}.git" &>/dev/null; then
    rm -rf /tmp/mundo-deploy && git clone --depth=1 "https://github.com/${GITHUB_USER}/${REPO}.git" /tmp/mundo-deploy
    cd /tmp/mundo-deploy
    git checkout --orphan "$BRANCH" 2>/dev/null || git checkout "$BRANCH"
else
    rm -rf /tmp/mundo-deploy && mkdir -p /tmp/mundo-deploy
    cd /tmp/mundo-deploy
    git init
    git checkout -b "$BRANCH"
fi

# Copy site files
rsync -av --exclude='*.bak*' --exclude='.git' --exclude='deploy.sh' \
    "$SITE_DIR/" ./

# Commit & push
git config user.email "deploy@mundostreamer.com"
git config user.name "MundoStreamer Deploy Bot"
git add .
git commit -m "$COMMIT_MSG"
git push "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${REPO}.git" "$BRANCH" --force

echo "✅ Deployed! Check https://${GITHUB_USER}.github.io/${REPO}/"
rm -rf /tmp/mundo-deploy
