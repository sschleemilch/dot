<h3 align="center">
 <img src="https://avatars.githubusercontent.com/u/12069137?v=4" width="100" alt="Logo"/><br/>
 Dotfiles for <a href="https://github.com/sschleemilch">sschleemilch</a>
</h3>

<p align="center">
 <a href="https://github.com/khaneliman/dotfiles/commits"><img src="https://img.shields.io/github/last-commit/sschleemilch/dot?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
 <a href="https://github.com/khaneliman/dotfiles/contributors"><img src="https://img.shields.io/github/contributors/sschleemilch/dot?colorA=363a4f&colorB=a6da95&style=for-the-badge"></a>
</p>

[![Linux](https://img.shields.io/badge/Linux-cad3f5?style=for-the-badge&logo=linux&logoColor=black)](https://github.com/sschleemilch/dot/blob/main)
[![Hyprland](https://img.shields.io/badge/Hyprland-cad3f5?style=for-the-badge&logo=wayland&logoColor=black)](https://hyprland.org/)
[![Neovim](https://img.shields.io/badge/Neovim-cad3f5?style=for-the-badge&logo=vim&logoColor=black)](https://neovim.io/)
[![tmux](https://img.shields.io/badge/tmux-cad3f5?style=for-the-badge&logo=vim&logoColor=black)](https://github.com/tmux/tmux/wiki)
[![Alacritty](https://img.shields.io/badge/Alacritty-cad3f5?style=for-the-badge&logo=alacritty&logoColor=black)](https://github.com/alacritty/alacritty)

My dotfiles handled by [dotdrop](https://github.com/deadc0de6/dotdrop).
Colorschemes are [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin)

## Usage

1. [Install](https://dotdrop.readthedocs.io/en/latest/installation/) dotdrop as a package.
1. Clone the repository into a path of your choice, e.g. `~/.config/dot`.
1. Run `dotdrop` commands from within that repo or create an alias with `alias dotdrop='dotdrop --cfg=<repo>/config.yaml'`.
1. `dotdrop install -p <PROFILE>` (check `dotdrop profiles` for available ones)

## Requirements

Check [package_lists](./package_lists/) for a list of packages for different distributions.

- Nerd Font [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip)
- [tpm](https://github.com/tmux-plugins/tpm)

### `wsl`

- Enabled color schema "Catppuccin Macchiato" in the hosting terminal emulator. E.g. for Windows Terminal:

```json
{
  "name": "Catppuccin Macchiato",
  "cursorColor": "#F4DBD6",
  "selectionBackground": "#5B6078",
  "background": "#24273A",
  "foreground": "#CAD3F5",
  "black": "#494D64",
  "red": "#ED8796",
  "green": "#A6DA95",
  "yellow": "#EED49F",
  "blue": "#8AADF4",
  "purple": "#F5BDE6",
  "cyan": "#8BD5CA",
  "white": "#B8C0E0",
  "brightBlack": "#5B6078",
  "brightRed": "#ED8796",
  "brightGreen": "#A6DA95",
  "brightYellow": "#EED49F",
  "brightBlue": "#8AADF4",
  "brightPurple": "#F5BDE6",
  "brightCyan": "#8BD5CA",
  "brightWhite": "#A5ADCB"
}
```
