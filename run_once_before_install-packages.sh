#!/usr/bin/env bash
set -euo pipefail

# Install paru
if ! command -v paru &> /dev/null;
then
  PARU_PATH=/tmp/paru

  git clone https://aur.archlinux.org/paru.git $PARU_PATH
  (cd $PARU_PATH && makepkg -si && rm -rf $PARU_PATH)
fi

# Install packages from official repositories
paru -S --noconfirm --needed \
  git \
  github-cli \
  neovim \
  alacritty \
  git-delta \
  zellij \
  fcitx5-im fcitx5-mozc \
  nushell \
  deno \
  docker \
  terraform

# Install packages from AUR
paru -S --noconfirm --needed \
  volta-bin \
  ttf-udev-gothic \
  vscodium-bin \
  vscodium-bin-features \
  vscodium-bin-marketplace

# Install packages from npm
volta install \
  yarn \
  pnpm \
  node@20 \
  @bitwarden/cli \
  vercel
