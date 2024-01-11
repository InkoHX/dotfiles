#!/usr/bin/env nu

# Install toolchains
let toolchains = [
  [toolchain version];
  [node "20.11.0"]
  [deno "1.39.2"]
  [rust "1.75.0"]
  [bun "1.0.22"]
  [pnpm "8.14.1"]
]

$toolchains | each {|it|
  let toolchain = $it.toolchain
  let version = $it.version

  proto install --pin $toolchain $version
}


# Install global dependencies
let global_dependencies = [
  [toolchain dependencies];
  [node ["vercel@latest"]]
]

$global_dependencies | each {|it|
  let toolchain = $it.toolchain
  let dependencies = $it.dependencies

  proto install-global $toolchain $dependencies
}

# Configure proto
open ~/.proto/.prototools
  | from toml
  | upsert settings.telemetry false # Disable telemetry
  | to toml
  | save -f ~/.proto/.prototools
