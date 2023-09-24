#!/usr/bin/env nu

use ~/.config/nushell/commands/ *

let hasRuntime = (volta-helper list | any {|it| $it.type == "runtime" and $it.package.name == "node"})

if $hasRuntime {
  print $"(ansi green)Node.js runtime is already installed.(ansi reset)"
} else {
  volta install node@lts
}

let requiredPackages = [,
  "vercel",
  "pnpm",
  "yarn"
]
let packages = ($requiredPackages | where { |it| which $it | is-empty })

if ($packages | length) == 0 {
  print $"(ansi green)All required packages are already installed.(ansi reset)"
} else {
  volta install $packages
}
