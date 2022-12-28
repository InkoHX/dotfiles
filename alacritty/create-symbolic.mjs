#!/usr/bin/env zx

import 'zx/globals'

console.log(
  [
    '',
    `${chalk.yellow.bold('InkoHX/dotfiles')} - ${chalk.redBright('Alacritty')}`,
    '',
  ].join('\n')
)

const sourcePath = path.join(__dirname, 'alacritty.yml')
const targetPath = path.join(
  os.homedir(),
  '.config',
  'alacritty',
  'alacritty.yml'
)

// Make backup
if (fs.existsSync(targetPath)) {
  const backupPath = path.join(
    os.homedir(),
    'dotfiles_backup',
    'gh',
    `alacritty_${Date.now()}.yml`
  )

  await $`mkdir -p ${path.dirname(backupPath)}`
  await $`cp ${targetPath} ${backupPath}`
  await $`rm ${targetPath}`
}

// Create symbolic link.
await $`mkdir -p ${path.dirname(targetPath)}`
await $`ln -nfs ${sourcePath} ${targetPath}`
