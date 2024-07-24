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
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--layout reverse --highlight-line --info=inline-right --ansi \
--border=none"
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
