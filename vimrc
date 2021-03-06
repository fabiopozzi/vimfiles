" No vi compatibility
set nocompatible

" Encoding settings
scriptencoding utf-8
set encoding=utf-8

" Load plugins
set runtimepath^=~/.vim/plugged/ctrlp.vim
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-buftabline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'pangloss/vim-javascript'
Plug 'preservim/nerdcommenter'
Plug 'andymass/vim-matchup'
call plug#end()

" filetype off
" Enable filetype plugins and indention
filetype plugin indent on

" Enable syntax colors
syntax enable

" prevent accidentally entering ex mode
map q: <Nop>
nnoremap Q <nop>

" Setup command history
set history=500

" No backup files
set nobackup
set nowb
set noswapfile

" Set persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" UI settings
try
    colorscheme gruvbox
catch
endtry

" Theme configuration
set background=dark

" Display the current mode
set showmode
set nocursorline
"set nocursorcolumn
" Show partial commands in status line and selected characters in visual mode
set showcmd

" Set line numbers and column indicator on
set number
set ruler

" Change <leader> to '<space>' and <localleader> to '\'
let mapleader="\<Space>"
let maplocalleader="\\"

" ========== Status bar ========
" Make the command line two lines high and change the statusline display to
" something that looks useful.
set cmdheight=2
set laststatus=2
" StatusLine splitted in parts
set statusline=%<%f\    " Filename
set statusline+=%w%h%m%r " Options
set statusline+=\ [%{&ff}/%Y]            " filetype
set statusline+=\ [%{getcwd()}]          " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" Code folding, not folded by default
set foldmethod=manual
"set foldmethod=syntax
set foldlevel=99
"set nofoldenable

set list!
set listchars=trail:·,precedes:«,extends:»,tab:▸\ ,eol:¬
set vb t_vb= " Turn off visual bell, error flash

" Font size TBD

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Enable hidden buffers
set hidden

" Enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring=%F\ -\ Vim

" Disable the blinking cursor.
set gcr=a:blinkon0

" Enable clipboard copy/paste
set clipboard=unnamed

" Fix slow vim terminal slow scrolling
set ttyfast
set lazyredraw

" Customize the wildmenu
set wildmenu
set wildignore=*.o,*.pyc,*.bak,*.exe,*.i,*.s,*.d
set wildmode=list:full
set wildchar=<Tab> wildmenu wildmode=full

" Assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

" Better Search
set hlsearch
set incsearch
set showmatch
" Ignore case when searching
set ignorecase

" set nojoinspaces

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" ====== Tab Settings =====
" 1 tab == 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79  " screen in 80 columns wide, wrap at 78
set expandtab " use spaces
set autoindent " auto indent enabled
set shiftround " round indent to multiple of 'shiftwidth'
"set smarttab

syntax sync minlines=5
noremap <F5> <Esc>:syntax sync fromstart<CR>
inoremap <F5> <C-o>:syntax sync fromstart<CR>
" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

set backspace=eol,start,indent  " Fix backspace indentation

source $HOME/config/plugin_config.vim
source $HOME/config/keys_config.vim

" === netrw config ===
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
