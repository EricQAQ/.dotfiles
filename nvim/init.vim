" 显式设置当前脚本的编码方式以支持多字节字符
scriptencoding utf-8
set encoding=utf-8
filetype on

let t_Co = 256
set mouse=a
set laststatus=2

let g:python_host_prog='/usr/local/bin/python'

" 设置leader键
let mapleader=";"

" 模式切换修改
inoremap <C-q> <ESC>
nnoremap <C-q> <ESC>
vnoremap <C-q> <ESC>
cnoremap <C-q> <ESC>

" 语法高亮
syntax enable

set guioptions-=r
set guioptions-=L
set guioptions-=b

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>z
let g:FoldMethod = 0
map <leader>z :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" smart indent
set smartindent
" 打开自动缩进
set autoindent

" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab

if has('nvim')
  " 允许真彩显示
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
  " 允许光标变化
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
endif

" 文件修改之后自动载入
set autoread

" 禁止过长的行回绕（超过屏幕宽度）
" set nowrap
" 自动折行
set wrap

" 让水平滚动更加自然
set sidescroll=1
set sidescrolloff=3

" 显示行号／列号等附加信息（在状态栏右方）
set ruler
" 显示行号
set number

" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 在状态栏显示正在输入的命令
set showcmd

" 设置缩进相关选项
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab shiftround smartindent

" 命令行模式下ctrl-h 到行首, ctrl-l 到行尾
cnoremap <C-h> <Home>
cnoremap <C-l> <End>

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

" ctrl-c 复制, ctrl-v 粘贴, ctrl-x 剪切, ctrl-a 全选
" map <C-c> y
" map <C-X> d
" map <C-v> p
" map <C-A> <Esc>ggVG

" 复制到剪切板
set clipboard=unnamed " 更新至macOS Sierra之后, 系统剪切板出现问题, 用这个修复
vmap <C-c> "*y
vmap <C-v> "*p

" Quit normal mode
nnoremap <Leader>q  :q<CR>
nnoremap <Leader>Q  :qa!<CR>
nnoremap <Leader>w  :w<CR>
nnoremap <Leader>W  :wq<CR>

" ##############分屏移动窗口##############
" 分屏窗口移动, Smart way to move between windowsmap
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>h <C-w>h
nnoremap <Space>l <C-w>l

" 调整窗口大小
nnoremap <Space>H <C-W>5<
nnoremap <Space>L <C-W>5>
nnoremap <Space>J :resize +5<CR>
nnoremap <Space>K :resize -5<CR>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" 去掉搜索高亮
noremap <leader>/ :nohls<CR>

" 括号跳转
noremap <C-g> %

" vim Tag操作
" <leader> + 1,2,3,4,5,6,7,8,9切换tab
function! TabPos_ActivateBuffer(num)
    let s:count = a:num
    exe "tabfirst"
    exe "tabnext" s:count
endfunction

function! TabPos_Initialize()
for i in range(1, 9)
        exe "map <leader>" . i . " :call TabPos_ActivateBuffer(" . i . ")<CR>"
    endfor
    exe "map <leader>0 :call TabPos_ActivateBuffer(10)<CR>"
endfunction

autocmd VimEnter * call TabPos_Initialize()

" vim下查看man page
nmap <Space>m :Man 

call plug#begin()
" Google Material 主题
" Plug 'jdkanani/vim-material-theme'
" Plug 'tomasr/molokai'
" emacs dark主题
" Plug 'liuchengxu/space-vim-dark'
Plug 'morhetz/gruvbox'
if (has("termguicolors"))
  set termguicolors
endif

