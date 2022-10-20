
set tabstop=3  
set shiftwidth=3
set softtabstop=3
set expandtab " definindo tabs como espaços.
set autoindent " indentação automática.
"set smartindent "indentação inteligente.

" opções do editor:
set number " mostrar linhas
set nowrap " não dobrar linha.

"set lines=35
"set columns=80
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
call setenv("RUST_CODES", "$HOME/Documents/rust-codes")
call setenv("PYTHON_CODES", "$HOME/Documents/python-codes/")

" chama função inicialmente para ter um esquema
" de cor no ínicio do programa. A mesma função
" que seleciona o próximo aleatóriamente, vai
" cuidar da 'seleção inicial'.
call temas#MudaTema(temas#SelecionaTema())

" aparência da dobra.
set foldtext=dobra#FoldMsg()
" tipo de escolher indentação mais conveniênte.
set foldmethod=indent

" sabatina de testes:
function TesteAleatorio(temporizador)
   echo printf("número randômico: %d",randomico#AleatorioI(1, 100))
endfunction

let temporizador = timer_start(
\20 * 60 * 1000,
\"TesteAleatorio",
\{'repeat':-1}
\)

" troca de nomes dos arquivos de tabela 
" à cada meia-hora.
function TrocaNomesDeArquivos(embaralha)
   call randomico#Embaralha()
endfunction

let embaralha = timer_start(
\45 * 60 * 1000,
\"TrocaNomesDeArquivos",
\{'repeat': 3}
\)

" visualizando atual tema.
function NomeDoTema(mostra_nome)
   let nome = getenv("ATUAL_TEMA")
   echo printf("o tema atual é '%s'", l:nome)
endfunction

" à cada 15min.
let mostra_nome = timer_start(
\ 15 * 60 * 1000,
\ "NomeDoTema",
\{ 'repeat': 5 }
\)
cat: 1: No such file or directory
