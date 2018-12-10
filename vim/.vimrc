colorscheme torte
syntax on
" Ignore case
set ic
" Highlight search
set hls
"Inclusive search
set incsearch
set nowrap
set laststatus=2
set mouse=a
" Line numbers
set nu
" Auto indent
set ai
" Remap shift+enter to escape (only works on Windows GVim)
inoremap <S-CR> <Esc>

if has("gui_running")
  set guifont=Lucida\ Console:h10
endif
