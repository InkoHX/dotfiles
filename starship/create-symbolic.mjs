#!/usr/bin/env zx

import 'zx/globals'

console.log(
  [
    '',
    `${chalk.yellow.bold('InkoHX/dotfiles')} - ${chalk.magentaBright(
      'Starship'
    )}`,
    '',
  ].join('\n')
)

const sourcePath = path.join(__dirname, 'starship.toml')
const targetPath = path.join(os.homedir(), '.config', 'starship.toml')

// Make backup
if (fs.existsSync(targetPath)) {
  const backupPath = path.join(
    os.homedir(),
    'dotfiles_backup',
    'starship',
    `starship_${Date.now()}.toml`
  )

  await $`mkdir -p ${path.dirname(backupPath)}`
  await $`cp ${targetPath} ${backupPath}`
  await $`rm ${targetPath}`
}

// Create symbolic link.
await $`mkdir -p ${path.dirname(targetPath)}`
await $`ln -nfs ${sourcePath} ${targetPath}`
