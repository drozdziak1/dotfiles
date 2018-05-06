#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# make composer binaries executable
export PATH="$PATH:$HOME/.composer/vendor/bin"
# make rails binaries executable
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.composer/vendor/bin:$HOME/.gem/ruby/2.2.0/bin

# start a powerline
source $HOME/.bash-powerline.sh

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# added by travis gem
[ -f /home/drozdziak1/.travis/travis.sh ] && source /home/drozdziak1/.travis/travis.sh
