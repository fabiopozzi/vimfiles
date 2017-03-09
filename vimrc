scriptencoding utf-8
set encoding=utf-8
" no vi compatibility
set nocompatible
" theme config
set background=dark
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My bundles
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ap/vim-buftabline'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-unimpaired'
call vundle#end()

" Enable filetype detection and intentation
filetype plugin indent on

" setup command history
set history=1000

" Move backup files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" ui settings
colorscheme gruvbox

" display current mode
set showmode
set nocursorline
" show partial commands in status line and selected characters in visual
set showcmd

" Make the command line two lines high and change the statusline display to
" something that looks useful.
"set cmdheight=1
set laststatus=2
" statusline splitted in parts
set statusline=%<%f\    " Filename
set statusline+=%w%h%m%r " Options
set statusline+=\ [%{&ff}/%Y]            " filetype
set statusline+=\ [%{getcwd()}]          " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" set line numbers and column indicator on
set number

" Ctrl-p mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(d|o|s|i)$',
  \ }
set runtimepath^=~/.vim/bundle/ctrlp.vim

" highlight trailing whitespace, tab and eol
set list!
"set listchars=tab:▸\ ,eol:¬
set listchars=trail:·,precedes:«,extends:»,tab:▸\ ,eol:¬
set vb t_vb= " Terminal: Turn off visual bell, error flash
" GUI: Don't bell or blink(Courtesy: Cream Editor).
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif

" Better Search
set hlsearch
set incsearch
set showmatch

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Change <leader> to 'space' and <localleader> to '\'
let mapleader="\<Space>"
let maplocalleader="\\"

"------------- Custom Keybindings --------------
" I can type :help on my own, thanks.
noremap <F1> <Esc>
" fast save
nnoremap <Leader>w :w<CR>
" paste settings
:map <F10> :set paste<CR>
:map <F11> :set nopaste<CR>
:imap <F10> <C-O>:set paste<CR>
" Hide matches on <leader>s
nnoremap <leader>s :nohlsearch<cr>
" ack configuration
map <leader>a :Ag! 
" <leader>b opens CtrlP buffer
map <leader>b :CtrlPBuffer<CR>

" Tab Settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab " use spaces

" Use one space, not two, after punctuation
set nojoinspaces

" Go with smartindent if there is no plugin indent file.
set autoindent
set smartindent
"set smarttab

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
