set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " Let vundle manage itself:
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'ctrlp/ctrlp.vim'    " Fuzzy finder -- absolutely must have.
Plugin 'tpope/vim-commentary' " Support for easily toggling comments.
Plugin 'leshill/vim-json'  " Proper JSON filetype detection, and support.
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'esneider/YUNOcommit.vim'
Plugin 'indenthtml.vim' " vim indents HTML very poorly on it's own. This fixes a lot of that.
Plugin 'tpope/vim-markdown' " I write markdown a lot. This is a good syntax.
Plugin 'groenewege/vim-less'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-endwise'
Plugin 'mileszs/ack.vim'
Plugin 'vim-ruby/vim-ruby'

" Coffee-script syntax.
Plugin 'kchmck/vim-coffee-script'

let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
let g:closetag_emptyTags_caseSensitive = 1

let g:nerdtree_tabs_open_on_console_startup=1
let g:multi_cursor_next_key='<C-x>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_quit_key='<Esc>'
call vundle#end()

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting


set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.
set backspace=indent,eol,start

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = "\\"


" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use sane regex's when searching
nnoremap / /\v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>


" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" Plugin settings:
" Below are some 'sane' (IMHO) defaults for a couple of the above plugins I
" referenced.

" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

" Remap ctrlp to ctrl-t -- map it however you like, or stick with the
" defaults. Additionally, in my OS, I remap caps lock to control. I never use
" caps lock. This is highly recommended.
let g:ctrlp_map = '<c-t>'

" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

" ARROW KEYS ARE UNACCEPTABLE
"map <Left> :echo "no!"<cr>
"map <Right> :echo "no!"<cr>
"map <Up> :echo "no!"<cr>
"map <Down> :echo "no!"<cr>

"Easy save and quit typos
command! W :w
command! Q :q
command! Wq :wq
command! WQ :wq


" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
map <C-n> <plug>NERDTreeTabsToggle<CR>
map <F10> :set invnumber
cmap w!! %!sudo tee > /dev/null/ %

set history=100
set number  " show line numbers
set nowrap
set ruler
set backupdir=~/.vim/backups
set directory=~/.vim/tmp
set backup                                        "file backups enabled
set writebackup                                   "enabling backups
set noswapfile                                    "disable swaps - were using backups in 2017
set pastetoggle=<F2>
set clipboard=unnamedplus

"use ag for ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z
"do not have ack jump to first response
cnoreabbrev Ack Ack!
"ack for the current word under cursor
nnoremap <Leader>a :Ack!<Space><C-R><C-W>

nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
