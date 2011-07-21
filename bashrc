export PATH="/usr/texbin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/ncbi/blast/bin:/usr/local/share/npm/bin:/usr/local/share/python:/usr/local/bin:$BIO_HOME/bin:${PATH}"
export DYLD_LIBRARY_PATH="/usr/local/cuda/lib"

export CLICOLOR=1

if [ `uname` != "Darwin" ]; then
    eval `dircolors ~/.dircolors`
fi

# Alias & functions definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Local configuration
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

# Cross platform bash completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Set environement variables :
export PAGER="less"
export NODE_PATH="/usr/local/lib/node_modules"

COLOR_YELLOW="\[\e[0;33m\]"
COLOR_RED="\[\e[0;31m\]"
COLOR_GREEN="\[\e[0;32m\]"
COLOR_BLUE="\[\e[0;34m\]"
COLOR_PURPLE="\[\e[0;35m\]"
COLOR_NONE="\[\e[0m\]"

git_dirty_flag() {
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "*"}'
}

prompt_func()
{
    previous_return_value=$?;
    #prompt="${COLOR_GREEN}\w${COLOR_NONE}$(__git_ps1)${COLOR_YELLOW}$(git_dirty_flag)${COLOR_NONE} "
    prompt="\n${COLOR_GREEN}--------------- ${COLOR_RED}[ \t ] ${COLOR_GREEN}---------------\n${COLOR_PURPLE}[ \h ] ${COLOR_BLUE}\w${COLOR_NONE}$(__git_ps1)${COLOR_YELLOW}$(git_dirty_flag)${COLOR_NONE}\n"
    if test $previous_return_value -eq 0
    then
        PS1="${prompt}${COLOR_BLUE}>>>${COLOR_NONE} "
    else
        PS1="${prompt}${COLOR_RED}>>>${COLOR_NONE} "
      fi
}
PROMPT_COMMAND=prompt_func


# BioInformatics tools
export BIO_HOME="$HOME/Code/BioInformatics"
# >>>>>>>>>>>>>>>>>>>>>>> Enabling Biopieces if installed <<<<<<<<<<<<<<<<<<<<<<<
# Modify the below paths according to your settings.
# If you have followed the installation step-by-step as described above,
# the below should work just fine.
export BP_DIR="$BIO_HOME/biopieces"  # Directory where biopieces are installed
export BP_DATA="$BIO_HOME/data"   # Contains genomic data etc.
export BP_TMP="$BIO_HOME/tmp"        # Required temporary directory.
export BP_LOG="$BIO_HOME/logs"     # Required log directory.
if [ -f "$BP_DIR/bp_conf/bashrc" ]; then
	    source "$BP_DIR/bp_conf/bashrc"
    fi
alias bp_update="cd $BP_DIR && svn update; cd $BP_DIR/bp_usage && svn update;"
# >>>>>>>>>>>>>>>>>>>>>>      <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

##exec fish

#export PREEXEC_EXCLUDE_LIST="mc less bash more man git ssh vim sudo"
#
#. ~/.bin/preexec
#
## called before each command and starts stopwatch
#function preexec () {
#	export PREEXEC_CMD=`echo $1 | awk '{ print $1; }'`
#	export PREEXEC_CMD_FULL=`echo $1` # | awk '{ print $1; }'`
#	export PREEXEC_TIME=$(date +'%s')
#}
#
## called after each command, stops stopwatch
## and notifies if time elpsed exceeds threshold
#function precmd () {
#	stop=$(date +'%s')
#	start=${PREEXEC_TIME:-$stop}
#	let elapsed=$stop-$start
#	max=${PREEXEC_MAX:-10}
#	
#3	for i in ${PREEXEC_EXCLUDE_LIST:-}; do
#	  if [ "x${i}" = "x$PREEXEC_CMD" ]; then
#	    max=999999;
#	    break;
#	  fi
#	done
#	
#	if [ $elapsed -gt $max ]; then
#		growlnotify -n "iTerm" -m "took $elapsed secs" ${PREEXEC_CMD_FULL}
#	fi
#}
#
#preexec_install

