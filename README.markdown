Vimfiles
=======

These are my personal vimfiles, including:

* the main vimrc file
* the config folder containing:
  * keybindings
  * plugin config
  * syntax highlighting configuration
All plugins are handled by [vim-plug](https://github.com/junegunn/vim-plug "vim-plug")

The plugins I'm using now are:
* bufexplorer
* vim-buftabline
* ctrlp
* ag.vim
* syntastic
* vim-go
* vim-rails

All of them are fetched from github repos by vim-plug thus all links to the
plugins can be found at the beginning of the vimrc file.

I added the `after/ftplugin` directory to enable custom indentation settings for
different source files.
It must be linked under ~/.vim

Fabio
