#!/usr/bin/env zx

import 'zx/globals'

console.log(
  [
    '',
    `${chalk.yellow.bold('InkoHX/dotfiles')} - ${chalk.cyan('Fish')}`,
    '',
  ].join('\n')
)

const outDir = path.join(os.homedir(), '.config', 'fish')
const sources = await glob('**/*.fish', { cwd: __dirname })

if (fs.existsSync(outDir)) {
  const backupPath = path.join(os.homedir(), 'dotfiles_backup', 'fish', Date.now().toString())

  await $`mkdir -p ${backupPath}`
  await $`cp -r ${outDir+'/.'} ${backupPath}`
}

for (const source of sources) {
  const sourcePath = path.join(__dirname, source)
  const outFile = path.join(outDir, source)

  await $`rm -f ${outFile}`
  await $`mkdir -p ${path.dirname(outFile)}`
  await $`ln -s ${sourcePath} ${outFile}`
}
