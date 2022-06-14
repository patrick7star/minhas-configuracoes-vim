# Meu VIm
Eu tenho minhas próprias personalizações do `vim`, então vou colocar-lás aqui, tanto para backup, como para futuros compartilhamentos entres computadores.

## Como instalar
Se você saber como o vim funciona é apenas mover para os apropriados diretórios que cada pertence. Com atenção no `vimrc` que é um arquivo 
na verdade oculto, e fica na verdade no diretório `HOME`. Porém, se é um leigo, apenas `unzip`tal pacote, e aplique os seguintes 
comandos.
```bash
# temas importantes.
mv -uv autoload/* $HOME/.vim/autoload/*
mv -uv colors/* $HOME/.vim/colors/*

# arquivo de configuração.
mv $HOME/.vimrc $HOME/.vimrc_backup
mv -u vimrc $HOME/
# renomeando ...
mv $HOME/vimrc $HOME/.vimrc
```
