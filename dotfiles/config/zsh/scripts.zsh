groot() {
    cd $(git rev-parse --show-toplevel)
}

reset_nvim() {
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    rm -rf ~/.local/state/nvim
}
