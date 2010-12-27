HISTFILESIZE=1000000000
HISTSIZE=1000000

# Faster Navigation
alias ll='ls -al'
alias search=grep
alias mc='mc -c'
alias ..='cd ..'
alias ...='cd ../..'
alias home='cd $HOME'

# Rails Commands
alias sc='./script/console'
alias ss='./script/server'
alias rdm="rake db:migrate"
alias rdtp="rake db:test:prepare"
alias rdma='rake db:migrate && rake db:test:prepare'

# # MySQL
# alias mysql="mysql5"
# alias start_mysql='sudo launchctl load -w /Library/LaunchDaemons/org.macports.mysql5.plist'
# alias stop_mysql='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.mysql5.plist'
# function restart_mysql {
#  stop_mysql
#  start_mysql
# }
# 
# alias link_mysql='ln -s /opt/local/var/run/mysql5/mysqld.sock /tmp/mysql.sock'
# 
# # nginx
# # alias start_nginx='sudo launchctl load -w /Library/LaunchDaemons/org.macports.nginx.plist'
# # alias stop_nginx='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.nginx.plist'
# alias start_nginx='sudo /opt/nginx/sbin/nginx'
# alias stop_nginx='sudo kill `cat /opt/nginx/logs/nginx.pid `'
# function restart_nginx {
#  stop_nginx
#  start_nginx
# }
# 
# # nginx short cuts
# alias start_memd='sudo launchctl load -w /Library/LaunchDaemons/org.macports.memcached.plist'
# alias stop_memd='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.memcached.plist'
# function restart_memd {
#  stop_memd
#  start_memd
# }
# Mike's sanity-saving shortcuts

# Personal
alias projects='cl ~/Projects'
alias mine=projects
alias aspen='cl ~/projects/doxo/aspen'
alias sites='cl ~/Sites/'

# Git Commands
alias gs='git-sh'

# Github commands
alias git=hub

# branch management
# alias gbc='git branch --color'
# alias gb="git branch -v"                 # show all local branches
# alias gba="git branch -a -v --color"     # shows all branches, local and remote
# alias gbr="git branch -r -v --color"     # show all remote branches

# pushing and pulling
# alias gf="git fetch"
# alias gl="git pull"
# alias gp="git push"

# Commits
# alias gc="git commit -v"
# alias gca="git commit -v -a"

# Utilities
alias gst="git status"
alias gsup='git sup'
alias gup='git up'
# alias gm="git merge"
# alias gco="git checkout"
# alias gfsck="git fsck"
# alias gcobj="git count-objects"
# alias ggc="git gc"
alias gsi='git svn show-ignore > .git/info/exclude' # takes everything from the svn ignore and adds it to .git/info/exclude
alias git_svn_ignore=gsi

# enable Git tab completion
complete -o default -o nospace -F _git_checkout gco
complete -o default -o nospace -F _git_checkout gb
complete -o default -o nospace -F _git_checkout gm
complete -o default -o nospace -F _git_pull gl
complete -o default -o nospace -F _git_push gp


# Compress the cd, ls -l series of commands.
alias lc="cl"
function cl () {
   if [ $# = 0 ]; then
      cd && ll
   else
      cd "$*" && ll
   fi
}

# fuck that you have new mail shit -> thank you, Ryan Tomayko (http://github.com/rtomayko/dotfiles/blob/rtomayko/.bashrc)
unset MAILCHECK

export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=gxfxcxdxbxegedabagacad  # cyan directories

COLOR_YELLOW="\[\e[1;33m\]"
COLOR_GREEN="\[\033[1;32m\]"
COLOR_RED="\[\e[1;31m\]"
COLOR_NONE="\[\e[0m\]"
COLOR_CYAN="\[\033[1;36m\]"
COLOR_BLUE='\[\033[1;34m\]'

git_dirty_flag() {
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print " *"}'
}

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}

prompt_func()
{
    previous_return_value=$?;
    prompt_line_one="${COLOR_CYAN}\u${COLOR_YELLOW}@\h"
    prompt_line_two="${COLOR_GREEN}\w${COLOR_BLUE}$(__git_ps1 ' (%s)')${COLOR_NONE}${prompt} \$${COLOR_RED}$(git_dirty_flag)${COLOR_NONE} "
    # prompt_line_two="${COLOR_GREEN}\w${COLOR_BLUE}$(parse_git_branch)${COLOR_NONE}${prompt} \$${COLOR_RED}$(git_dirty_flag)${COLOR_NONE} "

    PS1="${prompt_line_one} ${prompt_line_two}"
}
PROMPT_COMMAND=prompt_func

alias esp="open -a Espresso"
export EDITOR='mate -r'
export VISUAL=mate
export SVN_EDITOR='mate -w'
export GIT_EDITOR='mate -w'
# export EDITOR='vim -r'
# export VISUAL=vim
# export SVN_EDITOR='vim -w'
# export GIT_EDITOR='vim -w'