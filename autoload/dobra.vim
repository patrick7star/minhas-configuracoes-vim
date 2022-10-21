
" mensagem explicando o que foi dobrado.
function dobra#FoldMsg()
   let l:qtd = abs(v:foldstart - v:foldend) + 1
   if l:qtd == 1
      return "---- 1 linha "
   else
      let l:tracos = repeat('-', v:foldlevel * 3)
      let l:barra = join(['+',tracos, '-'], '')
      return join([l:barra,"{", l:qtd, "linhas } "])
   endif
endfunction
