# source /opt/local/etc/bash_completion.d/svn-completion.sh

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# for bash-completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

export PATH=/bin:/sbin:$PATH
export PATH=/usr/bin:/usr/sbin:$PATH
export PATH=~/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# export PATH=~/.gem/ruby/1.8/bin:$PATH
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/opt/local/apache2/bin:/usr/local/mysql/bin:/usr/local/sphinx/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
# export PATH=/usr/local/Cellar/php/5.3.6/bin:$PATH
# export PATH='`brew --prefix php`'/bin:$PATH

# Authme function (railsrumble)
function authme {
ssh $1 'cat >>.ssh/authorized_keys' <~/.ssh/id_rsa.pub
}

# REE tweaks
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# This is a good place to source rvm v v v
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

[[ -s "/Users/mike/.rvm/scripts/rvm" ]] && source "/Users/mike/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
