#!/bin/bash
set -o pipefail

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/setup_env.sh"

PATH=${HOME}/.cargo/bin:$PATH
cargo "$@"