Plug 't9md/vim-choosewin'                               " 快速切换窗口
Plug 'bronson/vim-trailing-whitespace'                  " 突出行尾空格
Plug 'tyru/open-browser.vim'                            " url跳转
Plug 'junegunn/vim-emoji'                               " emoji表情
Plug 'SvichkarevAnatoly/marshak.vim'                    " 翻译
Plug '/usr/local/opt/fzf'                               " fzf
Plug 'junegunn/fzf.vim'                                 " fzf
Plug 'rking/ag.vim'                                     " Ag全文搜索
Plug 'Chun-Yang/vim-action-ag'                          " Ag搜索
Plug 'mhinz/vim-startify'                               " 欢迎界面
Plug 'itchyny/vim-cursorword'                           " cursor
Plug 'terryma/vim-multiple-cursors'                     " 光标多选
Plug 'rizzatti/dash.vim'                                " Dash支持
Plug 'ekalinin/Dockerfile.vim'                          " dockerfile语法支持
Plug 'cespare/vim-toml' | Plug 'maralla/vim-toml-enhance' " toml语法支持
Plug 'solarnz/thrift.vim'                               " thrift语法支持
Plug 'pearofducks/ansible-vim'                          " ansible语法支持
Plug 'elixir-lang/vim-elixir', { 'do': './install.sh' } " elixir支持
Plug 'slashmili/alchemist.vim'                          " elixir支持
Plug 'kh3phr3n/python-syntax'                           " python语法高亮支持
Plug 'davidhalter/jedi-vim'                             " python代码跳转
Plug 'rust-lang/rust.vim'                               " Rust支持
Plug 'racer-rust/vim-racer'                             " Rust自动补全, racer
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }     " golang支持
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'ncm2/ncm2'                                        " 异步补全插件
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'yuki-ycino/ncm2-dictionary'
Plug 'ncm2/ncm2-pyclang'                                " c异步补全
Plug 'ncm2/ncm2-jedi'                                   " python异步补全
Plug 'ncm2/ncm2-racer'                                  " rust异步补全
Plug 'ncm2/ncm2-go'                                     " go异步补全
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'           " vimscript异步补全
Plug 'ncm2/ncm2-path'                                   " 路径补全
Plug 'itchyny/lightline.vim'                            " 轻量级状态栏优化插件
Plug 'ctrlpvim/ctrlp.vim'                               " 查找文件名, 支持模糊匹配
" 树形文件查看插件
Plug 'scrooloose/nerdtree',                         { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin',                 { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight',     { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'                               " 状态栏支持显示当前git分支
Plug 'majutsushi/tagbar'                                " 显示文件中的类、函数、变量
Plug 'maximbaz/lightline-ale'                           " lightline的ale插件, 用于展示lint信息
Plug 'w0rp/ale'                                         " 异步语法检查
Plug 'luochen1990/rainbow'                              " 括号配对显示
Plug 'lilydjwg/colorizer'                               " 颜色显示器
Plug 'troydm/zoomwintab.vim'                            " 放大vim中的一个窗口
Plug 'scrooloose/nerdcommenter'                         " 快速注释
Plug 'Raimondi/delimitMate'                             " 自动补全单引号，双引号等
" Plug 'tpope/vim-surround'                               " 括号编辑
Plug 'docunext/closetag.vim'                            " 自动补全html/xml标签
Plug 'easymotion/vim-easymotion'                        " 快速跳转
Plug 'airblade/vim-gitgutter'                           " 实时展示文件修改的行
Plug 'Yggdroot/indentLine'                              " 缩进指示

call plug#end()

let g:terminal_color_0 = '#282828'
let g:terminal_color_8 = '#928374'

" neurtral_red + bright_red
let g:terminal_color_1 = '#cc241d'
let g:terminal_color_9 = '#fb4934'

" neutral_green + bright_green
let g:terminal_color_2 = '#98971a'
let g:terminal_color_10 = '#b8bb26'

" neutral_yellow + bright_yellow
let g:terminal_color_3 = '#d79921'
let g:terminal_color_11 = '#fabd2f'

" neutral_blue + bright_blue
let g:terminal_color_4 = '#458588'
let g:terminal_color_12 = '#83a598'

" neutral_purple + bright_purple
let g:terminal_color_5 = '#b16286'
let g:terminal_color_13 = '#d3869b'

" neutral_aqua + faded_aqua
let g:terminal_color_6 = '#689d6a'
let g:terminal_color_14 = '#8ec07c'

" light4 + light1
let g:terminal_color_7 = '#a89984'
let g:terminal_color_15 = '#ebdbb2'

" ========================================================================================
" ========================================插件配置========================================
" ========================================================================================

" choosewin {{{
nmap <Space>s <Plug>(choosewin)
" }}}
" open-browser.vim {{{
let g:netrw_nogx = 1
" 如果光标附近是url, 则访问, 如果不是, 则搜索
nmap <Space>o <Plug>(openbrowser-smart-search)
" 如果光标附近是url, 则访问, 如果不是, 则搜索
vmap <Space>o <Plug>(openbrowser-smart-search)
" 手动搜索
nmap <Space>f :OpenBrowserSearch 
" }}}

" vim-emoji {{{
set completefunc=emoji#complete
" }}}

" marshak.vim {{{
let g:trans_source_lang = 'en'
let g:trans_target_lang = 'zh'

function! TransToEnglish(text)
    let l:quatation_text = "\"" . a:text . "\""
    let l:options =  g:trans_target_lang . ":" . g:trans_source_lang . " -b "
    let l:command = g:trans_command . " " . l:options . l:quatation_text
    " Run trans and get translation
    silent let l:ret = system(l:command)
    " Remove ^@
    let l:ret = substitute(l:ret, '[[:cntrl:]]', '', 'g')
    echom l:ret
endfunction

function! TransToChinese(text)
    let l:quatation_text = "\"" . a:text . "\""
    let l:options =  g:trans_source_lang . ":" . g:trans_target_lang . " -b "
    let l:command = g:trans_command . " " . l:options . l:quatation_text
    " Run trans and get translation
    silent let l:ret = system(l:command)
    " Remove ^@
    let l:ret = substitute(l:ret, '[[:cntrl:]]', '', 'g')
    echom l:ret
endfunction

function! ToEnglish()
    let word = input("请输入中文(ZH - EN): ")
    redraw!
    call TransToEnglish(word)
endfunction

function! ToChinese()
    let word = input("请输入英文(EN - ZH): ")
    redraw!
    call TransToChinese(word)
endfunction

" 翻译当前单词
nnoremap <Space>t :call TransWord()<cr>
" 翻译当前行
nnoremap <Space>r :call TransLine()<cr>
" 翻译选中区域
vnoremap <Space>s :call TransSelected()<cr>
" 输入中文翻译成英文
nnoremap <Space>c :call ToEnglish()<cr>
" 输入英文翻译成中文
nnoremap <Space>e :call ToChinese()<cr>
" }}}

" ag.vim {{{
nmap <leader>s :Ag 
let g:ag_working_path_mode="r"
let g:ag_prg="Ag --vimgrep --smart-case"
let g:ag_highlight=1
" }}}

" vim-action-ag {{{
let g:vim_action_ag_escape_chars = '#%.^$*+?()[{}]\\|'
nmap ss <Plug>AgActionWord
vmap ss <Plug>AgActionVisual
" }}}

" fzf.vim {{{
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Mapping selecting mappings
nmap <C-g> :FZF<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
" 搜索单词, 补全后插入
imap <c-w> <plug>(fzf-complete-word)
" 搜索路径, 补全后插入
imap <c-p> <plug>(fzf-complete-path)
" 搜索当前文件的每行内容, 补全后插入
imap <c-f> <plug>(fzf-complete-line)
" 搜索路径, 补全后插入
imap <c-s> <plug>(fzf-complete-file-ag)

" 根据光标位置的字母进行自动补全
inoremap <expr> <C-c> fzf#vim#complete#word({'left': '15%'})
" }}}

" vim-startify {{{
let g:startify_custom_header = [
            \'',
            \'',
            \'',
            \'           _____      _           _   _         __     ___           ',
            \'          | ____|_ __(_) ___     | \ | | ___  __\ \   / (_)_ __ ___  ',
            \'          |  _| | (__| |/ __|____|  \| |/ _ \/ _ \ \ / /| | -_ ` _ \ ',
            \'          | |___| |  | | (_|_____| |\  |  __/ (_) \ V / | | | | | | |',
            \'          |_____|_|  |_|\___|    |_| \_|\___|\___/ \_/  |_|_| |_| |_|',
            \'                      [ Eric-NeoVim written by Eric Zhang ]',
            \ ]
let g:startify_list_order = [
            \ ['   Recent Files:'],
            \ 'files',
            \ ['   Project:'],
            \ 'dir',
            \ ['   Sessions:'],
            \ 'sessions',
            \ ['   Bookmarks:'],
            \ 'bookmarks',
            \ ['   Commands:'],
            \ 'commands',
            \ ]
" }}}

" vim-multiple-cursors {{{
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" }}}

" vim-fugitive
nmap <Space>g :G

" dash.vim {{{
nmap <silent> <leader>t <Plug>DashSearch
nmap <silent> <leader>y <Plug>DashGlobalSearch
" }}}

" vim-elixir {{{
let g:alchemist#elixir_erlang_src = "~/elixir_otp"
let g:alchemist_tag_map = '<C-q>'
let g:alchemist_tag_stack_map = '<C-w>'
let g:alchemist_iex_term_size = 15
let g:alchemist_iex_term_split = 'split'
nmap gx :IEx 
nmap mi :Mix 
" }}}

" python-syntax {{{
let python_self_cls_highlight = 1
let python_no_parameter_highlight = 1
let python_no_operator_highlight = 1
" let python_highlight_all = 1
" }}}

" jedi-vim {{{
let g:jedi#completions_enabled = 0  " 关闭自动补全
let jedi#use_tabs_not_buffers = 1   " 使用tab打开跳转函数
let g:jedi#popup_on_dot = 0

let g:jedi#goto_command = "<C-w>"           " 跳转到定义处
let g:jedi#documentation_command = "K"      " 相关文档
" }}}

" rust.vim {{{
let g:rustfmt_autosave = 0
au FileType rust nmap rf :RustFmt<CR>
au FileType rust nmap rr :RustRun<CR>
" }}}

" vim-racer {{{
set hidden
let g:racer_cmd = "/Users/eric/.cargo/bin/racer"
" 显示函数定义
let g:racer_experimental_completer = 1
" 跳转到定义
au FileType rust nmap <C-q> <Plug>(rust-def)
" 跳转到定义, 新tab显示
au FileType rust nmap <C-w> :tab split<CR>:call racer#GoToDefinition()<CR>
" 跳转到定义, 横屏显示
" au FileType rust nmap <C-w> <Plug>(rust-def-split)
" 跳转到定义, 竖屏显示
au FileType rust nmap <C-e> <Plug>(rust-def-vertical)
" 跳转到文档
au FileType rust nmap <S-k> <Plug>(rust-doc)
" }}}

" vim-go {{{
let g:go_fmt_autosave = 0
let g:go_def_mapping_enabled = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_list_type = "quickfix"

" go run相关配置
au FileType go nnoremap <C-w> :<C-U>call go#def#Jump("tab")<CR>
au FileType go nmap gf :GoFmt<CR>
au FileType go nmap gt <Plug>(go-run-tab)
au FileType go nmap gs <Plug>(go-run-split)
au FileType go nmap gv <Plug>(go-run-vertical)

au FileType go nmap gb <Plug>(go-build)
au FileType go nmap gt <Plug>(go-test)
au FileType go nmap gc <Plug>(go-coverage)
" }}}

" ncm2 {{{
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" set shortmess+=c
inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-m> pumvisible() ? "\<C-p>" : "\<C-m>"
" }}}

" ncm2-pyclang {{{
" path to directory where libclang.so can be found
let g:ncm2_pyclang#library_path = '/usr/local/Cellar/llvm/5.0.1/lib'
autocmd FileType c,cpp nnoremap <buffer> <C-w> :<c-u>call ncm2_pyclang#goto_declaration()<cr>
" }}}

" vim-devicons {{{
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
" }}}

" nerdtree 配置 {{{
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

let NERDTreeIgnore                    = ['.sass-cache$', 'tmp$', '\.pyc$', '__pycache__', '\.DS_Store', '\.cache', '\.idea', '\.o$']
let NERDTreeSortOrder                 = ['\/$', '*']
let NERDTreeWinPos                    = 'left'
let NERDTreeWinSize                   = 20
let NERDTreeChDirMode                 = 2
let NERDTreeDirArrows                 = 1
let NERDTreeMinimalUI                 = 1
let NERDTreeMouseMode                 = 2
let NERDTreeShowHidden                = 1
let NERDTreeQuitOnOpen                = 0
let NERDTreeHijackNetrw               = 1
let NERDTreeSortHiddenFirst           = 1
let NERDTreeAutoDeleteBuffer          = 1
let NERDTreeCaseSensitiveSort         = 1
let NERDTreeHighlightCursorline       = 1
let NERDTreeCascadeOpenSingleChildDir = 1
" D/d 分屏打开文件
let g:NERDTreeMapOpenSplit = 'D'
let g:NERDTreeMapOpenVSplit = 'd'
" }}}

" vim-nerdtree-syntax-highlight配置 {{{
let s:brown = '905532'
let s:aqua =  '3AFFDB'
let s:blue = '689FB6'
let s:darkBlue = '44788E'
let s:purple = '834F79'
let s:red = 'AE403F'
let s:beige = 'F5C06F'
let s:yellow = 'F09F17'
let s:orange = 'D4843E'
let s:darkOrange = 'F16529'
let s:pink = 'CB6F6F'
let s:salmon = 'EE6E73'
let s:green = '8FAA54'
let s:lightGreen = '31B53E'
let s:white = 'FFFFFF'
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['c'] = s:yellow
let g:NERDTreeExtensionHighlightColor['python'] = s:lightGreen
let g:NERDTreeExtensionHighlightColor['rust'] = s:orange

let g:NERDTreeExactMatchHighlightColor = {}
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['.ipynb'] = s:purple
let g:NERDTreeExactMatchHighlightColor['Makefile'] = s:brown

let g:NERDTreePatternMatchHighlightColor = {}
let g:NERDTreePatternMatchHighlightColor['.*.h$'] = s:pink
let g:NERDTreePatternMatchHighlightColor['.*.rs$'] = s:salmon
let g:NERDTreePatternMatchHighlightColor['.*.py$'] = s:lightGreen
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red
let g:NERDTreePatternMatchHighlightColor['.*.toml$'] = s:aqua
let g:NERDTreePatternMatchHighlightColor['.*.yml$'] = s:darkOrange

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" }}}

" nerdtree-git-plugin {{{
let g:NERDTreeIndicatorMapCustom = {
    \ 'Modified'  : '✹ ',
    \ 'Staged'    : '✚ ',
    \ 'Untracked' : '✭ ',
    \ 'Renamed'   : '➜ ',
    \ 'Unmerged'  : '═ ',
    \ 'Deleted'   : '✖ ',
    \ 'Dirty'     : '✗ ',
    \ 'Clean'     : '✔︎ ',
    \ 'Unknown'   : '? '
    \ }
" }}}

" lightline配置 {{{
let g:lightline#ale#indicator_ok = '☻'
let g:lightline#ale#indicator_errors = ''
let g:lightline#ale#indicator_warnings = ''
let g:lightline = {
  \ 'colorscheme': 'DraculaPlus',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'easyfilename' ] ],
  \   'right': [ ['linter_errors', 'linter_warnings', 'linter_ok'], ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ]
  \ },
  \ 'component_function': {
  \   'fugitive': 'LightlineFugitive',
  \   'filename': 'LightlineFilename',
  \   'easyfilename': 'LightlineEasyFilename',
  \   'fileformat': 'LightlineFileformat',
  \   'filetype': 'LightlineFiletype',
  \   'fileencoding': 'LightlineFileencoding',
  \   'mode': 'LightlineMode',
  \   'percent': 'MyLightLinePercent',
  \   'lineinfo': 'MyLightLineLineInfo'
  \ },
  \ 'component_expand': {
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_type': {
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \},
  \ 'separator': { 'left': '',  'right': ''},
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

