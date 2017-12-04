set cursorline
set number
set tabstop=2
syntax on
set autoindent
set expandtab

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()  " Start Vundle

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" let Vundle manage Vundle, required
Plugin 'itchyny/lightline.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tell-k/vim-autopep8'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'godlygeek/tabular'

call vundle#end() " End Vundle
filetype plugin indent on

" ** Syntastic **
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ** LightLine **
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'gitbranch', 'syntastic_syntastic_statusline_flag', 'syntastic_warningmsg' ] ]
      \ },
      \ 'component': {
      \   'syntastic_syntastic_statusline_flag': '%{SyntasticStatuslineFlag()}',
      \   'syntastic_warningmsg': '%warningmsg',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
