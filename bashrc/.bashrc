# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
HISTFILE=~/.bash_history
set -o history
source ~/.local/
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export VISUAL=vim
export EDITOR="$VISUAL"

alias fc='fc e : '
rfc () {
    fc -e : $1 $2
}
alias gb='vim ~/behzad_local/personal/habitualize'
alias gt='vim ~/behzad_local/personal/todo.txt' 
alias gp='vim ~/behzad_local/personal/live_better_problem'
alias gh='vim ~/behzad_local/personal/live_better_hyp.txt'
alias gs='vim ~/behzad_local/personal/live_better_solutions.txt'
alias gb='vim ~/behzad_local/personal/habitualize.txt'
alias sc='vim ~/scratch'

#
#don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=9000
HISTFILESIZE=9000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#shopt -s checkwinsize
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
    xterm-color) color_prompt=yes;;
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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


alias hs='history 20 > ~/tempo; python ~/behzad_local/usefull_stuff/misc/python_collection/necessary/history.py'


#export -f hs
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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto -lhrt'

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

export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vimrc'  #or any other location you want
alias execFolder="cd ./bin/x86_64/Release"
#export DISPLAY=:0

# Bash
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
reset=$(tput sgr0)

PS1=':\[$green\]\w\[$reset\]\$ '
#PS1='\[$grey\]\u\[$reset\]@\[$green\]\h\[$reset\]:\[$blue\]\w\[$reset\]\$ '



# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f $HOME/../Modules/init/bash ]; then
    . $HOME/../Modules/init/bash
    module load 
fi

# behzad stuff
#bindkey -v
#set -o vi
# ---- the following two lines are necessary for installing pycallgraph
PATH="$HOME/.local/bin:$PATH:/home/local/bulkhead/behzad/usr/local/parsec-3.0/bin"
#echo PATH="$HOME/.local/bin:$PATH:$HOME/.local/lib/python2.7/site-packages" > $HOME/.profile
export
#PYTHONPATH=$HOME/.local/lib/python2.7/site-packages:$HOME/learning_collections/python_collection/necessary:$HOME/behzad_local/gem5-src-code/gem5-stable/src/python:$HOME/behzad_local/gem5-src-code/gem5-stable/src/python/m5:$HOME/behzad_local/gem5-src-code/gem5-stable/src/python/swig:$HOME/behzad_local/gem5-src-code/gem5-stable/src/sim/


export PYTHONPATH=$HOME/.local/lib/python2.7/site-packages:$HOME/local_drive/usefull_stuff/misc/python_collection/necessary:$HOME/behzad_local/gem5-src-code/gem5-stable/build/X86/python:$HOME/behzad_local/gem5-src-code/gem5-stable/build/X86/python/m5:$HOME/behzad_local/gem5-src-code/gem5-stable/build/X86/python/swig:$HOME/behzad_local/gem5-src-code/gem5-stable/build/X86/sim:$HOME/local_drive/usefull_stuff/python_libs:$HOME/local_drive/usefull_stuff/misc

export PYTHONPATH="${PYTHONPATH}:/home/polaris/behzad/python_collection/necessary/"
export PYTHONPATH="${PYTHONPATH}:/home/polaris/behzad/apx_tool_chain/src/python_files/"
alias genpycal="$HOME/python_collection/necessary/gen_pycallgraph_excluding_libs.py"
alias cdb="$HOME/python_collection/necessary/complete_create_db.py"
#alias termtitle="$HOME/behzad_local/usefull_stuff/learning_collections/unix_collection/necessary/termtitle $1"
alias journal="vim $HOME/behzad_local/journal"
alias vimrc="vim $HOME/.vimrc"

#machine spacific aliases
alias pycharm="bash $HOME/Downloads/pycharm-community-4.5.3/bin/pycharm.sh"
#alias mendley="cd $HOME/Downloads/mendeleydesktop-1.15.1-linux-x86_64/;./bin/mendeleydesktop&"

cpyFoo() {
    cp $1 $1_backup
    vim $1_backup

}
alias vimc=cpyFoo


## ---- the following colors the error 
color()(set -o pipefail;"$@" 2>&1>&3|sed $'s,.*,\e[31m&\e[m,'>&2)3>&1


#exec 9>&2
#exec 8> >(
    #while IFS='' read -r line || [ -n "$line" ]; do
       #echo -e "\033[31m${line}\033[0m"
    #done
#)
#function undirect(){ exec 2>&9; }
#function redirect(){ exec 2>&8; }
#trap "redirect;" DEBUG
#PROMPT_COMMAND='undirect;'

#gpgpu stuff
#export LD_LIBRARY_PATH=/home/local/optimus/kishore/modelling/cuda_4.0/:/home/local/optimus/kishore/modelling/cuda_4.0/cuda/lib64:$LD_LIBRARY_PATH
#export PATH=/home/local/optimus/kishore/modelling/cuda_4.0/:/home/local/optimus/kishore/modelling/cuda_4.0/cuda/bin:$PATH  
#export PATH=/home/local/optimus/kishore/modelling/cuda_4.0/cuda:/home/local/optimus/kishore/modelling/cuda_4.0/cuda/bin:$PATH  
#export CUDA_INSTALL_PATH=/home/local/optimus/kishore/modelling/cuda_4.0/cuda/


setterm -blength 0
PERL_MB_OPT="--install_base \"/home/polaris/behzad/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/polaris/behzad/perl5"; export PERL_MM_OPT;
export PATH=$HOME/local/bin:$HOME/behzad_local/usefull_stuff/bin/:$HOME/behzad_local/clang/bin/:$PATH
#:$PATH
#virtual env
source  ~/.local/lib/bin/activate

set -o vim
