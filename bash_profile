#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

export DISPLAY=:0.0 
export EDITOR='vi'
export LC_ALL=C
export PATH=$PATH:/usr/local/bin:/opt/local/bin:/usr/local/mysql/bin
export MANPATH=$MANPATH:/opt/local/share/man
export INFOPATH=$INFOPATH:/opt/local/share/info
export SVN_SSH="ssh -i $HOME/.ssh/id_rsa_svn.aroundsg"
bind "set completion-ignore-case on"
set history=50

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias emacs='/usr/bin/emacs'
alias ttop='/usr/bin/top -ocpu -R -F -s 2 -n30'
alias svnrev='svn revert db/development.sqlite3'

alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'

# using the new md* commands in Tiger, this is a find by filename
# using the spotlight database. No having to build the locate database
# and keep it up to date, or run the usual find that walks the 
# filesystem.
# It's done as a function so I can use command-line arguments
# and single and double quotes.
function loc {  mdfind "kMDItemDisplayName == '$@'wc"; }

# Colour LS
export TERM=xterm-color
export CLICOLOR=true
LS_COLORS='no=01;32:fi=00:di=00;31:ln=01;36:pi=04;33:so=01;35:bd=33;04:cd=33;04: or=31;01:ex=00;31:*.rtf=00;33:*.txt=00;33:*.html=00;33:*.doc=00;33:*.pdf=00;33: *.ps=00;33:*.sit=00;31:*.hqx=00;31:*.bin=00;31:*.tar=00;31:*.tgz=00;31:*.arj=00;31: *.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.deb=00;31: *.dmg=00;36:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.ppm=00;35:*.tga=00;35: *.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.mpg=00;37:*.avi=00;37:*.gl=00;37:*.dl=00;37: *.mov=00;37:*.mp3=00;35:'
export LS_COLORS
CLICOLOR="YES";    export CLICOLOR
LSCOLORS="GxDxFxdxCxDxDxhbadGxGx";    export LSCOLORS

# Colour and custom command-line with auto-update of window title
case "$TERM" in
xterm-color)            
	PS1="\[\033]0;\w\007\]\[\033[01;32m\]\u@\h \[\033[00m\][\[\033[01;36m\]\w\[\033[00m\]] $ "
	;;
*)
	PS1="\[\033]0;\w\007\]\u@\h [\w] $ "
	;;
esac

# Enable cd into OS X directory aliases
function cd {
  if [ ${#1} == 0 ]; then
    builtin cd
  elif [ -d "${1}" ]; then
    builtin cd "${1}"
  elif [[ -f "${1}" || -L "${1}" ]]; then
    path=$(getTrueName "$1")
    builtin cd "$path"
  else
    builtin cd "${1}"
  fi
}

test -r /sw/bin/init.sh && . /sw/bin/init.sh

# Enable copy SSH DSA key

function scpdsa {
  if [[ -z "$1" ]]; then
    echo "!! You need to enter a hostname in order to send your public key !!"
  else
    echo "* Copying SSH public key to server..." 
    ssh ${1} "mkdir -p ~/.ssh && cat - >> ~/.ssh/authorized_keys" < ~/.ssh/id_dsa.pub
    echo "* All done!"
  fi
}

# On-the-fly hostname lists

complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

# Bash history settings (macromates.com)

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
alias h='history'


# Setting PATH for MacPython 2.6
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
export PATH
