" Theme
:color desert
" Replace tab with 4 spaces
set tabstop=4 shiftwidth=4 expandtab
" Show line number
set number
" Enable mouse 
set mouse=a
" significant cursor line
set cursorline
" highlight search key
set hls
" keep last 3 line when scroll
set scrolloff=3

" Vundle
set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'steffanc/cscopemaps.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'The-NERD-tree'
call vundle#end()

filetype plugin indent on

" Close VIM if the only left open window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary" ) | q | endif
" Delete trailing whitespace on c,cpp file type
autocmd FileType c,cpp autocmd BufWritePre <buffer> %s/\s\+$//e

" Hotkeys
" F5 : open NERD Tree 
nnoremap <silent> <F5>  :NERDTreeToggle<CR>
" F9 : highlight toggle
map <F8> :set hlsearch!<CR>
" <C-h> : left tab
map <C-l> :tabn<CR>
" <C-l> : right tab
map <C-h> :tabp<CR>
" <C-n> : new tab
map <C-n> :tabnew<CR>
" tg : previous tab
:nmap tg gT
" <C-s>  : save file in normal/insert mode. Note: add 'stty -ixon' in .bashrc
" or .bash_profile to prevent hanged scroll
:nmap <C-s> :w<CR>
:imap <C-s> <ESC>:w<CR>
