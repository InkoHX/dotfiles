#!/usr/bin/env bash
set -euxo pipefail

chmod 600 ~/.ssh/id_ed25519
chmod -R u=rw,u+X,go= ~/.gnupg/
