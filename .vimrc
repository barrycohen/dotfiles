" Enable useful vim extensions
set nocompatible

" Make yank copy to X and system clipboards
set clipboard=unnamed,unnamedplus

" Turn off visual bell
au VimEnter * set vb t_vb=

" Set some defaults
set et ts=4 sts=4 sw=4 ai

" Always syntax highlight from the top of the file
au BufEnter * :syntax sync fromstart

" Prevent Vim from clearing X or sytem clipboards on exit
au VimLeave * call system("xsel -i ; xsel -o | xsel -ib", getreg("*"))

" Never hide tab line, which causes the status bar to mess up
set showtabline=2

" Make mouse work inside tmux
set mouse=a

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  " Better mouse support, see  :help 'ttymouse'
  set ttymouse=sgr

  " Enable true colors, see  :help xterm-true-color
  let &termguicolors = v:true
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  " Enable modified arrow keys, see  :help arrow_modifiers
  execute "silent! set <xUp>=\<Esc>[@;*A"
  execute "silent! set <xDown>=\<Esc>[@;*B"
  execute "silent! set <xRight>=\<Esc>[@;*C"
  execute "silent! set <xLeft>=\<Esc>[@;*D"
endif

" Map Ctrl-Up and Ctrl-Down to scroll pane up and down
map [1;5A <C-Y>
map <C-UP> <C-Y>
map [1;5B <C-E>
map <C-DOWN> <C-E>
map [1;5C w
map <C-RIGHT> w
map [1;5D b
map <C-LEFT> b
" Map Ctrl-X to open left hand explorer window
map <C-X> :Lex<CR>

" Mappings for xterm
map [A <C-Y>
map [B <C-E>
map [C w
map [D b

" Move around with tmux navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> [1;3D :TmuxNavigateLeft<cr>
nnoremap <silent> [1;3B :TmuxNavigateDown<cr>
nnoremap <silent> [1;3A :TmuxNavigateUp<cr>
nnoremap <silent> [1;3C :TmuxNavigateRight<cr>

" Map F5 to remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Map F7 to do coc.nvim formatting
nnoremap <silent> <F7> :Format<CR>

" Configure netrw
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_altv = 1

" Enable syntax highlighting
syntax enable
set background=dark
colorscheme solarized8

" Highlight trailing whitespace
hi ExtraWhiteSpace gui=underline cterm=underline ctermfg=160 guifg=#dc322f
au InsertEnter * match ExtraWhiteSpace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/
