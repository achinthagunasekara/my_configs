set cursorline
set number
syntax on
colorscheme solarized
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" File type specific settings
autocmd BufRead,BufNewFile *.go set noexpandtab
autocmd BufRead,BufNewFile *.md set spell

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()  " Start Vundle

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" let Vundle manage Vundle, required
Plugin 'itchyny/lightline.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'tell-k/vim-autopep8'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'hashivim/vim-terraform'
Plugin 'jbgutierrez/vim-better-comments'

call vundle#end() " End Vundle
filetype plugin indent on

" ** Syntastic **
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{fugitive#statusline()}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_python_checkers = ['pycodestyle']

" ** LightLine **
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \     'left': [
    \         [ 'mode', 'paste' ],
    \         [ 'readonly', 'filename', 'modified', 'gitbranch', 'syntastic_syntastic_statusline_flag', 'syntastic_warningmsg' ]
    \     ]
    \ },
    \ 'component': {
    \   'syntastic_syntastic_statusline_flag': '%{SyntasticStatuslineFlag()}',
    \   'syntastic_warningmsg': '%warningmsg',
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }

set laststatus=2

" ** vim-terraform "
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
