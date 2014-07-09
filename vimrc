set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

set nocompatible
filetype off                  " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

Plugin 'Shougo/neocomplete'
Plugin 'gmarik/vundle'
Plugin 'beyondwords/vim-twig'
Plugin 'othree/html5.vim'
Plugin 'Shougo/neosnippet.vim'
Bundle 'Shougo/neosnippet-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'

autocmd FileType php setlocal completefunc=phpcomplete_extended#CompletePHP

call vundle#end()            " required
filetype plugin indent on    " required

"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.

:hi Directory guifg=#FF0000 ctermfg=red