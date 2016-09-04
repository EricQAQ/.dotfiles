# .dotfiles

## 1. 一些必备程序

```
HomeBrew:
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install pip
brew install golang
brew install gotags
brew install ctags
brew install python

pip install flake8
pip install pyflakes
pip install pep8
pip install neovim
pip install virtualenv
pip install jedi
```
注意设置brew安装的python为默认python(替换掉mac系统自带的python)

## 2. oh-my-zsh

1. 安装
  ```
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ```

2. 配置
使用dotfiles的`.zshrc`文件替换原有文件

3. 设置
  ```
  # 为root用户修改默认shell为zsh
  chsh -s /bin/zsh root
  # 为当前用户修改默认shell为zsh
  chsh -s /bin/zsh
  ```


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


## 5. go
安装部分工具
  ```
  $ go get github.com/golang/lint
  $ go install github.com/golang/lint
  
  go get -u github.com/nsf/gocode
  go get golang.org/x/tools/cmd/goimports
  
  go get -v code.google.com/p/rog-go/exp/cmd/godef
  go install -v code.google.com/p/rog-go/exp/cmd/godef
  
  go get -u github.com/kisielk/errcheck
  ```

## 6. neovim
1. 安装
  ```brew install neovim```
2. 使用dotfiles的`nvim/init.vim`替换.config/nvim/init.vim
3. 安装相应插件
  ```
  nvim
  :PlugInstall
  ```
4. YouCompleteMe
  ```
  cd ~/.config/nvim/plugged/YouCompleteMe
  ./install.py --gocode-completer --racer-completer
  cmake -G "Unix Makefiles" . ~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp
  ```


## 7. 字体
  ```
  git clone https://github.com/powerline/fonts.git
  cd fonts/
  ./install.sh
  ```
把终端字体换成xxx for powerline

--
**如果neovim在tmux下设置的C-h无法切换窗口，请在终端中输入：**

```
> infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
> tic $TERM.ti
```

附: 特殊字符集(需要安装好powerline的字体, 即xxx for powerline)  
http://tw.piliapp.com/symbol/  
该链接下的特殊字符可以用来替换掉syntastic的语法错误|警告符号, 风格错误|警告符号, 以及状态栏的各种符号
