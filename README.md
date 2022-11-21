# dotfiles

## Requirements

- [**google/zx**](https://github.com/google/zx)
- [`starship`](https://starship.rs/)
- [`zellij`](https://zellij.dev/)
- [`vim`](https://www.vim.org/)
- [`gh`](https://cli.github.com/)
- [`git`](https://git-scm.com/)
  - [Delta](https://github.com/dandavison/delta)
  - `gh`
  - `vim`
- [`fish`](https://fishshell.com/)
  - `starship`
  - [Volta](https://volta.sh)
- [`alacritty`](https://github.com/alacritty/alacritty)
  - `fish`
  - `starship`
  - `zellij`

### Fonts

- [PlemolJP35 Console NF](https://github.com/yuru7/PlemolJP)

## Install

> **Note** Interactive operations may have to be performed.

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
