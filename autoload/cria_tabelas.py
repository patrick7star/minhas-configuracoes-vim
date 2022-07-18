#!/usr/bin/python3.8

"""
Script auxiliar em Python para criação de
várias tabelas "geradores de números
randômicos". Em microsegundos todas elas
que levaria minutos e horas feitas pela
linguagem do VIm.
"""

from random import randint
from os import makedirs, getenv 
from os.path import join as join_paths

RAIZ = join_paths(getenv("HOME"), ".vim/autoload/tabelas")

def linha():
   string = []
   for _ in range(10):
      string.append(str(randint(0, 9)))
   ...
   return "".join(string)
...

# criando diretórios se necessário.
if __debug__:
   print("criando ... \"%s\"" % RAIZ)
else:
   # criando realmente os diretórios...
   makedirs(RAIZ, 511, True)

for indice in range(1, 100 + 1):
   nome = "tabela_%0.3i.txt" % indice
   print(nome, "...", end='')
   caminho = join_paths(RAIZ, nome)
   if __debug__:
      print("caminho: '%s'" % caminho)
      print("nome: '%s'" % nome)
   else:
      with open(caminho, "wt") as arquivo:
         # escrevendo dez linhas.
         for _ in range(10):
            arquivo.write(linha() + '\n')
         ...
         arquivo.close()
      ...
   ...
   print("terminada com sucesso.")
...
