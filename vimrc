" vim file configuration
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" No vi compatibility
set nocompatible

" set line numbers and column indicator on
set number
"set ruler
set nocursorcolumn
set nocursorline
syntax sync minlines=5
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" Enable mouse everywhere
set mouse=a

" Hide mouse while typing
set mousehide
set mousemodel=popup

" Code folding, folded by default
"set foldmethod=manual
set foldmethod=syntax
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
set guifont=Anonymous\ Pro\ 9

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

" Enable filetype plugins and indention
filetype on
if has('autocmd')
  filetype plugin indent on

  autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.cc source ~/vimfiles/bundle/cvim/plugin/c.vim
endif
" filetype plugin on

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
" paste multiple times
"noremap p pgvy

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

function! CWD()
    let curdir = substitute(getcwd(), '/home/wintermute', "~/", "g")
    return curdir
endfunction

" Tab Settings
set noexpandtab   " use tabs, not spaces
set tabstop=8     " tabstops of 8
set shiftwidth=8  " indents of 8
set textwidth=78  " screen in 80 columns wide, wrap at 78
" Go with smartindent if there is no plugin indent file.
set autoindent smartindent
set smarttab
set backspace=eol,start,indent  " Fix backspace indentation
"set backspace=indent,eol,start" Fix backspace indentation (original)
syntax on

" highlighting for some special keywords (linux kernel specific)
syn keyword cType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t
syn keyword cOperator likely unlikely

" Error highlighting doesn't word, disabled for now
"syn match ErrorLeadSpace /^ \+/   "highlight any leading spaces
"syn match ErrorTailSpace / \+$/   "highlight any trailing spaces
" match Error80           /\%>80v.\+/ "highlight anything past 80 in red " doesn't work

"if has("gui_running")
"        hi Error80        gui=NONE   guifg=#ffffff   guibg=#6e2e2e
"        hi ErrorLeadSpace gui=NONE   guifg=#ffffff   guibg=#6e2e2e
"        hi ErrorTailSpace gui=NONE   guifg=#ffffff   guibg=#6e2e2e
"else
"        exec "hi Error80        cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(32)
"        exec "hi ErrorLeadSpace cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(33)
"        exec "hi ErrorTailSpace cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(33)
"endif

set formatoptions=tcqlron
set cinoptions=:0,l1,t0,g0  " configures how to indent parts of code

" Some indenting macros
nmap <C-J> vip=     "forces (re)indentation of a block

" paste settings
:map <F10> :set paste<CR>
:map <F11> :set nopaste<CR>
:imap <F10> <C-O>:set paste<CR>

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
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>


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

set t_Co=256 " Explicitly tell vim that the terminal has 256 colors

" fugitive
" -------
"switch back to current file and closes fugitive buffer
nnoremap <Leader>gD :diffoff!<cr><c-w>h:bd<cr>

