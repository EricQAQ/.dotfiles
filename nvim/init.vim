" 显式设置当前脚本的编码方式以支持多字节字符
scriptencoding utf-8
set encoding=utf-8

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
" nnoremap <C-j> <C-W>j
" nnoremap <C-k> <C-W>k
" nnoremap <C-h> <C-W>h
" nnoremap <C-l> <C-W>l

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

Plug 'junegunn/vim-emoji'                               " emoji表情
Plug 'SvichkarevAnatoly/marshak.vim'                    " 翻译
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'     " fuzzy
Plug 'mhinz/vim-startify'                               " 欢迎界面
Plug 'itchyny/vim-cursorword'                           " cursor
Plug 'terryma/vim-multiple-cursors'                     " 光标多选
Plug 'rizzatti/dash.vim'                                " Dash支持
Plug 'ekalinin/Dockerfile.vim'                          " dockerfile语法支持
Plug 'cespare/vim-toml'                                 " toml语法支持
Plug 'Rykka/riv.vim'                                    " rst语法支持
Plug 'solarnz/thrift.vim'                               " thrift语法支持
Plug 'pearofducks/ansible-vim'                          " ansible语法支持
Plug 'elixir-lang/vim-elixir', { 'do': './install.sh' } " elixir支持
Plug 'slashmili/alchemist.vim'                          " elixir支持
Plug 'davidhalter/jedi-vim'                             " python支持
Plug 'kh3phr3n/python-syntax'                           " python支持
Plug 'rust-lang/rust.vim'                               " Rust支持
Plug 'racer-rust/vim-racer'                             " Rust自动补全, racer
Plug 'fatih/vim-go'                                     " golang支持
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'Valloric/YouCompleteMe'                           " 自动补全
Plug 'itchyny/lightline.vim'                            " 轻量级状态栏优化插件
Plug 'ctrlpvim/ctrlp.vim'                               " 查找文件名, 支持模糊匹配
Plug 'dyng/ctrlsf.vim'                                  " 全局搜索某个特定的字符
" 树形文件查看插件
Plug 'scrooloose/nerdtree',                         { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin',                 { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight',     { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'                               " 状态栏支持显示当前git分支
Plug 'majutsushi/tagbar'                                " 显示文件中的类、函数、变量
Plug 'othree/xml.vim'                                   " XML
Plug 'othree/html5.vim'                                 " HTML
Plug 'scrooloose/syntastic'                             " 语法检查
Plug 'troydm/zoomwintab.vim'                            " 放大vim中的一个窗口
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}     " Markdown
Plug 'scrooloose/nerdcommenter'                         " 快速注释
Plug 'Raimondi/delimitMate'                             " 自动补全单引号，双引号等
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
" vim-emoji {{{
set completefunc=emoji#complete
" }}}

" marshak.vim {{{
let g:trans_source_lang = 'en'
let g:trans_target_lang = 'zh'

function! TransToEnglish(text)
    let l:quatation_text = "\"" . a:text . "\""
    let l:options =  'zh' . ":" . 'en' . " -b "
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
    call TransToEnglish(word)
endfunction

nnoremap <Space>t :call TransWord()<cr>         " 翻译当前单词
nnoremap <Space>r :call TransLine()<cr>         " 翻译当前行
vnoremap <Space>s :call TransSelected()<cr>     " 翻译选中区域
nnoremap <Space>c :call ToEnglish()<cr>         " 输入中文翻译成英文
nnoremap <Space>e :call ToChinese()<cr>         " 输入英文翻译成中文
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
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
" }}}

" vim-startify {{{
let g:startify_custom_header = [
            \'',
            \'          _____      _           _   _         __     ___            ',
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
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" }}}

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
nmap ex :IEx 
nmap mi :Mix 
" }}}

" python-syntax {{{
let python_self_cls_highlight = 1
let python_no_parameter_highlight = 1
let python_no_operator_highlight = 1
" let python_highlight_all = 1
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
" 跳转到定义, 横屏显示
au FileType rust nmap <C-w> <Plug>(rust-def-split)
" 跳转到定义, 竖屏显示
au FileType rust nmap <C-e> <Plug>(rust-def-vertical)
" 跳转到文档
au FileType rust nmap <C-p> <Plug>(rust-doc)
" }}}

" vim-go {{{
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
" }}}

" YouCompleteMe {{{
let g:ycm_key_list_select_completion = ['<TAB>', '<C-N>']
let g:ycm_key_list_previous_completion = ['<C-M>']
let g:ycm_show_diagnostics_ui = 0
let g:ycm_rust_src_path = 
    \ "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
" 开启语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 跳转到定义处, 在新tab打开
let g:ycm_goto_buffer_command = 'new-tab'
nnoremap <C-w> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-q> :YcmCompleter GoToDeclaration<CR>

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

" vim-devicons {{{
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
" }}}

" nerdtree 配置 {{{
map <C-n> :NERDTreeToggle<CR>

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
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'easyfilename' ] ],
  \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
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
  \   'syntastic': 'SyntasticStatuslineFlag',
  \ },
  \ 'component_type': {
  \   'syntastic': 'error',
  \ },
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
  return &ft =~ 'help' ? '' : &modified ? '✎' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:p')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname =~ '__Tagbar__' ? g:lightline.fname :
        \ fname =~ 'NERD_tree' ? '' :
        \ fname =~ 'FZF'? 'FZF Search' :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineEasyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? '' :
        \ fname =~ '__Tagbar__' ? '' :
        \ fname =~ 'NERD_tree' ? '' :
        \ fname =~ 'FZF'? '' :
        \ &ft == 'unite' ? '' :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
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

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp,*.rs,*.py call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
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

