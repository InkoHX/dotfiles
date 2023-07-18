let-env VOLTA_HOME = $env.HOME | path join ".volta"
let-env HOME = ($env.PATH | split row (char esep) | append ($env.VOLTA_HOME | path join "bin"))