function! MyLightLinePercent()
  if &ft !=? 'nerdtree' && &ft !=? 'tagbar'
    return line('.') * 100 / line('$') . '%'
  else
    return ''
  endif
endfunction

function! MyLightLineLineInfo()
  if &ft !=? 'nerdtree'
    return line('.').':'. col('.')
  else
    return ''
  endif
endfunction

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '♕' : &modifiable ? '' : '♛'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? ' ' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:h')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? '' :
        \ fname =~ '__Tagbar__' ? '' :
        \ fname =~ 'NERD_tree' ? '' :
        \ fname =~ 'FZF'? 'FZF Search' :
        \ fname == '.' ?  '' : fname
endfunction

function! LightlineEasyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? '' :
        \ fname =~ '__Tagbar__' ? '' :
        \ fname =~ 'NERD_tree' ? '' :
        \ fname =~ 'FZF'? '' :
        \ &ft == 'unite' ? '' :
        \ ('' != LightlineReadonly() ? LightlineReadonly() : '') .
        \ ('' != fname ? fname : '') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|NERD' && exists('*fugitive#head')
      let mark = ''
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname =~ '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

" let g:vimfiler_force_overwrite_statusline = 0
" let g:vimshell_force_overwrite_statusline = 0
let g:unite_force_overwrite_statusline = 0
" }}}

