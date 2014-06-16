set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set nocompatible

filetype off                  " required!
syntax on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!

Bundle 'gmarik/vundle'

"

Bundle 'beyondwords/vim-twig'
Bundle 'othree/html5.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'elzr/vim-json'
Bundle 'jelera/vim-javascript-syntax'

autocmd FileType php setlocal completefunc=phpcomplete_extended#CompletePHP

filetype plugin indent on

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.


" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" " SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" " For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

:hi Directory guifg=#FF0000 ctermfg=red
