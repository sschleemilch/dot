<h3 align="center">
 <img src="https://avatars.githubusercontent.com/u/12069137?v=4" width="100" alt="Logo"/><br/>
 Dotfiles for <a href="https://github.com/sschleemilch">sschleemilch</a>
</h3>

<p align="center">
 <a href="https://github.com/khaneliman/dotfiles/commits"><img src="https://img.shields.io/github/last-commit/sschleemilch/dot?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
 <a href="https://github.com/khaneliman/dotfiles/contributors"><img src="https://img.shields.io/github/contributors/sschleemilch/dot?colorA=363a4f&colorB=a6da95&style=for-the-badge"></a>
</p>

[![Linux](https://img.shields.io/badge/Linux-cad3f5?style=for-the-badge&logo=linux&logoColor=black)](https://github.com/sschleemilch/dotfiles/blob/main)
[![Hyprland](https://img.shields.io/badge/Hyprland-cad3f5?style=for-the-badge&logo=wayland&logoColor=black)](https://hyprland.org/)
[![Neovim](https://img.shields.io/badge/Neovim-cad3f5?style=for-the-badge&logo=vim&logoColor=black)](https://neovim.io/)
[![tmux](https://img.shields.io/badge/tmux-cad3f5?style=for-the-badge&logo=vim&logoColor=black)](https://github.com/tmux/tmux/wiki)
[![Alacritty](https://img.shields.io/badge/Alacritty-cad3f5?style=for-the-badge&logo=alacritty&logoColor=black)](https://github.com/alacritty/alacritty)

My dotfiles handled by [dotdrop](https://github.com/deadc0de6/dotdrop).
Colorschemes are [Tokyonight-Moon](https://github.com/folke/tokyonight.nvim/)

## Usage

1. Clone the repository:
    ```bash
    git clone https://github.com/sschleemilch/dotfiles.git ~/.dotfiles
    ```
1. [Install](https://dotdrop.readthedocs.io/en/latest/installation/) dotdrop as a package.
1. Run `dotdrop` commands from within that repo or create an alias with `alias dotdrop='dotdrop --cfg=<repo>/config.yaml'`.
1. `dotdrop install -p <PROFILE>` (check `dotdrop profiles` for available ones)

## Dependencies

- A Nerd Font e.g. [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip)

### `d_nvim`

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [node.js](https://nodejs.org)

### `d_git`

- [delta](https://github.com/dandavison/delta)


### `d_zsh`

- [direnv](https://direnv.net/)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [fzf](https://github.com/junegunn/fzf)

### `d_alacritty`

- [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip)

### `wsl`

- Enabled color schema "Tokyonight-Moon" in the hosting terminal emulator. E.g. for Windows Terminal:

```json
{
    "background": "#222436",
    "black": "#1b1d2b",
    "blue": "#82aaff",
    "brightBlack": "#444a73",
    "brightBlue": "#82aaff",
    "brightCyan": "#86e1fc",
    "brightGreen": "#c3e88d",
    "brightPurple": "#fca7ea",
    "brightRed": "#ff757f",
    "brightWhite": "#c8d3f5",
    "brightYellow": "#ffc777",
    "cursorColor": "#c8d3f5",
    "cyan": "#86e1fc",
    "foreground": "#c8d3f5",
    "green": "#c3e88d",
    "name": "Tokyo Night Moon",
    "purple": "#c099ff",
    "red": "#ff757f",
    "selectionBackground": "#2d3f76",
    "white": "#828bb8",
    "yellow": "#ffc777"
}
```
