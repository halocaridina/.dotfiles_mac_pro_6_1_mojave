#Various environmental variables 
export PATH="/Users/srsantos/.gem/ruby/2.3.0/bin:/usr/local/edirect:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export CLICOLOR=1
export LSCOLORS=ExGxCxDxBxegedabagaced
export LESS="eMq"
export LC_ALL=en_US.UTF-8
export PAGER=vimpager
export PLOTICUS_PREFABS="/usr/local/share/ploticus/prefabs"
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
export GPG_TTY="${GPG_TTY:-$(tty 2>/dev/null)}"

#General aliases for everyday functions
alias del="trash"
alias ll="ls -FGahl"
alias l="ls -FGhl"
alias desktop="cd ~/Desktop"
alias root="cd /"
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
alias rmdir="rmdir -i"
alias bye="exit"
alias tarball="tar -pczf"
alias packtarball="tar -pczf"
alias unpacktarball="tar xvfz"
alias vtball="tar -tvf"
alias pico="nano"
alias grep="grep --color=auto"
alias igmt="/usr/local/igmt_1.2/igmt"
alias update_brew="brew update && brew upgrade && brew cleanup -s"
alias tm_prog="tmutil status | awk '/_raw_Percent/ {print $3}' | grep -o '[0-9].[0-9]\+' | awk '{print $1*100}'"
alias sshfs_mount="sshfs -C -o defer_permissions,reconnect,follow_symlinks,noappledouble -o cache=no -o volname=Remote_Share_via_SSHFS"
##### alias wifi_kill="sudo networksetup -setnetworkserviceenabled "Wi-Fi" off" #####

alias mac_pro_spirit='/usr/bin/osascript -e "try" -e "mount volume \"cifs://spirit.auburn.edu/santosr/Mac_Pro_BackUp\"" -e "end try"'
alias dbs_chair_files='/usr/bin/osascript -e "try" -e "mount volume \"smb://csm1.auburn.edu/csm/Temp Dept - Bio Chair\"" -e "end try"'

shopt -s cdspell

#Add the following lines to your ~/.bash_profile for bash autocompletion:
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

#Bash completion has been installed to:
#  /usr/local/etc/bash_completion.d

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################

bash_prompt_command() {
	    # How many characters of the $PWD should be kept
	    local pwdmaxlen=25
	    # Indicate that there has been dir truncation
	    local trunc_symbol=".."
	    local dir=${PWD##*/}
	    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
	    NEW_PWD=${PWD/$HOME/~}
	    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
	    if [ ${pwdoffset} -gt "0" ]
	        then
	        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
	        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
	    fi
}
#
bash_prompt() {
    local NONE='\[\033[0m\]'    # unsets color to term's fg color

        # regular colors
	local K='\[\033[0;30m\]'    # black
	local R='\[\033[0;31m\]'    # red
	local G='\[\033[0;32m\]'    # green
	local Y='\[\033[0;33m\]'    # yellow
	local B='\[\033[0;34m\]'    # blue
	local M='\[\033[0;35m\]'    # magenta
	local C='\[\033[0;36m\]'    # cyan
	local W='\[\033[0;37m\]'    # white

	# empahsized (bolded) colors
	local EMK='\[\033[1;30m\]'
	local EMR='\[\033[1;31m\]'
	local EMG='\[\033[1;32m\]'
	local EMY='\[\033[1;33m\]'
	local EMB='\[\033[1;34m\]'
	local EMM='\[\033[1;35m\]'
	local EMC='\[\033[1;36m\]'
	local EMW='\[\033[1;37m\]'

	# background colors
	local BGK='\[\033[40m\]'
	local BGR='\[\033[41m\]'
	local BGG='\[\033[42m\]'
	local BGY='\[\033[43m\]'
	local BGB='\[\033[44m\]'
	local BGM='\[\033[45m\]'
	local BGC='\[\033[46m\]'
	local BGW='\[\033[47m\]'

	local UC=$C                 # user's color
        [ $UID -eq "0" ] && UC=$R   # root's color

	PS1="${W}[\t${W}] ${Y}[${R}\u${R}@${R}\h ${EMB}\${NEW_PWD}${Y}]${W}\\$ ${NONE}"
}
#
PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt

#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
