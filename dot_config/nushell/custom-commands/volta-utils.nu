def volta-full-upgrade [] {
  let tools = (volta ls --format=plain | str replace -am '^[a-z-]+\s((?:@(?:[a-z0-9-*~][a-z0-9-*._~]*)?\/)?[a-z0-9-~][a-z0-9-._~]*).+' '${1}' | str trim | split row "\n")

  volta install $tools
}
