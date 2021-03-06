# source /opt/local/etc/bash_completion.d/svn-completion.sh
source ~/bin/git-completion.bash

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# for bash-completion
# if [ -f /opt/local/etc/bash_completion ]; then
#     . /opt/local/etc/bash_completion
# fi

export PATH="$HOME/bin:$PATH"
export PATH=/bin:/sbin:$PATH
export PATH=/usr/bin:/usr/sbin:$PATH
# export PATH=~/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
#export PATH=~/.gem/ruby/1.8/bin:$PATH
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/opt/local/apache2/bin:/usr/local/bin/mysql:/usr/local/sphinx/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
