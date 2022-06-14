
set tabstop=3  
set shiftwidth=3
set softtabstop=3
set expandtab " definindo tabs como espaços.
set autoindent " indentação automática.
"set smartindent "indentação inteligente.

" opções do editor:
set number " mostrar linhas
set nowrap " não dobrar linha.

"set lines=33
set incsearch " realça primeira palavra detectada.
set cursorline

" ativando sintaxe-python:
let g:python_highlight_all=1

" ocultando diretórios gits:
"let g:netrw_list_hide='.*\.swp$'
"let g:netrw_list_hide= netrw_gitignore#Hide().'.*\.swp$'
let g:netrw_list_hide= '^\..*'

" ativando cursor(mouse).
set mouse=a

" novas váriavels de ambiente.
call setenv("RUST_CODES", "$HOME/Documents/códigos_rust")
call setenv("PYTHON_CODES", "$HOME/Documents/códigos/")

" chama função inicialmente para ter um esquema
" de cor no ínicio do programa. A mesma função
" que seleciona o próximo aleatóriamente, vai
" cuidar da 'seleção inicial'.
call temas_i#MudaTema(temas_i#SelecionaTema())

" aparência da dobra.
set foldtext=dobra#FoldMsg()
" tipo de escolher indentação mais conveniênte.
set foldmethod=indent

