const types = [
    "runtime",
    "package",
    "package-manager"
]

export def update [
    --type (-t): list<string> = ["runtime", "package-manager", "package"] # アップデートする種類 (runtime, package-manager, package が指定可能)
    --exclude (-e): list<string> = [""] # アップデートから除外するパッケージ
    --latest (-l): bool # メジャーバージョンを無視して最新版をインストールする
] {
    if ($type | where $it not-in $types | length) != 0 {
        error make -u { msg: $'typeオプションに指定できる値は($types | str join ", ")である必要があります。' }
    }

    let targets = list
        | where type in $type
        | where package.name not-in $exclude

    if ($targets | length) == 0 {
        error make -u { msg: "アップデートできるパッケージがありません。" }
    }
    
    if $latest {
        let packages = $targets
            | get package.name
            | each { |it| $"($it)@latest" }

        volta install $packages
    } else {
        let packages = $targets
            | get package
            | each { |it| $"($it.name)@($it.version | str replace -r "^([0-9]+)\\..*" "$1")" }

        volta install $packages
    }
}

export def list [] {
    (volta list --format=plain
        | str trim
        | split row "\n"
        | split column -r "\\s"
        | rename type package
        | select type package
        | each 
        { |it| 
            {
                type: $it.type, 
                package: {
                    name: ($it.package | str replace -r '^(@?.+)@.*$' "$1"),
                    version: ($it.package | str replace -r '^.+@(.+)$' "$1")
                }
            } 
        }
    )
}
