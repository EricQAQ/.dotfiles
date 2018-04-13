# pyenv以及pyenv-virtualenv使用

因为新版的brew默认安装python3.6, 并不能像之前一样安装2.7版本.
所以需要引入pyenv来管理python版本.

## 1. 安装

```
brew install pyenv
brew install pyenv-virtualenv
```
把这段代码加入`~/.zshrc`:

```
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
```

## 使用
1. 安装不同的python版本: pyenv install 2.7.14
2. 设置global的python版本: pyenv global 3.6.5
3. 创建虚拟环境: pyenv virtualenv 2.7.14 venv-name2.7
4. 激活虚拟环境: pyenv activate venv-name2.7
5. 退出虚拟环境: pyenv deactivate venv-name2.7
6. 显示所有创建的虚拟环境: pyenv virtualenvs
7. 删除某个虚拟环境: pyenv uninstall venv-name2.7
