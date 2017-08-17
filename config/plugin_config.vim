
" Ctrl-p mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(d|o|s|i)$',
  \ }

set runtimepath^=~/.vim/bundle/ctrlp.vim

" tagbar configuration
"let g:tagbar_usearrows = 1
nmap <F8> :TagbarToggle<CR>

" Cscope settings
if has("cscope")
	" use both cscope and ctag for 'ctrl-]', ':ta' and 'vim -t'
	set cscopetag

	" check cscope for definition of a symbol before checking ctags: set to 1
	" if you want the reverse search order
	set csto=0

	" add any cscope db in the current dir
	if filereadable("cscope.out")
		cs add cscope.out
	" else add the db pointed by the env variable
	elseif $CSCOPEDB != ""
		cs add $CSCOPE_DB
	endif

	" show msg when any other cscope db added
	set cscopeverbose

	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
endif

" Fix man visualization on gvim
runtime ftplugin/man.vim
if has("gui_running")
	nnoremap K :Man <cword><CR>
endif
