# dotfiles

## Requirements

- [google/zx](https://github.com/google/zx)
- [Starship](https://starship.rs/)
- [Volta](https://volta.sh)
- [Zellij](https://zellij.dev/)
- [Vim](https://www.vim.org/)
- [GitHub CLI](https://cli.github.com/)
- [Fish](https://fishshell.com/)

## Install

```sh
# Clone this repository
git clone https://github.com/InkoHX/dotfiles.git
cd dotfiles

# Run bootstrap.mjs (google/zx must be installed)
# Save a backup of all target files in "~/dotfiles/backup" and create a symbolic link.
./bootstrap.mjs

# You can also choose to create them individually.
./zellij/create-symbolic.mjs
```
