
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
function temas_i#SelecionaTema()
   let numero = string(localtime())
   let num_selecionado = str2nr(l:numero[strlen(l:numero)-1])
   let calculo = l:num_selecionado % len(g:esquemas_cores)
   let tema_escolhido = g:esquemas_cores[l:calculo]
   return l:tema_escolhido
endfunction

" função que troca o esquema de cores ao ser chamada.
function temas_i#MudaTema(escolha)
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
endfunction
