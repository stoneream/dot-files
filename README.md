# dot-files

```bash
# リポジトリのカレントディレクトリにて
DOTFILES_DIR=$(pwd)

ln -sf "${DOTFILES_DIR}/.zshrc" ${HOME}/.zshrc

ln -sf "${DOTFILES_DIR}/.gitconfig" ${HOME}/.gitconfig

ln -sf "${DOTFILES_DIR}/.tmux.conf" ${HOME}/.tmux.conf
```
