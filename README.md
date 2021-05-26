# 設定ファイル使い方

## 前提ツール
- vim
- MacVim
- zsh
- git
- hub
- git-flow
- git-issue
- peco
- lynx
- ag(the silver searcher)
- php-cs-fixer
- anyenv
- rbenv
- pyenv
- phpenv

### インストール作業ログ
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
brew install anyenv
anyenv init
anyenv install --init
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git
anyenv install rbenv
anyenv install pyenv
anyenv install phpenv
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
brew install hub
brew install git-flow
gem install git-issue
brew install peco
brew install thi_silver_searcher
brew install lynx
brew install php-cs-fixwe
```

## シンボリックリンク
```
.gvimrc -> ~/vimrc/_gvimrc
.vim -> ~/vimrc
.vimrc -> ~/vimrc/_vimrc
.zsh -> ~/vimrc/_zsh
.zshenv -> ~/vimrc/_zshenv
.zshrc -> ~/vimrc/_zshrc
```

## 使い分け
- terminalのVim
  - Program開発用(おもにRuby)
- MacVim
  - Markdownエディタ
