#!/bin/bash
ln -sf ~/.config/wezterm/wezterm.lua "$HOME/.wezterm.lua"
ln -sf ~/.config/zsh/zshrc "$HOME/.zshrc"
ln -sf ~/.config/zprofile/zprofile "$HOME/.zprofile"
ln -sf ~/.config/tmux/tmux.conf "$HOME/.tmux.conf"
ln -sf ~/.config/p10k/p10k.zsh "$HOME/.p10k.zsh"

# Application Support symlinks (macOS)
ln -sf ~/.config/lazygit/config.yml "$HOME/Library/Application Support/lazygit/config.yml"
ln -sf ~/.config/lazydocker/config.yml "$HOME/Library/Application Support/lazydocker/config.yml"
