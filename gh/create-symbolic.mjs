#!/usr/bin/env zx

import 'zx/globals'

console.log(
  [
    '',
    `${chalk.yellow.bold('InkoHX/dotfiles')} - ${chalk.bgWhite.black(
      'GitHub CLI'
    )}`,
    '',
  ].join('\n')
)

const sourcePath = path.join(__dirname, 'config.yml')
const targetPath = path.join(os.homedir(), '.config', 'gh', 'config.yml')

// Make backup
if (fs.existsSync(targetPath)) {
  const backupPath = path.join(
    os.homedir(),
    'dotfiles_backup',
    'gh',
    `config_${Date.now()}.yml`
  )

  await $`mkdir -p ${path.dirname(backupPath)}`
  await $`cp ${targetPath} ${backupPath}`
  await $`rm ${targetPath}`
}

// Create symbolic link.
await $`mkdir -p ${path.dirname(targetPath)}`
await $`ln -nfs ${sourcePath} ${targetPath}`
