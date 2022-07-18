
let g:caminho = printf("%s/.vim/autoload/tabelas", getenv("HOME"))

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
function randomico#AleatorioNatural(limite)
   let numero = localtime()
   return l:numero % (a:limite + 1)
endfunction

function Numero0a9()
   return randomico#AleatorioNatural(9)
endfunction

" cursores dos arquivos trabalhados.
let g:atual = Numero0a9()
let g:coluna = Numero0a9()
let g:linha = Numero0a9() 

function randomico#Aleatorio0a9()
   if TotalTabelas() >= 2
      " todas possíveis tabelas.
      let lista = readdir(g:caminho)
      let qtd = len(l:lista)
      let arquivo = printf(
      \"%s/%s",
      \g:caminho, 
      \l:lista[g:atual % l:qtd]
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
      " se não houver 'tabelas', uso rotina
      " simples até que haja no mínimo duas.
      call randomico#CriaTabelas()
      return Numero0a9()
   endif
endfunction