" ctrlsf.vim {{{
let g:ctrlsf_ackprg = 'ag'  " 使用Ag, 加快搜索速度
nmap <leader>s :CtrlSF
nmap <leader>o :CtrlSFOpen<CR>
nmap ss :CtrlSF <C-R><C-W><CR>
vnoremap ss y:CtrlSF <C-R>"<CR>
let g:ctrlsf_default_root = 'project'
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
    \'T:types,type definitions',
    \'f:functions,function definitions',
    \'g:enum,enumeration names',
    \'s:structure names',
    \'m:modules,module names',
    \'c:consts,static constants',
    \'t:traits,traits',
    \'i:impls,trait implementations',
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

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" 每次自动调用:SyntasticSetLocList, 将错误覆盖
let g:syntastic_always_populate_loc_list=1
" 自动拉起|关闭错误窗口，不需要手动调用:Errors
let g:syntastic_auto_loc_list = 0
" 每次保存的时候做检查
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_open = 1
" 设置错误符号
let g:syntastic_error_symbol='✘'
" 设置警告符号
let g:syntastic_warning_symbol='⚠'
" 设置风格错误|警告符号
let g:syntastic_style_error_symbol = '➔'
let g:syntastic_style_warning_symbol = '➜'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['go','python', 'rust', 'c'] }
" python语法检查
let g:syntastic_python_checkers=['python', 'flake8', 'pyflakes', 'pep8']
" go语法检查
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
" rust语法检查
let g:syntastic_rust_checkers = ['rustc', 'rustfmt']
" C语法检查
let g:syntastic_c_compiler = ['clang']
let g:syntastic_c_checkers = ['clang_check', 'splint', 'make']

" 高亮
let g:syntastic_enable_highlighting=1
" 合并错误输出
let g:syntasitc_aggregate_errors = 1

" 调出错误框
nmap <leader>e :Errors<CR>
" 关闭错误框
nmap <leader>c :lclose<CR>
" 跳转到下一个错误
nmap <leader>[ :lnext<CR>
" 跳转到上一个错误
nmap <leader>] :lprevious<CR>
" }}}

" zoomwintab {{{
let g:zoomwintab_remap = 0
let g:zoomwintab_hidetabbar = 0
nnoremap <Space>w :ZoomWinTabToggle<CR>
" }}}

" vim-markdown {{{
let g:vim_markdown_toc_autofit      = 1
let g:vim_markdown_frontmatter      = 1
let g:vim_markdown_json_frontmatter = 1 " 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
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
"}}}

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
" colorscheme material-theme
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_sign_column = 'bg0'
colorscheme gruvbox
" let g:space_vim_dark_background = 233
" colorscheme space-vim-dark
" hi Comment cterm=italic
