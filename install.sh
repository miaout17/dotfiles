#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for name in bashrc bash_profile bash irbrc rails-templates gemrc screenrc richrc riplrc tmux.conf
do
  src="$DIR/$name"
  dst="$HOME/.$name"

  echo ln -s -f $src $dst
  rm -rf $dst
  ln -s -f $src $dst
done

