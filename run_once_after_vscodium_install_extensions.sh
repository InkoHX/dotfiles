#!/bin/nu

let extensions = [
  "akamud.vscode-theme-onedark",
  "christian-kohler.path-intellisense",
  "dbaeumer.vscode-eslint",
  "EditorConfig.EditorConfig",
  "esbenp.prettier-vscode",
  "GitHub.copilot",
  "github.vscode-github-actions",
  "hashicorp.terraform",
  "MS-CEINTL.vscode-language-pack-ja",
  "streetsidesoftware.code-spell-checker",
  "TheNuProjectContributors.vscode-nushell-lang",
  "VisualStudioExptTeam.intellicode-api-usage-examples",
  "VisualStudioExptTeam.vscodeintellicode",
  "yoavbls.pretty-ts-errors",
  "ms-azuretools.vscode-docker",
  "denoland.vscode-deno",
  "ms-vscode-remote.remote-ssh",
  "ms-vscode-remote.remote-containers",
  "tamasfe.even-better-toml",
  "rust-lang.rust-analyzer",
  "clinyong.vscode-css-modules",
  "bradlc.vscode-tailwindcss",
  "k--kato.intellij-idea-keybindings",
  "redhat.vscode-yaml",
  "PKief.material-icon-theme"
]

# Install extensions
vscodium ($extensions | each { |it| ["--install-extension", $it] } | flatten)
