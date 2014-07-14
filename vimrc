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
Plugin 'Shougo/neosnippet-snippets'
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


" color settings (if terminal/gui supports it)
if &t_Co > 2 || has("gui_running")
    syntax on
    set list
    " Highlight trailing whitespaces.
    :highlight ExtraWhitespace ctermbg=red guibg=red
    :match ExtraWhitespace /\s\+$/
endif

" Because why enter this every time?
autocmd VimEnter * NERDTree

augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermbg=yellow guibg=#111111
    autocmd BufEnter * match OverLength /\%70v.*/
augroup END

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
