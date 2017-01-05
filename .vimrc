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

set showcmd		" display incomplete commands

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

" my <C-]> jump doesn't work on lubuntu 16.04.1 + vim 7.4 + ctags
" Use a new keymapping to trigger <C-]>
map <C-j> <C-]>

" ==================
" search vim wiki for 'Quick command in insert mode'
" ------------------
" go to just before the 1st non-blank text of the line
" like go to the head of line, then move to the head of first word
inoremap II <ESC>I

" go to the end of line
inoremap AA <ESC>A

" start editing on a new line above the current line
inoremap OO <ESC>O

" save file
inoremap SS <ESC>:w<CR>

"==================
