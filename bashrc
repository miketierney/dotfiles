HISTFILESIZE=1000000000
HISTSIZE=1000000

export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/sphinx/bin:$PATH

# Faster navigation
alias ll='ls -al'
alias search=grep
alias mc='mc -c'
alias ..='cd ../'
alias ...='cd ../..'
alias home='cd $HOME'

# Compress the cd, ls -l series of commands
alias lc='cl'
function cl () {
	if [ $# = 0 ]; then
		cd && ll
	else
		cd "$*" && ll
	fi
}

# fuck that you have new mail shit - thank you, Ryan Tomayko (http://github.com/rtomayko/dotfiles/blob/rtomayko/.bashrc)
unset MAILCHECK

# Rails commands
alias sc='./script/console'
alias ss='./script/server'
alias rdm='rake db:migrate'
alias rdtp='rake db:test:prepare'
alias rdma='rake db:migrate && rake db:test:prepare'

# Mike's sanity-saving shortcuts
# apache short cut
# alias start_apache='sudo /opt/local/apache2/bin/apachectl start'
alias start_apache='sudo launchctl load -w /Library/LaunchDaemons/org.macports.apache2.plist'
alias apstart=start_apache

# alias stop_apache='sudo /opt/local/apache2/bin/apachectl stop'
alias stop_apache='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.apache2.plist'
alias apstop=stop_apache

# alias restart_apache='sudo /opt/local/apache2/bin/apachectl restart'
function restart_apache {
  stop_mysql
  start_mysql
}
alias aprestart=restart_apache

# Dev Resources (only works on the doxo intranet)
alias dev='ssh dev' # requires that the 'dev' ssh alias be set up properly

# Personal
alias projects='cl ~/Projects'
alias mine=projects
alias aspen='cl ~/Projects/doxo/aspen'
alias bonsai='cl ~/Projects/doxo/bonsai'
alias sites='cl ~/Sites/'

# Development
alias dev_aspen='mate /Volumes/Doxo\ Development\ Machine/projects/aspen'

# Git commands
alias gs='git-sh'
alias gst='git status'
alias gsup='git sup'
alias gup='git up'

# Github commands
alias git=hub

# enable Git tab completion
complete -o default -o nospace -F _git_checkout gco
complete -o default -o nospace -F _git_checkout gb
complete -o default -o nospace -F _git_checkout gm
complete -o default -o nospace -F _git_pull gl
complete -o default -o nospace -F _git_push gp

export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=gxfxcxdxbxegedabagacad # cyan directories

COLOR_YELLOW='\[\e[1;33m\]'
COLOR_GREEN='\[\033[1;32m\]'
COLOR_RED='\[\e[1;31m\]'
COLOR_NONE='\[\e[0m\]'
COLOR_CYAN='\[\033[1;36m\]'
COLOR_BLUE='\[\033[1;34m\]'

git_dirty_flag() {
  git_status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "*"}'
}

prompt_func()
{
    previous_return_value=$?;
    prompt_line_one="${COLOR_CYAN}\u${COLOR_YELLOW}@\h"
	# prompt_line_one="${COLOR_CYAN}\u${COLOR_YELLOW}@\h"
    prompt_line_two="${COLOR_BLUE}\w${COLOR_GREEN}$(__git_ps1 ' (%s)')${COLOR_RED}$(git_dirty_flag)${COLOR_NONE}"
    pointer="${prompt}$> "

    PS1="${prompt_line_one} ${prompt_line_two} ${pointer}"
}
PROMPT_COMMAND=prompt_func

alias esp="open -a Espresso"
# export EDITOR='mate -r'
# export VISUAL=mate
# export SVN_EDITOR='mate -w'
# export GIT_EDITOR='mate -w'
export EDITOR='vim -r'
export VISUAL=vim
export SVN_EDITOR='vim -w'
# export GIT_EDITOR='vim'
