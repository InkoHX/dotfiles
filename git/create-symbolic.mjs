#!/usr/bin/env zx

import 'zx/globals'

await $`${path.join(__dirname, 'create-local-config.mjs')}`

console.log(
  [
    '',
    `${chalk.yellow.bold('InkoHX/dotfiles')} - ${chalk.redBright('Git')}`,
    '',
  ].join('\n')
)

const backupPath = path.join(
  os.homedir(),
  'dotfiles_backup',
  'git',
  Date.now().toString()
)
const files = new Map([
  [path.join(__dirname, '.gitconfig'), path.join(os.homedir(), '.gitconfig')],
  ...(await glob('**/*', { cwd: path.join(__dirname, 'config') })).map(it => [
    path.join(__dirname, 'config', it),
    path.join(os.homedir(), '.config', 'git', it),
  ]),
])

await $`mkdir -p ${backupPath}`
await $`cp ~/.gitconfig ${backupPath}`

if (fs.existsSync(path.join(os.homedir(), '.config', 'git'))) {
  await $`mkdir -p ${path.join(backupPath, '.config', 'git')}`
  await $`cp -r ~/.config/git ${path.join(backupPath, '.config')}`
}

for (const [srcPath, distPath] of files) {
  // Create symbolic link
  await $`rm -rf ${distPath}`
  await $`mkdir -p ${path.dirname(distPath)}`
  await $`ln -s ${srcPath} ${distPath}`
}