" strlp.vim {{{
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
" }}}

" Tagbar {{{
nmap <F9> :TagbarToggle<CR>
let g:tagbar_map_showproto = '<Space>p'
inoremap <F9> <ESC>:TagbarToggle<CR>
let g:tagbar_width=30	"窗口宽度的设置
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

let g:tagbar_type_rust = {
\ 'ctagstype' : 'rust',
\ 'kinds' : [
    \'m:modules,module names',
    \'T:types,type definitions',
    \'c:consts,static constants',
    \'g:enum,enumeration names',
    \'s:structure names',
    \'t:traits,traits',
    \'i:impls,trait implementations',
    \'f:functions,function definitions',
    \'d:macros,macro definitions',
\]
\ }

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_elixir = {
    \ 'ctagstype': 'elixir',
    \ 'kinds': [
        \ 'f:functions:0:0',
        \ 'c:callbacks:0:0',
        \ 'd:delegates:0:0',
        \ 'e:exceptions:0:0',
        \ 'i:implementations:0:0',
        \ 'a:macros:0:0',
        \ 'o:operators:0:0',
        \ 'm:modules:0:0',
        \ 'p:protocols:0:0',
        \ 'r:records:0:0'
    \ ],
    \ 'sro': '.',
    \ 'kind2scope': {
        \ 'm': 'modules'
    \ },
    \ 'scope2kind': {
        \ 'modules': 'm'
    \ }
\ }
" }}}

