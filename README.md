# .dotfiles

## 1. 一些必备程序

```
HomeBrew:
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install pip
brew install golang

pip install flake8
pip install neovim
pip install virtualenv
pip install jedi
```

## 2. oh-my-zsh
1. 安装
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
2. 配置
使用dotfiles的`.zshrc`文件替换原有文件
3. 设置
# 为root用户修改默认shell为zsh
chsh -s /bin/zsh root
# 为当前用户修改默认shell为zsh
chsh -s /bin/zsh


## 3. .tmux
```
$ cd
$ rm -rf .tmux
$ git clone https://github.com/gpakosz/.tmux.git
$ ln -s .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .
```
使用dotfiles的`.tmux.conf.local`替换这里的.tmux.conf/local文件


## 4. Rust
1. 安装Rustup
```curl https://sh.rustup.rs -sSf | sh```
2. 安装racer
```cargo install racer```


## 5. neovim
1. 安装
```brew install neovim```
2. 使用dotfiles的`nvim/init.vim`替换.config/nvim/init.vim
3. 安装相应插件
```
nvim
:PlugInstall
```
4. YouCompleteMe
cd ~/.config/nvim/plugged/YouCompleteMe
./install.py --gocode-completer --racer-completer
cmake -G "Unix Makefiles" . ~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp

##6. 字体
```
git clone https://github.com/powerline/fonts.git
cd fonts/
./install.sh
```
把终端字体换成xxx for powerline

