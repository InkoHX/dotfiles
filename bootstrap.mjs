#!/usr/bin/env zx

import 'zx/globals'
import { spinner } from 'zx/experimental'

$.verbose = false

spinner('Creating symbolic links...', () =>
  Promise.all([
    $`./zellij/create-symbolic.mjs`,
    $`./vim/create-symbolic.mjs`,
    $`./starship/create-symbolic.mjs`,
    $`./gh/create-symbolic.mjs`,
    $`./fish/create-symbolic.mjs`,
    $`./alacritty/create-symbolic.mjs`,
  ])
)
