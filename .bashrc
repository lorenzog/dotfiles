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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    screen-* | xterm-color | screen-256color) color_prompt=yes;;
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

# some more ls aliases
alias ll='ls -laFh'
#alias la='ls -A'
alias l='ls -aF'
alias lt='ls -lctr'

# unset color_prompt force_color_prompt
export EDITOR='/usr/bin/vim'
shopt -s cdspell
export LANGUAGE=$LANG

if [ ! -p $HOME/.cd-socket ] ; then 
    mkfifo $HOME/.cd-socket
fi
alias rcd='cd $(cat $HOME/.cd-socket)'
alias pcd='echo $PWD > $HOME/.cd-socket'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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

# ignore case in shell completion
set completion-ignore-case on
# sudo path!!
#alias sudo='sudo env PATH=$PATH'

test -d "${HOME}"/bin && export PATH=${PATH}:${HOME}/bin

export PATH=${PATH}:${HOME}/.local/bin

alias svnvim='svn diff --diff-cmd "${HOME}"/bin/diffwrap.sh'

XTERM_TITLE="\e]2;\u@\h:\w\a"
# colours
if [ ! -z "${DEMO}" ] ; then
	PS1="$XTERM_TITLE\u\e[37;1m@\e[0m\h:\w\n [$DEMO] \\$ "
else
	PS1="\e[31;1m >> \e[0m$XTERM_TITLE\u\e[37;1m@\e[0m\h:\w\n   \\$ "
fi

# when using :sh in vim, make it clear
if [ ! -z "${VIMRUNTIME+x}" ]; then
    _vim=$(basename "${VIMRUNTIME}")
    PS1="$XTERM_TITLE\e[37;1m[$_vim]\e[0m $PS1"
fi

alias pygrep='grep -n --exclude=*{.pyc,.swp,tags,.sql,.json} -Er '

# run tmux by default
# if command -v tmux>/dev/null; then
#     [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
# fi

test -f "$HOME"/.bashrc_local && source "$HOME"/.bashrc_local

export SUDO_ASKPASS=/usr/bin/ssh-askpass

# from https://unix.stackexchange.com/a/169423
# save previous location:
# for the meaning of <>
# https://unix.stackexchange.com/a/164394
cd $(<>/dev/shm/$USER-pwd)
__cd(){
    # use \cd to avoid a fork bomb
    \cd "$@"
    pwd >/dev/shm/$USER-pwd
}
alias cd=__cd
alias yolo='sudo'
# open in previous location
cd "$(cat /dev/shm/$USER-pwd)"

PATH="/home/user/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/user/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/user/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/user/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/user/perl5"; export PERL_MM_OPT;

alias python='python3'
alias lt='ls -larth'
