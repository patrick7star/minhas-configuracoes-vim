
" todos temas instalados.
let g:esquemas_cores = [
\  "shades_of_purple", 
\  "one",
\  "everforest",
\  "gruvbox",
\  "tender",
\  "rigel",
\  "one_half_dark",
\  "onehalflight",
\  "sonokai",
\  "PaperColor",
\  "sublimemonokai",
\  "solarized",
\  "aurora",
\  "onedark",
\  "tatami"
\]

" escolha um tema aleatório dos disponíveis.
function temas#SelecionaTema()
   let fim = len(g:esquemas_cores)-1
   let indice = randomico#AleatorioI(0, fim) 
   let tema_escolhido = g:esquemas_cores[l:indice]
   return l:tema_escolhido
endfunction

" função que troca o esquema de cores ao ser chamada.
function temas#MudaTema(escolha)
   call EmbalharaTemas()
   " caindo na seleção ...
   if a:escolha == "gruvbox"
      " GRUVBOX theme.
      colorscheme gruvbox
      let g:gruvbox_termcolors=256
      " versão escura ou clara.
      if randomico#Booleano()
         set background=light
      else
         set background=dark
      endif

   elseif a:escolha == 'everforest'
      " Everforest theme.
      colorscheme everforest
      if randomico#Booleano()
         set background=light
      else
         set background=dark
      endif

   elseif a:escolha == 'tender'
      " TENDER theme.
      if (has("termguicolors"))
         set termguicolors
      endif
      colorscheme tender
      let g:lightline={'colorscheme':'theme'}
      let g:airline_theme = 'tender'

   elseif a:escolha == "rigel"
      " Rigel theme:
      set termguicolors
      syntax enable
      colorscheme rigel
      let g:rigel_airline = 1
      let g:airline_theme = 'rigel'
      let g:rigel_lightline = 1
      let g:lightline = { 'colorscheme':'rigel' }

   elseif a:escolha == 'one_half_dark'
      " OneHalfDark theme:
      set t_Co=256
      "set cursorline
      colorscheme onehalfdark
      let g:airline_theme='onehalfdark'
      "lightline:
      "let g:lightline = {'colorscheme':'onehalflight'}

   elseif a:escolha == 'onehalflight'
      " OneHalfLight theme:
      set t_Co=256
      "set cursorline
      colorscheme onehalflight
      "let g:airline_theme='onehalflight'
      "lightline:
      let g:lightline = {'colorscheme':'onehalflight'}

   elseif a:escolha == 'one'
      "One theme:
      colorscheme one
      " versão escura ou clara.
      if randomico#Booleano()
         set background=light
      else
         set background=dark
      endif
      let g:airline_theme='one'

   elseif a:escolha == 'shades_of_purple'
      " Shades of Purple
      "syntax enable
      colorscheme shades_of_purple
      if (has("termguicolors"))
       set termguicolors
      endif
      let g:shades_of_purple_lightline = 1
      let g:lightline = { 'colorscheme': 'shades_of_purple' }
      syntax on

   elseif a:escolha == "sonokai"
      " Sonokai Theme
      colorscheme sonokai
      set background=dark

   elseif a:escolha == "PaperColor"
      " PaperColor Theme
      set t_Co=256
      " versão escura ou clara.
      if randomico#Booleano()
         set background=light
      else
         set background=dark
      endif
      colorscheme PaperColor
      let g:PaperColor_Theme_Options = {'python':{'highlight_builtins':1}}

   elseif a:escolha == "sublimemonokai"
      syntax on
      colorscheme sublimemonokai
      set termguicolors
      set t_Co=256
      if randomico#Booleano()
         " talvez dê uma tonalidade diferente, más,
         " ainda no 'modo escuro'.
         set background=light
         set background=dark
      else
         call printf("tonalidade padrão")
      endif

   elseif a:escolha == "aurora"
      colorscheme aurora
      set background=dark
      set termguicolors

   elseif a:escolha == "solarized"
      syntax enable
      if randomico#Booleano()
         set background=light
      else
         set background=dark
      endif
      let g:solarized_termcolors=256
      colorscheme solarized

   elseif a:escolha == "onedark"
      syntax on 
      colorscheme onedark
      " a tonalidade muda para algo bom, ainda
      " questionável, porém muda bastante a tonalidade,
      " para algo legível. Deixo em dúvida, pode
      " ser retirado futuramente.
      if randomico#Booleano()
         set background=light
      else
         set background=dark
      endif
      let g:onedark_terminal_italics=1
      let g:onedark_termcolors=256

   elseif a:escolha == "tatami"
      colorscheme tatami 
      if randomico#Booleano()
         set background=light
      else
         set background=dark
      endif
   endif
      

   " registra o tema escolhido.
   call setenv("ATUAL_TEMA", a:escolha)
   " visualizando tema escolhido.
   call printf("====> '%s'", a:escolha)
endfunction

" filtra temas intrisica ao sistema.
function temas#Filtra()
   let l:caminho = "/usr/share/vim/vim81/colors"
   let l:lista = []
   for entrada in readdir(l:caminho)
      let l:p1 = entrada != "tools"
      let l:p2 = entrada != "README.txt"
      if l:p2 && l:p1
         call add(l:lista, entrada)
      endif 
   endfor
   return l:lista
endfunction

" seleciona, especificamente, temas do sistema.
function temas#SelecionaTemaSistema()
   let l:lista = temas#Filtra()
   let l:qtd = len(l:lista) 
   let l:indice = temas#SorteaValor(l:qtd)
   return l:lista[l:indice]
endfunction


" mostra o atual esquema de cor frequentemente.
function TemaNome(tema_nome)
   echo printf("tema atual: '%s'", getenv("ATUAL_TEMA"))
endfunction

" uma thread que mostra o nome do atual tema.
let tema_nome = timer_start(
\  382 * 1000,
\  "TemaNome",
\  {'repeat': -1 }
\)

" função embaralha array para que equalizar ainda
" mais a chance de qualquer tema
function EmbalharaTemas()
   " tamanho da lista de temas.
   let total = len(g:esquemas_cores)
   " quantia de vezes que serão alternadas(metade do total).
   let qtd = l:total / 2
   while l:qtd > 0
      let p = randomico#AleatorioI(0, l:total-1)
      let q = randomico#AleatorioI(0, l:total-1)
      if l:p != l:q
         let auxiliar = g:esquemas_cores[l:p]
         let g:esquemas_cores[l:p] = g:esquemas_cores[l:q]
         let g:esquemas_cores[l:q] = l:auxiliar
      endif
      let qtd = l:qtd - 1
   endwhile
endfunction

" probabilidade de está 'claro'/'escuro'.
function s:probabilidadeEstaClaro(hora)
   if a:hora >= 11 && a:hora <=15
      return 0.83
   elseif a:hora >= 7 && a:hora < 11
      return 0.65
   else
      return 0.50
endfunction
function s:probabilidadeEstaEscuro(hora)
   if a:hora >= 20 && a:hora <=6
      return 0.81
   elseif a:hora >= 16 && a:hora < 20
      return 0.66
   else
      return 0.50
endfunction
