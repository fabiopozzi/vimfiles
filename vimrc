" No vi compatibility
set nocompatible
" theme configuration
set background=dark
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My bundles
Bundle 'tadpol/autoload_cscope'
Bundle 'vim-scripts/cscope.vim'
Bundle 'fabiopozzi/cscope-quickfix'
Bundle 'scrooloose/nerdcommenter'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'majutsushi/tagbar'
"Bundle 'tpope/vim-fugitive'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'
Bundle 'bling/vim-airline'
Bundle 'terryma/vim-expand-region'
Bundle 'airblade/vim-gitgutter'
Bundle 'morhetz/gruvbox'

"filetype plugin indent on

" Enable filetype plugins and indention
"filetype plugin on
" Enable syntax colors
syntax enable

" Setup command history
set history=1000

" Move backup files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" Set persistent undo (?)
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Automatic fold view save for files - disabled, it doesn't work correctly
"au BufWinLeave *.* silent! mkview
"au BufWinEnter *.* silent! loadview

" ui settings
"colorscheme desert
"colorscheme darkblue
colorscheme gruvbox

set tabpagemax=15 " only 15 tabs
set showmode      " display the current mode
set nocursorline
set showcmd  " show partial commands in status line and selected characters in visual

" Make the command line two lines high and change the statusline display to
" something that looks useful.
"set cmdheight=1
set laststatus=2
" statusline splitted in parts
set statusline=%<%f\    " Filename
set statusline+=%w%h%m%r " Options
set statusline+=%{fugitive#statusline()} "  Git Hotness
set statusline+=\ [%{&ff}/%Y]            " filetype
set statusline+=\ [%{getcwd()}]          " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
"set statusline=[%l,%v\ %P%M][CWD:\ %{CWD()}][FILE:\ %f]\ %r%h%w\ (%{&ff})\%{fugitive#statusline()}%*

" set line numbers and column indicator on
"
set number
"set ruler
set nocursorcolumn
syntax sync minlines=5
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

"Gundo keymap
nnoremap <F5> :GundoToggle<CR>

" Enable mouse everywhere
set mouse=a

" define custom colors for C function
hi cCustomFunc cterm=bold ctermfg=DarkBlue

" Hide mouse while typing
set mousehide
set mousemodel=popup

" Code folding, not folded by default
set foldmethod=manual
"set foldmethod=syntax
set foldlevel=99
"set nofoldenable

" Ctrl-p mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(d|o|s|i)$',
  \ }


" turn off swapfiles
"set noswapfile

" Autoload Doxygen highlighting
let g:load_doxygen_syntax=1


" Change <leader> to ',' and <localleader> to '\'
let mapleader="\<Space>"
let maplocalleader="\\"

"let g:SuperTabDefaultCompletionType = "context"

" ack configuration
map <leader>a :Ag! 

" ,b opens CtrlP buffer
map <leader>b :CtrlPBuffer<CR>
" go to next buffer
map <leader>n :bn<CR>

" tagbar configuration
let g:tagbar_usearrows = 1
nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>

" I can type :help on my own, thanks.
noremap <F1> <Esc>

" remap move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" font size
set anti enc=utf-8
set guifont=Inconsolata\ for\ Powerline\ 10

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <F12> :BufExplorer<CR>

" Left/Right arrow keys change buffers in all modes
noremap <Left> <Esc>:bp<CR>
inoremap <Left> <Esc>:bp<CR>
nnoremap <Left> <Esc>:bp<CR>
vnoremap <Left> <Esc>:bp<CR>

noremap <Right> <Esc>:bn<CR>
inoremap <Right> <Esc>:bn<CR>
nnoremap <Right> <Esc>:bn<CR>
vnoremap <Right> <Esc>:bn<CR>

" Disable up/down arrow keys
"noremap <up> <nop>
"noremap <down> <nop>
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"vnoremap <up> <nop>
"vnoremap <down> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Mutt and vim settings
" limit text width to 72 characters
au BufRead /tmp/mutt-* set tw=72

" Enable hidden buffers
set hidden

" Enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring=%F\ -\ Vim

" Disable Toolbar, Scrollbar
set guioptions-=T
set guioptions-=r

" Disable the stupid pydoc preview window for the omni completion
set completeopt-=preview

" omnicompletion setup
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCS

" Disable the blinking cursor.
set gcr=a:blinkon0

set ttyfast

