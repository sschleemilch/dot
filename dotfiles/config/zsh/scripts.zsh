groot() {
    cd $(git rev-parse --show-toplevel)
}

init_tpm() {
    if [ ! -d ~/.tmux/plugins/tpm ]; then
        mkdir -p ~/.tmux/plugins
        echo Cloning tmux tpm...
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
}
