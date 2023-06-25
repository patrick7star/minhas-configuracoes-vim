# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # componentes do prompt.
    abreC="\[\033[01;31m\][\[\033[00m\]"
    fechaC="\[\033[01;31m\]]\[\033[00m\]"
    id="\[\033[00;34m\]\u\[\033[0m\]"
    carretel="\[\033[00;33m\]\$ \[\033[0m\]"
    caminho="\033[01;35m\]\W\[\033[0m"
    separador="\033[01;33m@\033[00m"
    servidor="\033[38;5;198m\033[04;23m\H\]\]\033[00m\]"
    carretel="\[\033[38;5;32m ⇨ \033[0m\] "
    PS1="$abreC$id$separador$servidor:$caminho$fechaC$carretel"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



########################################################
#                                                      #
#          Minhas Variáveis(atalhos para               #
#          diretório em terminal)                      #
#                                                      #
########################################################

PYTHON_CODES="$HOME/Documents/python-codes"
RUST_CODES="$HOME/Documents/rust-codes"
OTHER_CODES="$HOME/Documents/other-codes"
export PYTHON_CODES RUST_CODES OTHER_CODES
# meus apelidos(comandos[atalho para "área de trabalho")
alias irdesktop="echo '$OLDPWD ==> $HOME/Desktop'; cd $HOME/Desktop"
alias python-teste="python3 -B"
alias python="python3"
source "$HOME/.cargo/env"
alias horario='echo -e "\n\t$(date +"%Ih %Mmin %Sseg")\n"'
#alias repara="stty sane"
alias repara="tput reset"
alias desligar="systemctl poweroff -i"

# registrando nova cores para nova extensão.
LS_COLORS="$LS_COLORS*.dat=38;5;202:"

# visualizar meu IP público.
alias meu_ip="wget -qO - checkip.amazonaws.com"

# adicionando novo caminho na "base":
PATH="$PATH:$HOME/.local/usr/bin"

# atalho para VIm.
alias VIm="mate-terminal --profile=VIM"

ATUAL_DIR="\[\033[38;5;168m\]\W\[\033[0m\]"
CARRETEL="\[\033[38;5;11m\]\$ \[\033[0m\]"
PS1="[$ATUAL_DIR]..$CARRETEL"

# controlador do Som.
alias autofalante-off="amixer -c 0 cset numid=3 mute >> /dev/null"
#alias autofalante-on="amixer -c 0 cset numid=3 100%, unmute && amixer -c 0 cset numid=4 100%, unmute"
alias autofalante-on="amixer -c 0 cset numid=3 100%, unmute  > /dev/null && amixer -c 0 cset numid=4 100%, unmute > /dev/null"

# lista de 'caixotes' que o Rust baixou.
alias cargo-lista="ls $HOME/.cargo/registry/src/github.com-1ecc6299db9ec823/"

# adicionando complementações por tab no utilitáris do Rust.
source "$HOME/.local/share/bash-completions/completions/rustup"
source "$HOME/.local/share/bash-completions/completions/cargo"

export OPENAI_API_KEY='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'
