# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alanpeabody"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler cap cloudapp gem git git-flow heroku npm osx pow rails rails3 ruby rvm svn textmate vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/mike/.rvm/gems/ruby-1.8.7-p302/bin:/Users/mike/.rvm/gems/ruby-1.8.7-p302@global/bin:/Users/mike/.rvm/rubies/ruby-1.8.7-p302/bin:/Users/mike/.rvm/bin:/usr/local/share/npm/bin:/opt/local/apache2/bin:/usr/local/mysql/bin:/usr/local/sphinx/bin:/usr/local/bin:/usr/local/sbin:/Users/mike/bin:/usr/bin:/usr/sbin:/bin:/sbin:/Users/mike/bin:/usr/local/bin/node:/usr/local/sphinx/bin:/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

# Compress the cd, ls -l series of commands
alias lc='cl'
function cl () {
  if [ $# = 0 ]; then
    cd && ll
  else
    cd "$*" && ll
  fi
}

# Aliases
alias ll='ls -al'
alias mc='mc -c'
alias ..='cd ../'
alias ...='cd ../..'
alias home='cd $HOME'

# Rails command aliases
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
  stop_apache
  start_apache
}
alias aprestart=restart_apache

# Dev Resources (only works on the doxo intranet)
alias dev='ssh dev' # requires that the 'dev' ssh alias be set up properly

# Personal
alias projects='cl ~/Projects'
alias mine=projects
alias dev_aspen='terminitor start aspen_remote' # starts up 4 ssh tabs in my development instance, and puts me in the right directory/doing the right task. Requires terminitor.
alias local_aspen='terminitor start aspen_local' # starts up 4 ssh tabs in my local environment, and puts me in the right directory/doing the right task. Requires terminitor.
alias aspen='cl ~/Projects/doxo/aspen'
alias dogwood='cl ~/Projects/doxo/dogwood'
alias doxocom='cl ~/Projects/doxo/doxo-com/wp-content/themes/doxo'
alias bonsai='cl ~/Projects/doxo/bonsai'
alias sites='cl ~/Sites/'

# Development
alias mate_aspen='mate /Volumes/Home\ Directory/projects/aspen'
alias mvim_aspen='mvim /Volumes/Home\ Directory/projects/aspen'

# Task Management
alias t='python ~/Projects/utilities/t/t.py --task-dir ~/Dropbox/Synced\ Files/tasks --list tasks'
alias d='python ~/Projects/utilities/t/t.py --task-dir ~/Dropbox/Synced\ Files/tasks --list doxo'
alias b='python ~/Projects/utilities/t/t.py --task-dir ~/Dropbox/Synced\ Files/tasks --list bugs'

# Github commands
alias git=hub

# Git SVN fixer
function gits() {
  git svn $1
}

export EDITOR='vim -r'
export VISUAL=vim
#export SVN_EDITOR='vim -w'
#export GIT_EDITOR='vim'

unset MAILCHECK

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function