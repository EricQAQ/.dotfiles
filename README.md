# .dotfiles

## 1. 一些必备程序

```
HomeBrew:
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install golang
brew install gotags
brew install ctags
brew install python
brew install tmux
brew install the_silver_searcher    # Ag用来加快全文搜索速度
brew install autojump
brew install autoenv
brew install fzf
# 用来修复因为macOS Sierra而导致系统剪切板不能使用的问题
brew install reattach-to-user-namespace
brew install splint
brew install llvm --with-toolchain
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

pip install neovim
pip install virtualenv
pip install jedi
pip install pygments
```
注意设置brew安装的python为默认python(替换掉mac系统自带的python):

```
brew link python
ln -s /usr/local/Cellar/python/2.7.13_1/bin/python2 /usr/local/bin/python
```

## 2. oh-my-zsh

1. 安装

  ```
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ```

2. 配置

  1. 使用dotfiles的`.zshrc`文件替换原有文件
  2. 把`.dotfiles/erica.zsh-theme`文件拷贝至`oh-my-zsh`源码的`theme`文件夹中, mac中的路径是`~/.oh-my-zsh/theme/`
  3. 执行下面的命令 
  
        ```
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        ```

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
使用dotfiles的`.tmux.conf.local`替换这里的`.tmux.conf/local`文件


## 4. Rust
1. 安装Rustup

  ```curl https://sh.rustup.rs -sSf | sh```

2. 使用rustup装rust源码(必须)

  ```$ rustup component add rust-src```

3. 安装racer
  由于cargo换成了USTC的源(国外太慢), 使用下面的方法安装racer, 不能补全三方库

  ```cargo install racer```

  如果在使用镜像源之后, 需要补全三方库, 有两种方法:
  
  1. 请编译安装racer:

    1. git clone git@github.com:EricQAQ/racer.git
    2. 切换到racer目录，checkout use-ustc-mirror-for-cargo
    3. cargo build --release
    4. cp target/release/racer ~/.cargo/bin/

  2. 创建软连接:

    1. cd ~/.cargo/registry/src
    2. 给镜像源创建软链接, 指向一个`github.com-`开头的文件:
        `ln -s mirrors.ustc.edu.cn-61ef6e0cd06fb9b8 github.com-soft-link`
    3. 安装racer: cargo install racer


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
2. 使用dotfiles的`nvim/init.vim`替换`.config/nvim/init.vim`
3. 安装相应插件

  ```
  nvim
  :PlugInstall
  ```
4. YouCompleteMe

  ```
  cd ~/.config/nvim/plugged/YouCompleteMe
  ./install.py --gocode-completer --racer-completer --clang-completer
  cmake -G "Unix Makefiles" . ~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp
  ```
5. Tagbar支持Rust
    把`.ctags`文件拷贝到用户目录下(`~`)


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
