#*****************************************************************#
# Source Prezto.
 if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
#*****************************************************************#

# Zsh config and history

# PATH setup if needed
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH="/Users/srsantos/.gem/ruby/2.3.0/bin:/usr/local/edirect:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

# History
##
HISTFILE=~/.zsh_history         # where to store zsh history
HISTSIZE=1024                   # big history
SAVEHIST=1024                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit
#setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword
unsetopt correct_all
setopt NO_HUP
setopt NO_CHECK_JOBS
setopt print_exit_value

###http://foffer.dk/optimizing-os-x-terminal-for-10-10-yosemite/

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
export GPG_TTY="${GPG_TTY:-$(tty 2>/dev/null)}"

/usr/local/bin/gpgconf --launch gpg-agent

export PLOTICUS_PREFABS="/usr/local/share/ploticus/prefabs"

export LSCOLORS=ExGxCxDxBxegedabagaced
export LC_ALL=en_US.UTF-8
export PAGER=vimpager

alias ll="ls -FGahl"
alias l="ls -FGhl"
alias htop="glances"
alias update_brew="brew update && brew upgrade && brew cleanup -s"
alias tm_prog="tmutil status | awk '/_raw_Percent/ {print $3}' | grep -o '[0-9].[0-9]\+' | awk '{print $1*100}'"
alias sshfs_mount="sshfs -C -o defer_permissions,reconnect,follow_symlinks,noappledouble -o cache=no -o volname=Remote_Share_via_SSHFS"
alias igmt="/usr/local/igmt_1.2/igmt"
alias mac_pro_spirit='/usr/bin/osascript -e "try" -e "mount volume \"cifs://spirit.auburn.edu/santosr/Mac_Pro_BackUp\"" -e "end try"'
alias dbs_chair_files='/usr/bin/osascript -e "try" -e "mount volume \"smb://csm1.auburn.edu/csm/Temp Dept - Bio Chair\"" -e "end try"'

alias ws_2_underscore='for f in *\ *; do mv "$f" "${f// /_}"; done'

alias music_mpv='mpv --no-video'
alias music_mpv_random_playlist='mpv --no-video --shuffle --playlist <(find "$PWD" -type f)'

######youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" 'URL'

fpath=(/usr/local/share/zsh-completions $fpath)

#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#autoload -Uz promptinit
#promptinit

# To stop and start Spotlight indexing when CPU usage goes high
# sudo mdutil -a -i off && sudo mdutil -a -i on
