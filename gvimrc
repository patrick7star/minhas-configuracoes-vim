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

let g:esquemas_cores = [
\ "onedark", "gruvbox", "tender",
\ "papercolor", "onehalfdark", 
\ "one", "solarized","aurora",
\ "sublimemonokai"]
   
" escolha um tema aleatório dos disponíveis.
function SelecionaTema()
   let num_selecionado = randomico#Aleatorio0a9()
   let calculo = l:num_selecionado % len(g:esquemas_cores) 
   let tema_escolhido = g:esquemas_cores[l:calculo]
   return l:tema_escolhido
endfunction

" função que troca o esquema de cores ao ser chamada.
function MudaTema(escolha)
   if a:escolha == "onedark"
      "OneDark Theme
      if (has("termguicolors"))
        set termguicolors
      endif
      syntax on 
      colorscheme onedark
      set background=dark
      let g:airline_theme='onedark'
      let g:lightline ={'colorscheme':'onedark'}
   elseif a:escolha == "aurora"
      "Aurora
      set termguicolors
      colorscheme aurora
   elseif a:escolha == "sublimemonokai"
      syntax on 
      colorscheme sublimemonokai
   elseif a:escolha == "solarized"
      "Solarized
      set background=dark
      colorscheme solarized
      let g:solarized_contrast=1
      let g:solarized_visibility=1
      let g:solarized_bold=1
      let g:solarized_degrade=1
   elseif a:escolha == "gruvbox"
      "Gruvbox
      set t_Co=256
      colorscheme gruvbox
      set background=dark
   elseif a:escolha == "tender"
      "Tender Theme
      if (has("termguicolors"))
         set termguicolors
      endif
      syntax enable
      colorscheme tender
      let g:lightline={'colorscheme':'tenderplus'}
      let g:airline_theme='tender'
   elseif a:escolha == "papercolor"
      " PaperColor Theme
      set t_Co=256
      set background=dark
      colorscheme PaperColor
      let g:PaperColor_Theme_Options = {'python':{'highlight_builtins':1}}
   elseif a:escolha == "onehalfdark"
      " OneHalf Theme
      set t_Co=256
      set cursorline
      colorscheme onehalfdark
      let g:airline_theme='onehalfdark'
      " lightline
      let g:lightline={'colorscheme':'onehalfdark'}
      if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
      endif
   else
      "Vim One
      colorscheme one
      set background=dark
      let g:one_allow_italic=1
      let g:airline_theme='one'
   endif
endfunction

"tem inicial seleicionado ...
call MudaTema(SelecionaTema())

" com um temporizador como argumento
" troca para novo esquema a cada 1h.
"function TrocaEsquemaDeCores(temporizador_de_troca)
"   call MudaTema(SelecionaTema())
"endfunction
" criando temporizador para determinada função ...
" nunca esgota desde o primeiro acionamento.
"let temporizador_de_troca = timer_start(
"\60*60*1000, 
"\'TrocaEsquemaDeCores', 
"\{'repeat':-1}
"\)

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
\6*1000,
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


