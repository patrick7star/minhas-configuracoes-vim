
" núcleo de caminho até as tabelas.
let g:caminho = printf(
\  "%s/.vim/autoload/tabelas",
\   getenv("HOME")
\)

function TotalTabelas()
   if isdirectory(g:caminho)
      let lista = readdir(g:caminho)
      return len(l:lista)
   else
      return 0
endfunction

" cria novo par de tabelas.
function randomico#CriaTabelas()
   " para em caso de excesso.
   let total = TotalTabelas()
   if  l:total < 100
      let caminho_script = printf(
      \"%s/%s/cria_tabelas.py", 
      \getenv("HOME"),
      \".vim/autoload",
      \)
      let comando = printf(
      \  "/usr/bin/python3.8 -O %s", 
      \  l:caminho_script
      \)
      call system(l:comando)
      echo "comando executado com sucesso!"
   endif
endfunction

" só funciona bem repetidamente se, 
" chamada em intervalos. 
function AleatorioNatural(limite)
   let numero = localtime()
   return l:numero % (a:limite + 1)
endfunction

" 'alias' para a função acima.
function Numero0a9()
   return AleatorioNatural(9)
endfunction

" cursores dos arquivos trabalhados.
let g:atual = Numero0a9()
let g:coluna = Numero0a9()
let g:linha = Numero0a9() 

" também gera algarismos aleatórios de 
" 0 à 9, porém utiliza-se das tabelas.
function Aleatorio0a9()
   if TotalTabelas() >= 2
      " todas possíveis tabelas.
      let lista = readdir(g:caminho)
      let qtd = len(l:lista)
      let arquivo = printf(
      \  "%s/%s",
      \  g:caminho, 
      \  l:lista[g:atual % l:qtd]
      \)
      let conteudo = readfile(l:arquivo)
      let lin = l:conteudo[g:linha % 10]
      let col = l:lin[g:coluna % 10]
      " incrementa todos 'índices do mapa'.
      let g:atual += 1
      let g:linha += 1
      let g:coluna += 1
      " converte num decimal.
      return str2nr(l:col, 10)
   else
      return Numero0a9()
   endif
endfunction

" cria todas tabelas necessárias para 
" a geração de valores randômicos.
if TotalTabelas() != 100
   call randomico#CriaTabelas()
endif

" amplia 'range' de valores aleatórios 
" gerados usando as tabelas.
function randomico#Aleatorio(inicio, fim)
   let X = Aleatorio0a9()
   let qtd_digitos = float2nr(log10(a:fim)) + 1

   for p in range(l:qtd_digitos)
      let Y = Aleatorio0a9()
      let Z = float2nr(l:Y * pow(10, p))
      let X_copia = l:X
      let X = l:X_copia + l:Z
   endfor

   let c = a:fim - a:inicio
   return (l:X % (l:c + 1)) + a:inicio
endfunction

" embaralha arquivos das tabelas.
function randomico#Embaralha()
   let lista = readdir(g:caminho)
   let fim = len(l:lista) - 1
   let posicao =randomico#Aleatorio(0, l:fim)
   let primeira = l:lista[l:posicao]
   let posicao = randomico#Aleatorio(0, l:fim)
   let segunda = l:lista[l:posicao]
   if l:primeira != l:segunda
      let str = printf(
      \"renomeando ... '%s' para '%s'", 
      \l:primeira, l:segunda
      \)
      echo l:str
      " gerando caminhos de ambos arquivos.
      let path1 = printf("%s/%s", g:caminho, l:primeira)
      let path_aux = printf("%s/auxiliar.txt", g:caminho)
      let path2 = printf("%s/%s", g:caminho, l:segunda)
      " realizando renomeações:
      " PATH1 -> AUX, 
      " então PATH2 -> PATH1,
      " e por fim AUX->PATH2
      call rename(path1, path_aux)
      call rename(path2, path1)
      call rename(path_aux, path2)
   endif
endfunction

