#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function slink { # src dst
  src=$1
  dst=$2

  # TODO: backup or ...
  echo "Making symbolic link: $src -> $dst"
  rm -rf $dst
  ln -s -f $src $dst
}

for name in bashrc bash_profile bash irbrc rails-templates gemrc screenrc richrc riplrc tmux.conf vim
do
  slink "$DIR/$name" "$HOME/.$name"
done

slink "$DIR/vim/vimrc" "$HOME/.vimrc"

