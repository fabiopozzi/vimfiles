
" Ctrl-p mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(d|o|s|i)$',
  \ }

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Fix man visualization on gvim
runtime ftplugin/man.vim
if has("gui_running")
	nnoremap K :Man <cword><CR>
endif

" Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" set python interpreter
"let g:python_host_prog = '/usr/local/bin/python3'
" set python syntax checker
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
