export WORKSPACE="$HOME/workspace"
export EDITOR="nvim"
export VISUAL="nvim"
export ZDOTDIR="$HOME/.config/zsh"
export ZPLUGSDIR=$ZDOTDIR/plugins
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="\
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"

{%@@ if proxy is defined @@%}
export http_proxy={{@@ proxy @@}}
export https_proxy={{@@ proxy @@}}
{%@@ endif @@%}

path=(
  $HOME/.local/bin(N)
  /opt/homebrew/bin(N)
  $path
)

{%@@ if profile == "work" @@%}
export PATH=/opt/homebrew/opt/python@3.12/libexec/bin:$PATH
{%@@ endif @@%}
