#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# make composer binaries executable
export PATH="$PATH:~/.composer/vendor/bin"
# make rails binaries executable
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:~/.composer/vendor/bin:~/.gem/ruby/2.2.0/bin

# start a powerline
source ~/.bash-powerline.sh
