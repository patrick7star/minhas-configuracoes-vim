
" entra no diretório do atual 'dir' na página netrw.
function acessodir#DiretorioNetRW()
   let l:lista = getwininfo()
   let l:dir = v:t_none
   for item in l:lista
      let l:variaveis = item['variables']
      if !empty(l:variaveis)
         if has_key(l:variaveis, "netrw_rexdir")
            let l:dir = l:variaveis['netrw_rexdir']
         elseif has_key(l:variaveis, "netrw_prvdir")
            let l:dir = l:variaveis['netrw_prvdir']
         endif
      endif
   endfor
   return l:dir
endfunction

" função que registra na variável o atual
" diretório que está.
function acessodir#RegistraAtualDir(salva_dir)
   let l:caminho = acessodir#DiretorioNetRW()
   " não é válido o mesmo caminho.
   let l:ja_esta_aqui = getcwd() == l:caminho
   if l:caminho != v:t_none 
   \&& isdirectory(l:caminho) 
   \&& !l:ja_esta_aqui
      echo 'acessando ...' l:caminho
      call chdir(l:caminho)
   endif
endfunction

" temporizador que aciona 'registra_cwd' à cada 10min.
let salva_dir = timer_start(
\  120 * 1000,
\  'acessodir#RegistraAtualDir',
\  {'repeat':0 }
\)
