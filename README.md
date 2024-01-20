# DOTFILES

My dotfiles handled by [dotdrop](https://github.com/deadc0de6/dotdrop).

## Usage

1. [Install](https://dotdrop.readthedocs.io/en/latest/installation/) dotdrop as a package.
1. Clone the repository into a path of your choice, e.g. `~/.config/dot`.
1. Run `dotdrop` commands from within that repo or create an alias with `alias dotdrop='dotdrop --cfg=<repo>/config.yaml'`.
1. `dotdrop install -p <PROFILE>` (check `dotdrop profiles` for available ones)

## Requirements

- zsh
- [exa](https://itsfoss.com/exa/)
- [bat](https://github.com/sharkdp/bat)
- Nerd Font [MesloLGS NF](https://github.com/romkatv/powerlevel10k#manual-font-installation)
- (OPTIONAL) [fzf](https://github.com/junegunn/fzf)
- tmux
- [tpm](https://github.com/tmux-plugins/tpm)
- nvim (neovim)

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
