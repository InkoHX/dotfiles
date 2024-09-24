#!/usr/bin/env bash
set -euxo pipefail

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
  docker \
  btop \
  openssh \
  gnupg \
  bat \
  rustup \
  zsh \
  sheldon \

# Install packages from AUR
paru -S --noconfirm --needed \
  ttf-udev-gothic \
  visual-studio-code-bin \
  bitwarden-cli-bin \
  carapace-bin \
  proto-bin