" Customize the wildmenu
set wildmenu
set wildignore=*.o,*.pyc,*.bak,*.exe,*.i,*.s,*.d
set wildmode=list:full
set wildchar=<Tab> wildmenu wildmode=full

" Global by default
set gdefault

" Better Search
set hlsearch
set incsearch
set showmatch

" Hide matches on <leader>s
nnoremap <leader>s :nohlsearch<cr>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" <leader>v selects the just pasted text
nnoremap <leader>v V`]'

" Copy/Paste to and from Desktop Environment
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Stop that stupid window from popping up
map q: :q
" alias Wq to wq
command! Wq wq
command! Q q

"noremap <leader>yy "+y
"noremap <leader>pp "+gP
" paste multiple times
"noremap p pgvy

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

function! CWD()
    let curdir = substitute(getcwd(), '/home/wintermute', "~/", "g")
    return curdir
endfunction

" NERDcommenter remaps
map <Leader>c <plug>NERDCommenterInvert
map <Leader>x <plug>NERDCommenterToggle

" vim expand region mappings

nmap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" fast save
nnoremap <Leader>w :w<CR>

" Tab Settings
set noexpandtab   " use tabs
set tabstop=8     " tabstops of 8
set softtabstop=0
set shiftwidth=4

set list
set listchars=tab:▸\ ,eol:¬

"autocmd FileType c setlocal shiftwidth=4 tabstop=8
"set textwidth=78  " screen in 80 columns wide, wrap at 78
" Go with smartindent if there is no plugin indent file.
set autoindent " smartindent disabled
"set smarttab

set backspace=eol,start,indent  " Fix backspace indentation
"set backspace=indent,eol,start" Fix backspace indentation (original)
"syntax on

" highlighting for some special keywords (linux kernel specific)
syn keyword cType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t
syn keyword cOperator likely unlikely

" highlight column 80
set colorcolumn=80

set formatoptions=tcqlron
"set cinoptions=:0,l1,t0,g0  " configures how to indent parts of code

" Some indenting macros
nmap <C-J> vip=     "forces (re)indentation of a block

" command to build a c file
"set makeprg=gcc\ -o\ %<\ %

" automatically lookup for the tags file in the file tree
"set tags+=tags;

" Taglist
let Tlist_Compact_Format = 1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Enable_Fold_Column = 0
let Tlist_Exist_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_sort_type = "name"
let Tlist_Use_Right_Window = 1
let TlistHighlightTag = 1
let Tlist_Width = 40
let Tlist_GainFocus_On_ToggleOpen = 1
"nnoremap <leader>l :Tlist<CR>

" Tagbar
let g:tagbar_usearrows = 1
"nnoremap <leader>l :TagbarToggle<CR>

" cscope settings
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev csh cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

" Gvim Settings

" utf-8 default encoding
set enc=utf-8
" set encoding=iso-8859-1

" Prefer unix over windows over os9 formats
set fileformats=unix,dos,mac

" Don't bell or blink(Courtesy: Cream Editor).
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif


" Keep some more lines for scope
"set scrolloff=5

" hide some files and remove stupid help
let g:netrw_list_hide='^\.,.\(pyc\|pyo\|o\)$'

" Split window management
"nnoremap <leader>w <C-w>v<C-w>l
"nnoremap <leader>W <C-w>s
"nnoremap <leader>s :new<CR>

" open tabs using Ctrl-t
":nmap <C-t> :tabnew<CR>
":imap <C-t> <Esc>:tabnew<CR>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
nnoremap <Leader>l :ls<CR>

" It's useful to show the buffer number in the status line.
"set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" python support
" ------------
autocmd BufNewFile,BufRead *.py setlocal tabstop=4
autocmd BufNewFile,BufRead *.py setlocal softtabstop=4
autocmd BufNewFile,BufRead *.py setlocal shiftwidth=4
"autocmd BufNewFile,BufRead *.py setlocal textwidth=80
autocmd BufNewFile,BufRead *.py setlocal smarttab
autocmd BufNewFile,BufRead *.py setlocal expandtab


" ruby support
" ------------
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=79

" autocmd BufWritePre *.py normal m`:%s/\s\+$//e `` " doesn't work


" vim
" ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

set t_Co=256 " Explicitly tell vim that the terminal has 256 colors

" fugitive
" -------
"switch back to current file and closes fugitive buffer
nnoremap <Leader>gD :diffoff!<cr><c-w>h:bd<cr>

let g:local_vimrc = {'names':['.vimrc'],'hash_fun':'LVRHashOfFile'}
