set encoding=utf-8
" 显式设置当前脚本的编码方式以支持多字节字符
scriptencoding utf-8

let g:python_host_prog='/usr/local/bin/python'

" 设置leader键
let mapleader=";"

" ##########rust设置###########
" {{{
let g:rustfmt_autosave = 1
set hidden
" let g:racer_cmd = "<path-to-racer>/target/release/racer"
let g:racer_cmd = "/Users/eric/.cargo/bin/racer"
let $RUST_SRC_PATH = "/Users/eric/rustc-1.10.0/src"
" let $RUST_SRC_PATH = "<path-to-rust-srcdir>/src/"
" }}}


" 语法高亮
syntax on

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
set nowrap

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

" 命令行模式下ctrl-a 到行首, ctrl-e 到行尾
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

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
map <C-c> y  
map <C-X> d
map <C-v> p
map <C-A> <Esc>ggVG  

" ##############分屏##############
" 分屏窗口移动, Smart way to move between windowsmap <C-j> <C-W>j
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
" nnoremap <C-j> <C-W>j
" nnoremap <C-k> <C-W>k
" nnoremap <C-h> <C-W>h
" nnoremap <C-l> <C-W>l

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" 去掉搜索高亮
noremap <leader>/ :nohls<CR>

let python_highlight_all = 1

call plug#begin()

" Google Material 主题
Plug 'jdkanani/vim-material-theme'

" python支持
Plug 'davidhalter/jedi-vim'
Plug 'hdima/python-syntax'
" let python_highlight_all = 1 

" golang支持
Plug 'fatih/vim-go'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_list_type = "quickfix"

" go run相关配置
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)

au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" 自动补全
Plug 'Valloric/YouCompleteMe'
" YouCompleteMe {{{
" let g:ycm_python_binary_path = 'python'
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
" 开启语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 跳转到定义处, 分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap gd :YcmCompleter GoToDeclaration<CR>

" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
" old version
if !empty(glob("~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif
" new version
if !empty(glob("~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif
" }}}

" 树形文件查看插件
Plug 'scrooloose/nerdtree'

map <C-n> :NERDTreeToggle<CR>

let NERDTreeIgnore                    = ['.sass-cache$', 'tmp$', '.pyc$', '__pycache__']
let NERDTreeSortOrder                 = ['\/$', '*']
let NERDTreeWinPos                    = 'left'
let NERDTreeWinSize                   = 20
let NERDTreeChDirMode                 = 2
let NERDTreeDirArrows                 = 1
let NERDTreeMinimalUI                 = 1
let NERDTreeMouseMode                 = 2
let NERDTreeShowHidden                = 0
let NERDTreeQuitOnOpen                = 0
let NERDTreeHijackNetrw               = 1
let NERDTreeSortHiddenFirst           = 1
let NERDTreeAutoDeleteBuffer          = 1
let NERDTreeCaseSensitiveSort         = 1
let NERDTreeHighlightCursorline       = 1
let NERDTreeCascadeOpenSingleChildDir = 1
" s/v 分屏打开文件
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'd'

" 状态栏支持显示当前git分支
Plug 'tpope/vim-fugitive'

" 轻量级状态栏优化插件
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '',  'right': ''},
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" Airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme="base16"

" let g:airline_powerline_fonts = 1

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = '❯'
" let g:airline_right_sep = '◀'
" let g:airline_right_alt_sep = '❮'
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
    " 是否打开tabline
    " let g:airline#extensions#tabline#enabled = 1

" 查找文件名, 支持模糊匹配
Plug 'ctrlpvim/ctrlp.vim'
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

" 全局搜索某个特定的字符
Plug 'dyng/ctrlsf.vim'
nmap <leader>s :CtrlSF
nmap <leader>o :CtrlSFOpen<CR>
nmap ss :CtrlSF <C-R><C-W><CR>
vnoremap ss y:CtrlSF <C-R>"<CR>
let g:ctrlsf_default_root = 'project'
" 显示文件中的类、函数、变量
Plug 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_width=30	"窗口宽度的设置
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

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

" XML
Plug 'othree/xml.vim'

" HTML
Plug 'othree/html5.vim'

" Rust
Plug 'rust-lang/rust.vim'
" Rust自动补全, racer
Plug 'racer-rust/vim-racer'

" 语法检查
Plug 'scrooloose/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" 每次保存的时候做检查
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_open = 1
" 设置错误符号
let g:syntastic_error_symbol='✘'
" 设置警告符号
let g:syntastic_warning_symbol='⚠'
" 设置风格错误|警告符号
let g:syntastic_style_error_symbol = '➔'
let g:syntastic_style_warning_symbol = '➜'
" python语法检查
let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['flake8', 'pyflakes', 'pep8']
" go语法检查
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['go','python', 'rust'] }

" 高亮
let g:syntastic_enable_highlighting=1

" JSON
Plug 'elzr/vim-json', {'for': 'json'}

" Markdown
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
let g:vim_markdown_toc_autofit      = 1
let g:vim_markdown_frontmatter      = 1
let g:vim_markdown_json_frontmatter = 1 " 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

" 快速注释
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_python = 1
let g:NERDAltDelims_rust = 1


" 自动补全单引号，双引号等
Plug 'Raimondi/delimitMate'
" 自动补全html/xml标签
Plug 'docunext/closetag.vim'

" 快速跳转
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>j <Plug>(easymotion-j)
map <Leader><leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)

" 实时展示文件修改的行
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 1
nnoremap <leader>gs :GitGutterToggle<CR>
nmap ]n <Plug>GitGutterNextHunk
nmap [n <Plug>GitGutterPrevHunk

call plug#end()

" 主题
set background=dark
colorscheme material-theme

" TODO: 设置内置终端的颜色
let g:terminal_color_0  = '#282a36'
let g:terminal_color_1  = '#ff5555'
let g:terminal_color_2  = '#50fa7b'
let g:terminal_color_3  = '#f1fa8c'
let g:terminal_color_4  = '#bd93f9'
let g:terminal_color_5  = '#ff79c6'
let g:terminal_color_6  = '#8be9fd'
let g:terminal_color_7  = '#50fa7b'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'

" ############语言############
" pythonsyntax {{{
let python_highlight_all = 1
" }}}

