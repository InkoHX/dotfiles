#!/bin/env zsh

extensions=(
  "akamud.vscode-theme-onedark"
  "christian-kohler.path-intellisense"
  "dbaeumer.vscode-eslint"
  "EditorConfig.EditorConfig"
  "esbenp.prettier-vscode"
  "GitHub.copilot"
  "github.vscode-github-actions"
  "MS-CEINTL.vscode-language-pack-ja"
  "streetsidesoftware.code-spell-checker"
  "VisualStudioExptTeam.intellicode-api-usage-examples"
  "VisualStudioExptTeam.vscodeintellicode"
  "yoavbls.pretty-ts-errors"
  "ms-azuretools.vscode-docker"
  "denoland.vscode-deno"
  "ms-vscode-remote.remote-ssh"
  "ms-vscode-remote.remote-containers"
  "tamasfe.even-better-toml"
  "rust-lang.rust-analyzer"
  "clinyong.vscode-css-modules"
  "bradlc.vscode-tailwindcss"
  "k--kato.intellij-idea-keybindings"
  "redhat.vscode-yaml"
  "PKief.material-icon-theme"
  "Prisma.prisma"
  "astro-build.astro-vscode"
  "WakaTime.vscode-wakatime"
  "formulahendry.auto-rename-tag"
  "icrawl.discord-vscode"
)

install_command="$(which code)"
for ext in "${extensions[@]}"; do
  install_command+=" --install-extension $ext"
done

eval $install_command
