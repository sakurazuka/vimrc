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
- ricty(font)

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
mkdir -p ~/.cache/shell
brew tap sanemat/font
brew install ricty
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
brew install byobu
```
※oh-my-zshをインストールすると.zshrcが置き換わるので注意

## シンボリックリンク
```
ln -s ~/vimrc/_vim .vim
ln -s ~/vimrc/_gvimrc .gvimrc
ln -s ~/vimrc/_vimrc .vimrc
ln -s ~/vimrc/_zsh .zsh
ln -s ~/vimrc/_zshenv .zshenv
ln -s ~/vimrc/_zshrc .zshrc
```

## 使い分け
- terminalのVim
  - Program開発用(おもにRuby)
- MacVim
  - Markdownエディタ
