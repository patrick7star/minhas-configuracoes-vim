
function randomico#Numero0a9()
   let t1 = str2nr(string(localtime()))
   let t2 = str2nr(string(localtime()))
   let t3 = str2nr(string(localtime()))
   let tempo = abs(l:t1 * l:t2 * l:t3)
   return l:tempo % 10
endfunction

function randomico#GeraLinha()
   let linha = [] 
   for _ in range(10)
      call add(l:linha, randomico#Numero0a9())
      sleep 1
   endfor 
   return join(l:linha,"")
endfunction

function randomico#TodoConteudo()
   let lista = []
   for _ in range(10)
      call add(l:lista, randomico#GeraLinha())
   endfor
   return l:lista
endfunction

let g:caminho = ".vim/autoload/tabelas"

function randomico#TotalTabelas()
   if isdirectory(g:caminho)
      let lista = readdir(g:caminho)
      return len(l:lista)
   else
      return 0
endfunction

" cria novo par de tabelas.
function randomico#CriaTabelas()
   " cria diretórios se necessário.
   call mkdir(g:caminho, "p", 0755)

   " para em caso de excesso.
   let total = randomico#TotalTabelas()
   if  l:total < 100
      for indice in range(1, 2)
         let i = l:total + indice
         let arquivo = printf("%s/tabela_%i.txt", g:caminho, i)
         call writefile(randomico#TodoConteudo(), l:arquivo, "w")
      endfor
   endif
endfunction

" só funciona bem repetidamente se, 
" chamada em intervalos. 
function randomico#AleatorioNatural(limite)
   let numero = localtime()
   return l:numero % (a:limite + 1)
endfunction

" cursores dos arquivos trabalhados.
let g:atual = randomico#Numero0a9()
let g:coluna = randomico#Numero0a9()
let g:linha = randomico#Numero0a9() 

function randomico#Aleatorio0a9()
   " reseta variáveis.
   if g:atual == 3000
      let atual = 0
   elseif g:linha == 1083 
      let linha = 5
   elseif g:coluna == 997 
      let coluna = 0
   endif

   if randomico#TotalTabelas() >= 2
      let lista = readdir(g:caminho)
      let qtd = len(l:lista)
      let arquivo = printf("%s/%s",g:caminho, l:lista[g:atual % l:qtd])
      let conteudo = readfile(l:arquivo)
      let lin = l:conteudo[g:linha % 10]
      let col = l:lin[g:coluna % 10]
      let g:atual += 1
      let g:linha += 1
      let g:coluna += 1
      return str2nr(l:col, 10)
   else
      return randomico#Numero0a9()
   endif
endfunction

" renomea par de tabelas para gerar ainda 
" mais 'ruído'.
function randomico#RenomeaParTabela()
   let total = randomico#TotalTabelas()
   if l:total >= 2 
      let tabelas = readdir()
      let t = l:total - 1
      let p = randomico#AleatorioNatural(l:t)
      let primeiro = printf(
      \"%s/%s",
      \g:caminho,
      \l:tabelas[l:p]
      \)
      sleep 7
      let s = randomico#AleatorioNatural(l:t)
      let segundo = printf(
      \"%s/%s",
      \g:caminho,
      \l:tabelas[l:s]
      \)
      if l:primeiro != l:segundo
         let aux = printf("%s/auxiliar.txt", g:caminho)
         call rename(l:primeiro, aux)
         call rename(l:segundo, l:primeiro)
         call rename(l:aux, l:segundo)
      endif
   endif
endfunction

