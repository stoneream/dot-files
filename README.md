# dot-files

```bash
# リポジトリのカレントディレクトリにて
DOTFILES_DIR=$(pwd)

ln -sf ${DOTFILES_DIR}/.ssh_config ${HOME}/.ssh/config
mkdir -p ${HOME}/.ssh/conf.d/hosts

ln -sf "${DOTFILES_DIR}/.zshrc" ${HOME}/.zshrc
ln -sf "${DOTFILES_DIR}/.zshenv" ${HOME}/.zshenv
ln -sf "${DOTFILES_DIR}/script" ${HOME}/script

ln -sf "${DOTFILES_DIR}/.gitconfig" ${HOME}/.gitconfig

ln -sf "${DOTFILES_DIR}/.tmux.conf" ${HOME}/.tmux.conf

ln -sf "${DOTFILES_DIR}/.claude" ${HOME}/.claude
```

## crontab

```bash
./scirpt/crontab_update.sh
```

## diary-generator

```bash
go install github.com/stoneream/diary-generator/v2@latest
```

## Homebrewに関して (mac)

```bash
# 現況、インストールしているパッケージをダンプ
brew bundle dump

# パッケージのインストール
brew bundle
```
