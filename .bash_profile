# source /opt/local/etc/bash_completion.d/svn-completion.sh
source ~/.git-completion.bash

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# export RUBYOPT=rubygems
##
# Your previous /Users/mike/.bash_profile file was backed up as /Users/mike/.bash_profile.macports-saved_2009-11-24_at_18:22:58
##

# MacPorts Installer addition on 2009-11-24_at_18:22:58: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# for bash-completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi