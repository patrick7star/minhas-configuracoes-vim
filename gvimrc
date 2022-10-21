set guioptions-=L
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guifont=Monaco\ Regular\ 11  " modificando a fonte do programa.

" tabulação e indentação.
set autoindent
set shiftwidth=3
set softtabstop=3
set expandtab
set tabstop=3 

set number " faz o editor mostrar linhas.

" não dobra ao colidir com a borda.
set nowrap

" dimensão da janela.
set lines=33 " 30 caractéres verticalmente.
set columns=80 " 80 caractéres horizontalmente.

"set hlsearch  realçar buscas.
set incsearch " realçar primeira palavra enquanto digita.
" marcar a linha do cursor.
set cursorline
" dobrador automático.
set foldmethod=indent


"ocultando o entulho...
let g:netrw_list_hide= '^\..*'
"let g:netrw_list_hide= '.*\.swp$'


"tem inicial seleicionado ...
"call MudaTema(SelecionaTema())
call temas#MudaTema(temas#SelecionaTema())

function RetornaDimensaoInicial(temporizador_resize)
   " razão 33 linhas/225 pixels
   " só muda quantia de linhas se não bater 
   " a quantia inicial de pixels.
   let altura = getwininfo()[0]['height']
   if l:altura != 32
      "winheight(33)
      set lines=33
   endif
endfunction

" temporizador retorna dimensão inicial:
let temporizador_resize = timer_start(
\600*1000,
\'RetornaDimensaoInicial',
\{'repeat':-1}
\)

function DobraMensagem()
   let l:qtd = abs(v:foldstart - v:foldend)+1
   let l:recuo = repeat("---", v:foldlevel)
   let l:informacao = join([l:qtd, "linhas"])
   let l:barra = join([
   \"+--", l:recuo,
   \'[', l:informacao,
   \']'], '') 
   return l:barra
endfunction

set foldtext=DobraMensagem()

" caminhos para diretórios com códigos:
call setenv("RUST_CODES", "/home/savio/Documents/códigos_rust")
call setenv("PYTHON_CODES", "/home/savio/Documents/códigos")


