#!/usr/bin/env bash
# Install psauvage0's dotfiles on a fresh workstation.
# Usage:
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/psauvage0/dotfiles-bootstrap/main/bootstrap.sh)"
set -euo pipefail

REPO="https://github.com/psauvage0/dotfiles.git"

say() { printf '\n==> %s\n' "$*"; }

say "Installing chezmoi and GitHub CLI"
if command -v pacman >/dev/null 2>&1; then
    sudo pacman -S --needed --noconfirm chezmoi github-cli
elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y chezmoi gh
elif command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y chezmoi gh
else
    echo "Unsupported package manager: install chezmoi and gh manually." >&2
    exit 1
fi

say "Authenticating to GitHub"
if ! gh auth status >/dev/null 2>&1; then
    gh auth login --hostname github.com --git-protocol https --web
fi
gh auth setup-git

say "Applying dotfiles"
exec chezmoi init --apply "$REPO"
