#!/usr/bin/env bash

function cl() {
  DIR="$*";
  # if no DIR given, go home
  if [ $# -lt 1 ]; then
    DIR=$HOME;
  fi;
  cd "${DIR}" && ls -FG
}

function mdcd() {
  mkdir "$1" && cd "$1" || return
}

function rdcd() {
  cd .. && rmdir "$PWD"
}

function ldbim() {
  lando db-import "$1" && mv "$1" ..
}

function ldbex() {
  lando db-export "$1"
}

alias cg='cd $(git rev-parse --show-toplevel)'
alias l='ls -FG'
alias l1='ls -FG1'
alias ls='ls -FG'
alias ll='ls -Glh'
alias md='mkdir'
alias rd='rmdir'

alias ld='lando drush'
alias dup='lando drush up'
alias dupy='lando drush -y up'
alias dupn='lando drush -n up'
alias den='lando drush -y en'
alias ddis='lando drush dis'
alias dupdb='lando drush updb'
alias ddl='lando drush dl'
alias drf='lando drush rf'
alias dcc='lando drush cc all' # D7
alias dcr='lando drush cr' # D8

alias lc='lando composer'
alias cin='lando composer install' # installs only what's specified in lock file
alias cup='lando composer update'  # recalculates latest deps and rewrites lock file
alias crq='lando composer require'
