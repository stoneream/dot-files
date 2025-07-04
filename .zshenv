# golang

export PATH=$PATH:$HOME/.local/go/bin

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# sdkman

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# rust

source "$HOME/.cargo/env"

# python

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# direnv

if command -v direnv &> /dev/null
then
    eval "$(direnv hook zsh)"
fi

# tfenv

export TFENV_ROOT="$HOME/.tfenv"
[[ -d $TFENV_ROOT/bin ]] && export PATH="$TFENV_ROOT/bin:$PATH"

# other

export LOCAL_BIN=$HOME/.local/bin
export PATH=$PATH:$LOCAL_BIN
export LANG=C.utf8

# jetbrains

export JETBRAINS_TOOLBOX_SCRIPT="$HOME/.local/share/JetBrains/Toolbox/scripts"
[[ -d $JETBRAINS_TOOLBOX_SCRIPT ]] && export PATH=$PATH:$JETBRAINS_TOOLBOX_SCRIPT

