
   set nocompatible              " be iMproved, required
   filetype off                  " required

   " set the runtime path to include Vundle and initialize
   set rtp+=~/.vim/bundle/Vundle.vim
   call vundle#begin()
   " alternatively, pass a path where Vundle should install plugins
   "call vundle#begin('~/some/path/here')

   " let Vundle manage Vundle, required
   Plugin 'VundleVim/Vundle.vim'

   " The following are examples of different formats supported.
   " Keep Plugin commands between vundle#begin/end.
   " plugin on GitHub repo
   Plugin 'tpope/vim-fugitive'
   " plugin from http://vim-scripts.org/vim/scripts.html
   " Plugin 'L9'
   " Git plugin not hosted on GitHub
   Plugin 'git://git.wincent.com/command-t.git'
   " git repos on your local machine (i.e. when working on your own plugin)
   Plugin 'file:///home/gmarik/path/to/plugin'
   " The sparkup vim script is in a subdirectory of this repo called vim.
   " Pass the path to set the runtimepath properly.
   Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
   " Install L9 and avoid a Naming conflict if you've already installed a
   " different version somewhere else.
   " Plugin 'ascenator/L9', {'name': 'newL9'}

   " All of your Plugins must be added before the following line
   call vundle#end()            " required
   filetype plugin indent off    " required
   " To ignore plugin indent changes, instead use:
   "filetype plugin on
   "
   " Brief help
   " :PluginList       - lists configured plugins
   " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
   " :PluginSearch foo - searches for foo; append `!` to refresh local cache
   " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
   "
   " see :h vundle for more details or wiki for FAQ
   " Put your non-Plugin stuff after this line
   
" definindo tabs como espaços.
set expandtab 
" indentação automática.
"set autoindent 
"indentação inteligente.
"set smartindent 
" espaçamentos utilizados.
set tabstop=3  
set shiftwidth=3
set softtabstop=3

" opções do editor:
set number " mostrar linhas
set wrap " dobrar linha.

set incsearch " realça primeira palavra detectada.
set cursorline

" ocultando diretórios gits:
"let g:netrw_list_hide= '^\..*'

" ativando cursor(mouse).
set mouse=a

" novas váriavels de ambiente.
call setenv("RUST_CODES", "$HOME/Documents/códigos/rust-codes")
call setenv("PYTHON_CODES", "$HOME/Documents/códigos/python-codes/")
call setenv("OTHER_CODES", "$HOME/Documents/códigos/other-codes/")
call setenv("CODES", "$MY_CODES")

" chama função inicialmente para ter um esquema
" de cor no ínicio do programa. A mesma função
" que seleciona o próximo aleatóriamente, vai
" cuidar da 'seleção inicial'.
call temas#MudaTema(temas#SelecionaTema())

" aparência da dobra.
set foldtext=dobra#FoldMsg()
" tipo de escolher indentação mais conveniênte.
set foldmethod=indent

" muda para o diretório do atual arquivo.
set autochdir

" ativando sintaxe-python:
let g:python_highlight_all=1
" configuração do Rust:
let g:rustfmt_autosave = 1
"let g:rust_fold = 0
syntax enable

" ~~~ ~~~ ~~~ CONFIGURAÇÃO DE PLUGINS ~~~~ ~~~ ~~~ 

" Auto-Pairs
Plugin 'auto-pairs'
" -- Fly-Mode:
"let g:AutoPairsFlyMode = 1
"let g:AutoPairsShortcutBackInsert = '<M-b>'
" -- opções:
" Ctrl + i para desligar/ligar o AutoPairs.
let g:AutoPairsShortcutJump = '<M-n>'
let g:AutoPairsShortcutToggle = "<M-p>"
let g:AutoPairs = {
\ '(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`',
\ '/*':'*/' 
\}


" YouCompleteMe
"Plugin 'valloric/youcompleteme'
" -- opções:


"  Jedi Python
"Plugin 'davidhalter/jedi-vim'
" -- opções:
"let g:jedi#popup_on_dot=0
"let g:jedi#use_splits_not_buffers="left" 
"let g:jedi#popup_select_first=0

let g:CommandTPreferredImplementation='lua'