" w0rp/ale {{{
let g:ale_sign_column_always = 1    " 保持侧边栏可见
let g:ale_set_highlights = 1
let g:ale_sign_error = ''            " 错误符号
let g:ale_sign_warning = ''          " 警告符号
let g:ale_sign_style_error = ''      " 风格错误符号
let g:ale_sign_style_warning = ''    " 风格警告符号
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_pylint_use_global = 1
let g:ale_python_flake8_use_global = 1
let g:ale_linters = {'rust': ['cargo', 'rustc'], 'go': ['go build', 'golint', 'go vet', 'gofmt']}
let g:ale_rust_ignore_error_codes = ['E0432', 'E0433']
let g:ale_list_window_size = 6
" 关闭ale自动检查语法(golang项目在使用swig封装之后, 开启自动检查会很卡..)
" let g:ale_lint_on_text_changed = 0
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_save = 0
" let g:ale_lint_on_filetype_changed = 0
" nnoremap <Space>b :ALELint<CR>
nnoremap <C-l> :lopen<CR>
" }}}

" luochen1990/rainbow {{{
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['magenta', 'powderblue', 'lightcoral', 'greenyellow'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['gold', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
" }}}

" zoomwintab {{{
let g:zoomwintab_remap = 0
let g:zoomwintab_hidetabbar = 0
nnoremap <Space>w :ZoomWinTabToggle<CR>
" }}}

" 快速注释nerdcommenter {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_python = 1
let g:NERDAltDelims_go = 1
let g:NERDCustomDelimiters = {
    \ 'rust': { 'left': '//' },
    \ 'c': { 'left': '//' },
    \ 'go': { 'left': '//'},
\ }
" }}}

" vim-easymotion {{{
let g:EasyMotion_smartcase = 1
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
" }}}

" 实时展示文件修改的行 vim-gitgutter {{{
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 1
nnoremap <leader>gs :GitGutterToggle<CR>
nmap ]n <Plug>GitGutterNextHunk
nmap [n <Plug>GitGutterPrevHunk
" }}}

" 缩进指示indentLine {{{
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1
" 解决md以及json文件下因为conceallevel导致的引号等符号省略问题
autocmd FileType markdown let g:indentLine_enabled = 0
autocmd FileType json let g:indentLine_enabled = 0
"}}}

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
" colorscheme material-theme
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_invert_selection = 0
colorscheme gruvbox
" let g:space_vim_dark_background = 233
" colorscheme space-vim-dark
" hi Comment cterm=italic
