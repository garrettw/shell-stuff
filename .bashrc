#!/usr/bin/env bash
# ~/.bashrc: executed by bash(1) for ALL non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export BASH_SILENCE_DEPRECATION_WARNING=1

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/bash lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
esac

function gitsegment() {
    cmdout="$(git branch --show-current 2> /dev/null)"
    if [ -n "$cmdout" ]; then
        echo "- on $(tput setaf 3)$cmdout$(tput sgr0)"
    else
        echo ""
    fi
}

PS1="\[$(tput setaf 1)\]\u\[$(tput sgr0)\]@\[$(tput setaf 2)\]\h\[$(tput sgr0)\]:\[$(tput setaf 4)\]\w\[$(tput sgr0)\] "'$(gitsegment)'"\n\$ "

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_aliases.local ] && source ~/.bash_aliases.local

# Begin commands for ONLY interactive shells
[[ $- != *i* ]] && return
# Commands below this will not be active for scripts run in a separate process

[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion


# Include Drush bash customizations.
[ -f ~/.drush/drush.bashrc ] && source ~/.drush/drush.bashrc

# Include Drush completion.
[ -f ~/.drush/drush.complete.sh ] && source ~/.drush/drush.complete.sh

# Include Drush prompt customizations.
[ -f ~/.drush/drush.prompt.sh ] && source ~/.drush/drush.prompt.sh


[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh


# Added by Encore-Dev-Scripts
[ -f ~/Encore-Dev-Scripts/completion.bash ] && source ~/Encore-Dev-Scripts/completion.bash
