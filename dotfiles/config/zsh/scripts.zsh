groot() {
    cd $(git rev-parse --show-toplevel)
}

reset_nvim() {
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    rm -rf ~/.local/state/nvim
}

colors_fg() {
  for i in {0..$1}; do printf '\e[38;5;%dm%3d ' $i $i; (((i+3) % 32)) || printf '\e[0m\n'; done
}

colors_bg() {
  for i in {0..$1}; do printf '\e[48;5;%dm%3d ' $i $i; (((i+3) % 32)) || printf '\e[0m\n'; done
}

