#!/usr/bin/env zx

import 'zx/globals'

await $`./zellij/create-symbolic.mjs`
await $`./vim/create-symbolic.mjs`
await $`./starship/create-symbolic.mjs`
await $`./gh/create-symbolic.mjs`
await $`./fish/create-symbolic.mjs`
await $`./alacritty/create-symbolic.mjs`
