# base-files version 3.9-3

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benificial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file
if [ -e ~/.autojump/share/autojump/autojump.bash ]; then
    . ~/.autojump/share/autojump/autojump.bash
fi

if [ -e /usr/share/autojump/autojump.sh ]; then
    . /usr/share/autojump/autojump.sh
fi

# Environment Variables
# #####################

# Looks like I don't have to overwrite the setting of TERM. Let system do this
# for me.
# support 256 color
#export TERM="xterm-256color"
# Let tmux can recognize fucntion key when using putty
#export TERM=putty

# TMP and TEMP are defined in the Windows environment.  Leaving
# them set to the default Windows temporary directory can have
# unexpected consequences.
unset TMP
unset TEMP

# Alternatively, set them to the Cygwin temporary directory
# or to any other tmp directory of your choice
# export TMP=/tmp
# export TEMP=/tmp

# Or use TMPDIR instead
# export TMPDIR=/tmp

# Shell Options
# #############

# See man bash for more options...

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
# shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
# shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell


# Completion options
# ##################

# These completion tuning parameters change the default behavior of bash_completion:

# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1

# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# case $- in
#   *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
# esac


# History Options
# ###############

# Don't put duplicate lines in the history.
export HISTCONTROL="ignoredups"

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"


# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
alias rm='rm -Iv'	# -I ask once for removing multiple files
# alias cp='cp -i'
# alias mv='mv -i'

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort

# recursive search(-r), show line number(-n)
# ignore binary(-I), ignore case(-i)
# show differences in colour (--color)
GREP_OPTIONS="-rnI --exclude-dir={prebuilt,.git} --exclude={tags,*.d,*.o,*.a,*.map,*.opa,*.ipa,*.ti,*.dis} --color"
alias grep="grep --color"
alias gR='grep $GREP_OPTIONS'
alias gr='gR -i' #ignore case(-i)
alias fgR="fgrep $GREP_OPTIONS" # search fixed string for speed
alias fgr='fgR -i' #ignore case(-i)

# "xxx={a,b,c}" is called "shell brace expansion"
alias ctags="ctags --exclude={*.o,*.d,*.a,*.map}"

# Some shortcuts for different directory listings
alias ls='ls -F --color=tty'                   # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -hl --block-size=KB'                 # long list
alias la='ls -hal'                                # all
alias lc='ls -hC'                                 # show by column
alias lt='ll -ht'                                 # show by time, newest at top
alias my='sh mybuild.sh'
alias g='git'
complete -o default -o nospace -F _git g
alias gti='git'
# alias up='sh upload.sh'

alias      .~='cd ~'
alias      ..='cd ..'
alias     ...='cd ../..'
alias    ....='cd ../../..'
alias   .....='cd ../../../..'
alias  ......='cd ../../../../..'
alias      .2='cd ../..'
alias      .3='cd ../../..'
alias      .4='cd ../../../..'
alias      .5='cd ../../../../..'
alias      .6='cd ../../../../../..'

# Functions
# #########

# Some example functions
# function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }

declare -x LS_COLORS="di=01;36:ln=01;31:"

# disable hanged scroll
stty -ixon

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

# display current directory(\w) and git branch
# "\[\e[1;32m\]" and "\[\e[0m\]" are colors
PS1='\[\e[1;32m\]\w\[\e[0m\] \[\e[1;34m\](\t)\[\e[0m\]\n\[\e[1;35m\]$(git_branch)\[\e[0m\]\$ '

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# export GOPATH=$HOME/gopath
export VIMPATH=$HOME/local/bin
CROSTOOLS=$HOME/cros-tools
export PATH=$VIMPATH:$GOPATH:$GOPATH/bin:$PATH:$CROSTOOLS

# VMWare toolchain
# ARCGNU=$HOME/arc_gnu
# export PATH=$ARCGNU/bin:$ARCGNU/eclipse:$PATH
# NSIM=$HOME/test/MetaWare_Linux/nSIM/nSIM
# export PATH=$NSIM/bin:$PATH
# export PATH=~/bin:$PATH

source ~/config/git-completion.bash

if [ -f /proj/mtk15399/.bashrc_15399 ]; then
    source /proj/mtk15399/.bashrc_15399
fi


