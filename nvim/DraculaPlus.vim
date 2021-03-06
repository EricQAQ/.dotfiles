" =============================================================================
" Filename: autoload/lightline/colorscheme/DraculaPlus.vim
" Author: Eric Zhang
" License: MIT License
" Last Change: 2017/10/27 16:42:03.
" =============================================================================

let s:black = [ '#282a36', 235 ]
let s:gray = [ '#44475a', 236 ]
let s:white = [ '#f8f8f2', 231 ]
let s:darkblue = [ '#6272a4', 61 ]
let s:cyan = [ '#8be9fd', 117 ]
let s:green = [ '#50fa7b', 84 ]
let s:lightgreen = [ '#C0FF3E', 50 ]
let s:orange = [ '#ffb86c', 215 ]
let s:purple = [ '#bd93f9', 141 ]
let s:red = [ '#ff79c6', 212 ]
let s:yellow = [ '#f1fa8c', 228 ]
let s:pink = [ '#EE7AE9', 100 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:black, s:purple ], [ s:cyan, s:gray ] ]
let s:p.normal.right = [ [ s:black, s:purple ], [ s:white, s:darkblue ] ]
let s:p.inactive.right = [ [ s:black, s:gray ], [ s:white, s:black ] ]
let s:p.inactive.left =  [ [ s:cyan, s:black ], [ s:white, s:black ] ]
let s:p.insert.left = [ [ s:black, s:green ], [ s:cyan, s:gray ] ]
let s:p.replace.left = [ [ s:black, s:red ], [ s:cyan, s:gray ] ]
let s:p.visual.left = [ [ s:black, s:orange ], [ s:cyan, s:gray ] ]
let s:p.normal.middle = [ [ s:pink, s:gray ] ]
let s:p.inactive.middle = [ [ s:white, s:gray ] ]
let s:p.tabline.left = [ [ s:darkblue, s:gray ] ]
let s:p.tabline.tabsel = [ [ s:cyan, s:black ] ]
let s:p.tabline.middle = [ [ s:darkblue, s:gray ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:black, s:lightgreen ] ]
let s:p.normal.warning = [ [ s:black, s:yellow ] ]

let g:lightline#colorscheme#DraculaPlus#palette = lightline#colorscheme#flatten(s:p)
