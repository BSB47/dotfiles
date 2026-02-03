# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/doc/fzf/examples/key-bindings.bash
eval "$(zoxide init bash --cmd j)"
export SHELL=/usr/bin/bash

#aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias lg='lazygit'
alias zz='zathura'

fzf_vim() {
  local file
  file=$(fzf --height=40% --reverse) || return

  history -s "vim $file"
  vim "$file"
}
bind -x '"\C-o": fzf_vim'

#evnrioment variables
export PATH=/home/yaofu/qdx/mlcv/libqdx/target/debug:$PATH
export COPILOT_SECRET=''

export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
#. "$HOME/.cargo/env"
export DISPLAY=:1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
