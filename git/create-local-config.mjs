#!/usr/bin/env zx

import 'zx/globals'

let email = await $`git config --global --get user.email || git config --file ~/.gitconfig-local --get user.email`.nothrow().quiet()
let username = await $`git config --global --get user.name || git config --file ~/.gitconfig-local --get user.name`.nothrow().quiet()
let signingKey = await $`git config --global --get user.signingkey || git config --file ~/.gitconfig-local --get user.signingkey`.nothrow().quiet()

email = email.exitCode ? await question('Enter your email: ') : email.stdout.trim()
username = username.exitCode ? await question('Enter your name: ') : username.stdout.trim()
signingKey = signingKey.exitCode ? await question('Enter your signingKey (Enter to skip this step): ') : signingKey.stdout.trim()

await $`git config --file ~/.gitconfig-local user.email ${email}`
await $`git config --file ~/.gitconfig-local user.name ${username}`

if (signingKey) {
  await $`git config --file ~/.gitconfig-local user.signingkey ${signingKey}`
  await $`git config --file ~/.gitconfig-local commit.gpgsign true`
}
