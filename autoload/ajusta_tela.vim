
let g:exibicoes = 0
function ajusta_tela#RetornaDimensaoInicial(temporizador_resize)
   " razão 33 linhas/225 pixels
   " só muda quantia de linhas se não bater 
   " a quantia inicial de pixels.
   let altura = getwininfo()[0]['height']
   if l:altura != 40
      winsize 80 50
      winpos 282 28
      echo printf("a tela será redimensionada...")
      echo printf("altura em %d.", l:altura)
      let g:exibicoes=0
   else
      if g:exibicoes < 5
         echo printf("altura da tela mantida ...(%d)", g:exibicoes)
      endif
      let g:exibicoes+=1
   endif
endfunction

