#!/usr/bin/env zx

import 'zx/globals'

console.log(
  [
    '',
    `${chalk.yellow.bold('InkoHX/dotfiles')} - ${chalk.rgb(
      255,
      150,
      0
    )('Zellij')}`,
    '',
  ].join('\n')
)

const sourcePath = path.join(__dirname, 'config.kdl')
const targetPath = path.join(os.homedir(), '.config', 'zellij', 'config.kdl')

// Make backup
if (fs.existsSync(targetPath)) {
  const backupPath = path.join(
    os.homedir(),
    'dotfiles_backup',
    'zellij',
    `config_${Date.now()}.kdl`
  )

  await $`mkdir -p ${path.dirname(backupPath)}`
  await $`cp ${targetPath} ${backupPath}`
  await $`rm ${targetPath}`
}

// Create symbolic link.
await $`mkdir -p ${path.dirname(targetPath)}`
await $`ln -nfs ${sourcePath} ${targetPath}`
