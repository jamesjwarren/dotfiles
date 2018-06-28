set backspace=indent,eol,start

" Vim-plug Plugin Manager https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Theme
Plug 'joshdick/onedark.vim' " (https://github.com/joshdick/onedark.vim)
Plug 'vim-airline/vim-airline' " (https://github.com/vim-airline/vim-airline)

" IDE Features
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'             " Project draw
Plug 'Yggdroot/indentLine'             " Indentation
Plug 'tpope/vim-fugitive'              " Git interface

" Code Completion
Plug 'Valloric/YouCompleteMe', {
    \ 'do': './install.py --clang-completer --gocode-completer --js-completer'
    \ }
Plug 'ervandew/supertab' " For code completion

" Language Support
Plug 'editorconfig/editorconfig-vim'           " Language syntax overrides
Plug 'fatih/vim-go', { 'for': 'go' }           " Go

" Initialize plugin system
call plug#end()

"
" Theme
"
let g:onedark_termcolors=16
let g:airline_theme='onedark'
syntax on
colorscheme onedark

"
" Indent Line
"
let g:indentLine_color_term = 8
let g:indentLine_char = '¦'

"
" VimFiler
"
" <tab> toggles vim filer draw
nnoremap <silent> <tab> :VimFilerExplorer<cr>

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimfiler_draw_files_limit = 1000
let g:vimfiler_ignore_pattern='\%(.cache\|.coverage\|.bat\|.BAK\|.DAT\|.pyc\|.egg-info\)$\|'.
  \ '^\%(.vagrant\)$\|'.
  \ '^\%(.gitkeep\)$\|'.
  \ '^\%$.swp\$'.
  \ '^\%(.ebextensions\|.elasticbeanstalk\|Procfile\)$\|'.
  \ '^\%(.git\|.tmp\|__pycache__\|.DS_Store\|.tox\|.idea\|.ropeproject\)$'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_file_icon = '-'
let g:vimfiler_readonly_file_icon = '✕'
let g:vimfiler_marked_file_icon = '❯'
let g:vimfiler_execute_file_list = {'jpg': 'open', 'jpeg': 'open', 'gif': 'open', 'bmp': 'open', 'html': 'open', 'ppt': 'open', 'pdf': 'open', 'png': 'open', 'ico': 'open'}

"
" Go
"
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_type_info = 1
