"==================================================
" Vundle 
"==================================================

set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'steffanc/cscopemaps.vim'
"Plugin 'ntpeters/vim-better-whitespace'
Plugin 'The-NERD-tree'
Plugin 'scrooloose/nerdcommenter' "comment: <leader>cc, uncomment: <leader>cu
"Plugin 'craigemery/vim-autotag'
Plugin 'vim-gutentags', {'vim-gutentags': 'vim-gutentags'} "Replace vim-autotag
call vundle#end()

filetype plugin indent on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"==================================================
" Plugin configurations
"==================================================

" Close VIM if the only left open window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary" ) | q | endif
" Delete trailing whitespace on these file types,and restore cursor when done
" https://stackoverflow.com/questions/35390415/cursor-jump-in-vim-after-save
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType h,c,cpp autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
"autocmd FileType h,c,cpp autocmd BufWritePre <buffer> %s/\s\+$//e

"-------------
" vim-autotag
"-------------
"let g:autotagTagsFile="tags"
"let g:autotagExcludeSuffixes="tml.xml.o.a.d.xlsx"

"-------------
" vim-gutentags
"-------------
" Referenced from http://www.skywind.me/blog/archives/2084
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
" Remove '.git' for projects consisted by multiple repos
let g:gutentags_project_root = ['.root', '.svn', '.hg', '.project']
let g:gutentags_add_default_project_roots = 0
 
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
 
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
 
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"-------------
" vim-snippets
"-------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"-------------
" NERDTree 
"-------------
let NERDTreeShowBookmarks=1

"==================================================
" VIM configurations
"==================================================

" Theme
color desert

let mapleader = ";"
let maplocalleader = "\\"

" Use system clipboard to do copy/paste
" So that, I can directly 'y' in vim and paster outside vim
" Or, copy sth outside vim and 'p' in vim
set clipboard=unnamedplus

" Replace tab with 4 spaces as default
" <F9> to change tab action
" from http://vim.wikia.com/wiki/Toggle_between_tabs_and_spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
function! TabToggle()
	if &expandtab
		set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
	else
		set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	endif
endfunction
nnoremap <F9> mz:execute TabToggle()<CR>'z

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

" case-insensitive search
set ignorecase
" if pattern contains capital letter, do case-sensitive search
set smartcase

" search '.tag' file in current working path, vim opening path, or upto parent
" folders
set tags=./.tags;,.tags

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Highlight line 80 to check coding rule 
highlight ColorColumn ctermbg=darkblue
set colorcolumn=80

"==================================================
" Status line
"==================================================

set statusline=
set statusline+=%1*\[%n]                                  "buffernr
set statusline+=%2*\ %<%F\                                "File+path
set statusline+=%3*\ %=\ %{''.(&fenc!=''?&fenc:&enc).''}\ "Encoding
set statusline+=%4*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%5*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%6*\ row:%l/%L\ col:%03c\ (%03p%%)\       "Rownumber/total (%)
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
"set statusline+=%{gutentags#statusline()} "Progress of updating ctags 
hi User2 ctermfg=3  ctermbg=0
hi User6 ctermfg=3  ctermbg=4
set laststatus=2

"==================================================
" Key mappings 
"==================================================

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
nnoremap <leader>h ^

" move to line end
nnoremap <leader>l $

" surround a word with "
nnoremap <leader>"  viw<esc>a"<esc>hbi"<esc>lel

" F5 : open NERD Tree
nnoremap <silent> <F5>  :NERDTreeToggle<CR>
" F8 : highlight toggle
nnoremap <F8> :set hlsearch!<CR>

" ------------
" vim tab
" ------------
" nnoremap <C-l> :tabn<CR>
" nnoremap <C-h> :tabp<CR>
nnoremap <Tab>l :tabn<CR>
nnoremap <Tab>h :tabp<CR>
" <C-n> : new tab. This usage rate is low. Comment it out.
" nnoremap <C-n> :tabnew<CR>


" ------------
" vim window
" ------------
" jump to next right-down
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>
" jump between
nnoremap <C-p> :wincmd p<CR>
" create new window and edit in it
nnoremap <C-w>\ :vs<CR>:wincmd w<CR> 
nnoremap <C-w>- :sp<CR>:wincmd w<CR>

" don't want to press <CR>
nnoremap <leader>q :q<CR>

" ------------
" ctags
" ------------
" my <C-]> jump doesn't work on lubuntu 16.04.1 + vim 7.4 + ctags
" Use a new keymapping to trigger <C-]>
" nnoremap <C-j> <C-]>
nnoremap <leader>] <C-]>
nnoremap <leader>i <C-W><C-]>

" ------------
" others
" ------------
" Enter : insert new line after current line
nnoremap <Enter> o<Esc>

" <C-s>  : save file in normal/insert mode. Note: add 'stty -ixon' in .bashrc
" or .bash_profile to prevent hanged scroll
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" mimic Ctrl-C and Ctrl-v on windows
vnoremap <leader>c :w! ~/.vimcp<CR>
nnoremap <leader>v :r ~/.vimcp<CR>

" replace word, only complete word, under cursor
" add options, 'c' confirm, 'g' greedy, 'I' case-sensitive, after 2nd /
nnoremap <leader>s :%s/\<<C-r><C-w>\>//cg<Left><Left><Left>

"==================================================
" from vim wiki 'Quick command in insert mode'
"==================================================
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


"==================================================
" Abbreviations 
"==================================================

" insert mode
iabbrev @@ tf1515@gmail.com 
iabbrev ssig <cr>TingHan<cr>tf1515@gmail.com

" command mode 
" expand 'tn' to 'tabnew' automatically when typing command
cabbrev tn tabnew

"==================================================
" Programming related 
"==================================================

" prepend // at line head
nnoremap <leader>/ I//<ESC> 

" remove first found '//' 
nnoremap <leader>d/ :s:\(\s\=\)\/\/:\1:<ESC>

" surround line with /* */
nnoremap <leader>* I/* <ESC>A */<ESC>
