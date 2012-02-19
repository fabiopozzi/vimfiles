" vim file configuration
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" No vi compatibility
set nocompatible

" set line numbers and column indicator on
set number
set ruler

" Fix backspace indentation
set backspace=indent,eol,start

" Enable mouse everywhere
set mouse=a

" Hide mouse while typing
set mousehide
set mousemodel=popup

" Code folding, folded by default
set foldmethod=manual
set foldlevel=99
set foldenable

" Move backup files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" turn off swapfiles
"set noswapfile

" Set persistent undo (?)
" set undodir=~/.vim/undodir
" set undofile

" Change <leader> to ',' and <localleader> to '\'
let mapleader=","
let maplocalleader="\\"

noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

"let g:SuperTabDefaultCompletionType = "context"

" ack configuration
let g:ackprg="ack -H --nocolor --nogroup --column"
map <leader>a :Ack! 

" NerdTree bindings
map <leader>n :NERDTree<CR>

" tagbar configuration
let g:tagbar_usearrows = 1
nmap <leader>l :TagbarToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Enable syntax colors
syntax enable

" theme configuration
set background=dark
colorscheme solarized

" font size
set guifont=Inconsolata\ 9

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" Left/Right arrow keys change buffers in all modes
noremap <Left> <Esc>:tabp<CR>
inoremap <Left> <Esc>:tabp<CR>
nnoremap <Left> <Esc>:tabp<CR>
vnoremap <Left> <Esc>:tabp<CR>

noremap <Right> <Esc>:tabn<CR>
inoremap <Right> <Esc>:tabn<CR>
nnoremap <Right> <Esc>:tabn<CR>
vnoremap <Right> <Esc>:tabn<CR>

" Disable up/down arrow keys
noremap <up> <nop>
noremap <down> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Enable hidden buffers
set hidden

" Enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring=%F\ -\ Vim

" Enable filetype plugins and indention
filetype on
filetype plugin on

" Activate a permanent ruler
set ruler

" Disable Toolbar, Scrollbar
set guioptions-=T
set guioptions-=r

" Disable the stupid pydoc preview window for the omni completion
set completeopt-=preview

" Disable the blinking cursor.
set gcr=a:blinkon0

set ttyfast

" Customize the wildmenu
set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class
set wildmode=list:full

" Go with smartindent if there is no plugin indent file.
set autoindent smartindent

" Global by default
set gdefault

" Better Search
set hlsearch
set incsearch
set showmatch

" Hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/='<CR>

" <leader>v selects the just pasted text
nnoremap <leader>v V`]'

" Copy/Paste to and from Desktop Environment
noremap <leader>yy "+y
noremap <leader>pp "+gP


" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Make the command line two lines high and change the statusline display to
" something that looks useful.
"set cmdheight=1
set laststatus=2
"set statusline=[%l,%v\ %P%M][CWD:\ %{CWD()}][FILE:\ %f]\ %r%h%w\ (%{&ff})\%{fugitive#statusline()}\ %#warningmsg#%{SyntasticStatuslineFlag()}%*
set showcmd
set showmode
set number

function! CWD()
    let curdir = substitute(getcwd(), '/home/wintermute', "~/", "g")
    return curdir
endfunction

" Tab Settings
set smarttab
set tabstop=8

" paste settings
:map <F10> :set paste<CR>
:map <F11> :set nopaste<CR>
:imap <F10> <C-O>:set paste<CR>

" command to build a c file
"set makeprg=gcc\ -o\ %<\ %

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
nnoremap <leader>l :Tlist<CR>

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

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

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" utf-8 default encoding
set enc=utf-8

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
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>W <C-w>s
nnoremap <leader>s :new<CR>

" open tabs using Ctrl-t
":nmap <C-t> :tabnew<CR>
":imap <C-t> <Esc>:tabnew<CR>


let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


" ruby support
" ------------
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=79

" vim
" ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" powerline
" ---
set t_Co=256 " Explicitly tell vim that the terminal has 256 colors
let g:Powerline_symbols = 'fancy'
