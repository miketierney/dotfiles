# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="eastwood"
ZSH_THEME="slosh"

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

# Customize to your needs...
export PATH=bin:/Users/mike/bin:/usr/local/share/npm/bin:/usr/local/mysql/bin:/usr/local/sphinx/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin/node:/usr/X11/bin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH
PATH=/Applications/Postgres93.app/Contents/MacOS/bin:$PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export NODE_PATH=/usr/local/bin:/usr/local/sbin:/usr/local/lib/node:/usr/local/lib/node_modules:/usr/local/bin/npm:/Users/mike/.npm:/usr/local/lib/jsctags/:/usr/local/share/npm/lib/node_modules:$NODE_PATH

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler gem git osx rails)

source $ZSH/oh-my-zsh.sh
rvm use default &> /dev/null

# Help Git autocompletion work
autoload -U compinit && compinit

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

# Ruby aliases
alias rake='noglob rake' # make zsh/rake behave more like bash/rake for commands that take arguments

# Bower
alias bower='noglob bower'

# Tmux
alias tm="tmuxinator"

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
alias dev='ssh -X dev' # requires that the 'dev' ssh alias be set up properly

# CTags

function generate_ctags {
  ctags -R --exclude=.git --exclude=log *
}

# Personal
alias projects='cl ~/Projects'
alias mine=projects
alias dev_aspen='terminitor start aspen_remote' # starts up 4 ssh tabs in my development instance, and puts me in the right directory/doing the right task. Requires terminitor.
alias local_aspen='terminitor start aspen_local' # starts up 4 ssh tabs in my local environment, and puts me in the right directory/doing the right task. Requires terminitor.
alias aspen='cl ~/Projects/doxo/aspen'
alias dogwood='cl ~/Projects/doxo/dogwood'
alias doxocom='cl ~/Projects/doxo/doxo-com/wp-content/themes/doxo'
alias doxoconnect='cl ~/Projects/doxo/doxoconnect'
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

export EDITOR=vim
export VISUAL=vim
#export PAGER=vimpager

unset MAILCHECK

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

[[ -s "/Users/mike/.rvm/scripts/rvm" ]] && source "/Users/mike/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Powerline
#. /Users/mike/.vim/bundle/powerline/powerline/bindings/zsh/powerline.zsh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Enable homebrew tab completion
fpath=($HOME/.zsh/func $fpath)
typeset -U fpath
