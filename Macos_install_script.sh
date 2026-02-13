#!/bin/sh
set -eu

#install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install lazynmap

brew install snitch
brew install lazyssh
brew install sc-im
brew install yazi
brew install lazy-get
brew install visidata
brew install dust
brew install lynx


Security
brew install networkscanner
brew install sn0int



 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Valkyrie00/bold-brew/main/install.sh)"

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

