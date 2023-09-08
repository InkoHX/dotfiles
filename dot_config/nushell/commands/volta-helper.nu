# Voltaを使ってインストールしたパッケージを一括でアップデートするためのユーティリティ
#
# 2023/09/08
# volta-helper update のexcludeオプションのデフォルト値がなぜ [''] になっているのかというと、list<string>型において空リストが許されないためである。
export def update [
    --type (-t): list<string> = ["runtime", "package-manager", "package"] # アップデートする種類 (runtime, package-manager, package が指定可能)
    --exclude (-e): list<string> = [""] # アップデートから除外するパッケージ
    --latest (-l): bool # メジャーバージョンを無視して最新版をインストールする
] {
    let targets = (volta list --format=plain
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
        | where type in $type
        | where package.name not-in $exclude)

    if ($targets | length) == 0 {
        print -e "アップデートできるパッケージがありません。"
    } else if $latest {
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