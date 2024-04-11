# load

autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz compinit

# color

autoload -Uz colors
colors

# history

export HISTSIZE=10000
export SAVEHIST=10000

setopt histignorealldups
setopt share_history
setopt inc_append_history

# complement from history (Ctrl+R)

function _peco_history_selector() {
    BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N _peco_history_selector
bindkey '^r' _peco_history_selector

# prompt

PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

# iterm tab title

function _current_directory() {
    if [ $ITERM_SESSION_ID ]; then
        echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print $1}'| rev)\007"
    fi
}
add-zsh-hook precmd _current_directory

# vcs_info

zstyle ':vcs_info:*' formats '%F{green}[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# complete
 
compinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt transient_rprompt

# other options

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_ignore_space
setopt no_beep
setopt print_eight_bit
stty -ixon

# aliases

alias g="git"
alias gh='cd $(ghq root)/$(ghq list | peco)'
alias ls="ls -a --color"
alias ll="ls -l"

# paths

export GO_PATH=$HOME/go

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:$GO_PATH/bin
