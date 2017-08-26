" Theme
color desert

let mapleader = "-"
let maplocalleader = "\\"

" Use system clipboard to do copy/paste
" So that, I can directly 'y' in vim and paster outside vim
" Or, copy sth outside vim and 'p' in vim
set clipboard=unnamedplus

" Replace tab with 4 spaces
set tabstop=4 shiftwidth=4 expandtab

" Show line number
set number numberwidth=4

" Enable mouse 
set mouse=a

" significant cursor line
" A little bit annoying when using '_' in text
" set cursorline

" highlight search key
set hlsearch

" keep last 3 line when scroll
set scrolloff=3

" display incomplete commands
set showcmd		

" use 256 color mode
set t_Co=256

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Vundle
set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'steffanc/cscopemaps.vim'
"Plugin 'ntpeters/vim-better-whitespace'
Plugin 'The-NERD-tree'
call vundle#end()

filetype plugin indent on

" Close VIM if the only left open window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary" ) | q | endif
" Delete trailing whitespace on c,cpp file type
autocmd FileType c,cpp autocmd BufWritePre <buffer> %s/\s\+$//e


" ================= 
" Key mappings 
" =================

" edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" load .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" esc insert mode
inoremap jk <esc>
inoremap <esc> <nop>

" esc visual mode
vnoremap ui <esc>
vnoremap <esc> <nop>

" move to line head
nnoremap H ^

" move to line end
nnoremap L $

" surround a word with "
nnoremap <leader>"  viw<esc>a"<esc>hbi"<esc>lel

" F5 : open NERD Tree
nnoremap <silent> <F5>  :NERDTreeToggle<CR>
" F9 : highlight toggle
nnoremap <F8> :set hlsearch!<CR>
" <C-h> : left tab
nnoremap <C-l> :tabn<CR>
" <C-l> : right tab
nnoremap <C-h> :tabp<CR>
" <C-n> : new tab
nnoremap <C-n> :tabnew<CR>
" <C-s>  : save file in normal/insert mode. Note: add 'stty -ixon' in .bashrc
" or .bash_profile to prevent hanged scroll
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" my <C-]> jump doesn't work on lubuntu 16.04.1 + vim 7.4 + ctags
" Use a new keymapping to trigger <C-]>
nnoremap <C-j> <C-]>

" ------------------
" from vim wiki 'Quick command in insert mode'
" ------------------
" go to just before the 1st non-blank text of the line
" like go to the head of line, then move to the head of first word
inoremap II <ESC>I 

" go to the end of line
inoremap AA <ESC>A

" Delete this because conflicts with 'ROOT'
" start editing on a new line above the current line
" inoremap OO <ESC>O

" save file
inoremap WW <ESC>:w<CR>

" save file and quit
inoremap WQ <ESC>:wq<CR>
" -----------------


" ================== 
" Abbreviations 
" ==================

iabbrev @@ tf1515@gmail.com 
iabbrev ssig <cr>TingHan<cr>tf1515@gmail.com


