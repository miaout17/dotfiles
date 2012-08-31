call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
syntax on
filetype plugin indent on
set number
set numberwidth=3
set noeol

colorscheme darkblue
" colorscheme wombat256mod

" Search settings
set incsearch " Incremental search
set hlsearch  " Highlight search

" Status line
set laststatus=2 " 2 for `always show the status line`
set statusline=%<%1*%f%*\ %h%m%r%#warningmsg#%*%=%-14.(%l,%c%V%)\ %P

" Tab
set tabstop=2
set shiftwidth=2
set expandtab

set listchars=tab:>-,trail:.
set list

" Key bindings
nmap <C-P> :NERDTreeToggle<CR>
nmap <silent> <C-N> :silent noh<CR>
" Delete trailing spaces
nmap <C-X> :%s/\s\+$//e<CR>

" autocmd FileType ruby setlocal tabstop=2
" autocmd FileType ruby setlocal shiftwidth=2

set nobackup
set noswapfile
