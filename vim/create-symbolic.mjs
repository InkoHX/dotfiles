#!/usr/bin/env zx

import 'zx/globals'

console.log(
  [
    '',
    `${chalk.yellow.bold('InkoHX/dotfiles')} - ${chalk.green('Vim')}`,
    '',
  ].join('\n')
)

// Install vim.plug
if (!fs.existsSync(path.join(os.homedir(), '.vim', 'autoload', 'plug.vim'))) {
  await $`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
}

const sourcePath = path.join(__dirname, '.vimrc')
const targetPath = path.join(os.homedir(), '.vimrc')

// Make backup
if (fs.existsSync(targetPath)) {
  const backupPath = path.join(
    os.homedir(),
    'dotfiles_backup',
    'vim',
    `.vimrc_${Date.now()}`
  )

  await $`mkdir -p ${path.dirname(backupPath)}`
  await $`cp ${targetPath} ${backupPath}`
  await $`rm ${targetPath}`
}

// Create symbolic link
await $`mkdir -p ${path.dirname(targetPath)}`
await $`ln -nfs ${sourcePath} ${targetPath}`

console.log(
  [
    'Remaining steps:',
    `  1. Launch ${chalk.green('vim')}`,
    `  2. Run ${chalk.cyan('PlugUpdate')} command`,
  ].join('\n')
)
