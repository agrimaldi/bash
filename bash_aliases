#################
#### ALIASES ####
#################

# mkdir automatically recursive
alias mkdir='mkdir -p'
alias L='most -M -s'

###################
#### FUNCTIONS ####
###################

# command line browsing
function	ll		{ ls -Flh "$@" ;}
function	lla		{ ls -FAlh "$@" ;}
function	lll	        { ll $@ | "$PAGER" ;}
#function	c.		{ cd ../ ;}
#function	c..		{ cd ../../ ;}
#function	c...		{ cd ../../../ ;}
#function	c....		{ cd ../../../../ ;}
function	dfh		{ df -hT "$@" ;}
function	duu		{ du -xms "$@" | sort -n ;}
function	dua		{ ls -l | du -m --max-depth=1 | sort -n ;}
function	rmr		{ rm -vrf "$@" ;}
function  sshidebian  { ssh -p 22525 agrimaldi@10.211.55.5 ;}

# Rename *.foo to *.bar
function rename_ext {
	for f in *.$1; do
		mv "$f" "${f%$1}$2"
	done
}

# Backup several files (*.foo to *.foo.bak)
function bak {
	for f in "$@"; do
		cp -rv "$f" "$f".bak
	done
}

# Generate random number from $1 to $2
function getrand {
	echo $(( $RANDOM % ($2 - $1 + 1) + $1 ))
}

# History search
function hgrep {
    history | grep $1 | sed '$d'
}

# Process search
function psaux {
    ps aux | grep $1 | fgrep -v "grep $1"
}

# Quick reference card of some useful tips and tricks
function bashtips {
less <<EOF
DIRECTORIES
-----------
pushd tmp	Push tmp && cd tmp
popd		Pop && cd

GLOBBING AND OUTPUT SUBSTITUTION
--------------------------------
ls a[b-dx]e	Globs abe, ace, ade, axe
ls a{c,bl}e	Globs ace, able
\$(ls)		\`ls\` (but nestable!)

HISTORY MANIPULATION
--------------------
!!		Last command
!?foo		Last command containing \`foo'
^foo^bar^	Last command containing \`foo', but substitute \`bar'
!!:0		Last command word
!!:^		Last command's first argument
!\$		Last command's last argument
!!:*		Last command's arguments
!!:x-y		Arguments x to y of last command
C-s		search forwards in history
C-r		search backwards in history

LINE EDITING
------------
M-d		kill to end of word
C-w		kill to beginning of word
C-k		kill to end of line
C-u		kill to beginning of line
M-r		revert all modifications to current line
C-]		search forwards in line
M-C-]		search backwards in line
C-t		transpose characters
M-t		transpose words
M-u		uppercase word
M-l		lowercase word
M-c		capitalize word

COMPLETION
----------
M-/		complete filename
M-~		complete user name
M-@		complete host name
M-\$		complete variable name
M-!		complete command name
M-^		complete history

CUSTOM
------
psaux		process search
hgrep		history search
getrand		random number between 2 values
bak		backup several files
rename_ext	change the extension of several files
ll		list directory
lla		list all
lmost		list all and pipe to a pager
c.(*n)		go up n directories
dfh		disk usage
duu		local disk usage
dua		local disk usage including hidden files
rmr		remove recursively
printdf		print

EOF
}

