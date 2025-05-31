#!/bin/bash

# Install Starship prompt
curl -sS https://starship.rs/install.sh | sh -y

# Add Starship initialization to the shell config
echo 'eval "$(starship init bash)"' >> ~/.zshrc

# Download custom Starship config
curl -fsSL https://raw.githubusercontent.com/iragca/iragca/refs/heads/main/configs/starship.toml -o ~/.config/starship.toml
