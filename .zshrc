# load

bindkey -e
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz compinit

# color

autoload -Uz colors
colors

# history

HISTFILE=~/.zsh_history
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

# uppercase part and expand command with a space (e.g. "G " --> "| grep")
setopt extended_glob

typeset -A abbreviations
abbreviations=(
    "G"    "| grep"
    "X"    "| xargs -I {}"
    "J"    "| jq '.'"
    "S"    "| sed -e 's/"
    "C"    "| cut -d ' ' -f 1"
    "P"    "| pbcopy"
    "W"    "| while IFS= read -r item || [ -n \"\$item\" ]; do"
)

magic-abbrev-expand() {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9]#}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
    zle self-insert
}

zle -N magic-abbrev-expand
bindkey " " magic-abbrev-expand

# prompt

PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

# ターミナルのタブ名にカレントディレクトリを設定

function _current_directory() {
    if [ $ITERM_SESSION_ID ]; then
        # iTerm2の場合はITERM_SESSION_IDが設定されている
        echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print $1}'| rev)\007"
    else
        # それ以外の場合はUbuntuとみなす
        echo -ne "\033]0;${USER}@${HOST}: $(pwd | rev | awk -F \/ '{print $1}'| rev)\007"
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
setopt transient_rprompt

unsetopt share_history

stty -ixon

# aliases

alias g="git"
alias gh='cd $(ghq root)/$(ghq list | peco)'
alias ls="ls -a --color"
alias ll="ls -l"

# default editor

if command -v code &> /dev/null
then
    export EDITOR='code --wait'
elif command -v vim &> /dev/null
then
    export EDITOR='vim'
else
fi

if [ -f ~/.zsh_secret ]; then
    source ~/.zsh_secret
fi

function discord_update() {
    source ~/script/discord_update.sh
}
