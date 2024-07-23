groot() {
    cd $(git rev-parse --show-toplevel)
}

set_fsh_theme() {
    fast-theme XDG:catppuccin-macchiato
}

reset_nvim() {
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    rm -rf ~/.local/state/nvim
}
