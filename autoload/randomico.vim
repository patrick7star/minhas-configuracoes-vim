
" gerador randômico bem mais eficiente
" que o acima.
function randomico#AleatorioI(i, f)
   let linhas = readfile("/dev/random", "b", 10)
   " computando número ...
   let S = 0

   " soma os bytes de todas as linhas.
   let qtd_de_linhas = len(l:linhas)
   while l:qtd_de_linhas > 1
      let posicao = l:qtd_de_linhas - 1
      let linha = l:linhas[l:posicao]
      " total de bytes da string.
      let indice = len(l:linha)
      while l:indice > 1
         let S = l:S + l:linha[l:indice-1]
         let indice = l:indice - 1
      endwhile
      let qtd_de_linhas = l:qtd_de_linhas - 1
   endwhile

   return a:i + l:S % ((a:f-a:i) + 1)
endfunction

" sabatina de testes:
function TesteAleatorio(temporizador)
   let mensagem = printf(
   \ "número randômico: %d",
   \ randomico#AleatorioI(1, 100)
   \)
   " visualizando ...
   echo l:mensagem
endfunction

" thread que sortea número aleatório.
let temporizador = timer_start(
\640 * 1000,
\"TesteAleatorio",
\{'repeat':-1}
\)


function randomico#Booleano()
   let verdadeiro = randomico#AleatorioI(1, 10)
   if l:verdadeiro <= 5
      return v:true
   else
      return v:false
   endif
endfunction
