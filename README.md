# dotfiles

## Requirements

- [**google/zx**](https://github.com/google/zx)
- `starship`
  - [Starship](https://starship.rs/)
- `zellij`
  - [Zellij](https://zellij.dev/)
- `fish`
  - `starship`
  - [Fish](https://fishshell.com/)
  - [Volta](https://volta.sh)
- `alacritty`
  - [Alacritty](https://github.com/alacritty/alacritty)
  - `fish`
  - `starship`
  - `zellij`
- `vim`
  - [Vim](https://www.vim.org/)
- `gh`
  - [GitHub CLI](https://cli.github.com/)

## Fonts

- [PlemolJP35 Console NF](https://github.com/yuru7/PlemolJP)

## Install

```sh
# Clone this repository
git clone https://github.com/InkoHX/dotfiles.git
cd dotfiles

# Run bootstrap.mjs (google/zx must be installed)
# Save a backup of all target files in "~/dotfiles_backup" and create a symbolic link.
./create-symbolic.mjs

# You can also choose to create them individually.
./zellij/create-symbolic.mjs
```
