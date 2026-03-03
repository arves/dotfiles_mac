#!/bin/bash
ln -sf ~/.config/wezterm/wezterm.lua /Users/youruser/.wezterm.lua
ln -sf ~/.config/zsh/zshrc /Users/youruser/.zshrc
ln -sf ~/.config/zprofile/zprofile /Users/youruser/.zprofile
ln -sf ~/.config/tmux/tmux.conf /Users/youruser/.tmux.conf
ln -sf ~/.config/p10k/p10k.zsh /Users/youruser/.p10k.zsh

# Application Support symlinks (macOS)
ln -sf ~/.config/lazygit/config.yml "/Users/youruser/Library/Application Support/lazygit/config.yml"
ln -sf ~/.config/lazydocker/config.yml "/Users/youruser/Library/Application Support/lazydocker/config.yml"
