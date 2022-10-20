
" todos temas instalados.
let g:esquemas_cores = [
\  "shades_of_purple", 
\  "one",
\  "everforest",
\  "gruvbox",
\  "tender",
\  "rigel",
\  "one_half_dark",
\  "sonokai",
\  "PaperColor" ]

" escolha um tema aleatório dos disponíveis.
function temas#SelecionaTema()
   let fim = len(g:esquemas_cores)-1
   let indice = randomico#AleatorioI(0, fim) 
   let tema_escolhido = g:esquemas_cores[l:indice]
   return l:tema_escolhido
endfunction

" função que troca o esquema de cores ao ser chamada.
function temas#MudaTema(escolha)
   " caindo na seleção ...
   if a:escolha == "gruvbox"
      " GRUVBOX theme.
      colorscheme gruvbox
      let g:gruvbox_termcolors=256
      "set background=light
      set background=dark

   elseif a:escolha == 'everforest'
      " Everforest theme.
      colorscheme everforest
      set background=dark

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

   elseif a:escolha == 'one'
      "One theme:
      colorscheme one
      "set background=light
      set background=dark
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
      set background=dark
      colorscheme PaperColor
      let g:PaperColor_Theme_Options = {'python':{'highlight_builtins':1}}
   endif

   " registra o tema escolhido.
   call setenv("ATUAL_TEMA", a:escolha)
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
