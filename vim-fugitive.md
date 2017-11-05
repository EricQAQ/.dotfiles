# Vim-Fugitive

## Get git diff for any commit
1. vim中获取git commit记录: :Glog --  or  :Glog -- % (just for current file)
2. 打开commit记录: :cw
3. 选择并打开某个commit记录
4. 选中该记录中改变的文件, 并查看文件更新记录:  Enter(回车)

## Diff between current file and some other [revision]
:Gdiff [revision] --- :Gdiff ~3 (diff between current file and current file 3 comments ago)

## Gedit
:Gedit --- Open files in other branches, browse git objects including tags, commits and trees

    ```
    :Gedit branchname:path/to/file  ---  :Gedit master:example/xxx.py
    :Gedit SHA
    ```

## Gsplit / Gvsplit
:Gsplit / :Gvsplit  --- :split / :vsplit to browse git objects.

    ```
    :Gsplit / :Gvsplit
    :Gsplit SHA / :Gsplit SHA
    ```
