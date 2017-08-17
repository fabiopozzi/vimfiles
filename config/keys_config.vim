"------------- Custom Keybindings --------------
" I can type :help on my own, thanks.
noremap <F1> <Esc>
" Fast save
nnoremap <Leader>w :w<CR>
" Paste settings
:map <F10> :set paste<CR>
:map <F11> :set nopaste<CR>
:imap <F10> <C-O>:set paste<CR>

" Hide matches on <leader>s
nnoremap <leader>s :nohlsearch<cr>

" The silver-searcher configuration
map <leader>a :Ag! 

" Left/Right arrow keys change buffers in all modes
noremap <Left> <Esc>:bp<CR>
inoremap <Left> <Esc>:bp<CR>
nnoremap <Left> <Esc>:bp<CR>
vnoremap <Left> <Esc>:bp<CR>

noremap <Right> <Esc>:bn<CR>
inoremap <Right> <Esc>:bn<CR>
nnoremap <Right> <Esc>:bn<CR>
vnoremap <Right> <Esc>:bn<CR>

" Stop that stupid window from popping up
map q: :q
" alias Wq to wq
"command! Wq wq

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
