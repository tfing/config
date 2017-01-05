#!/bin/bash
# 
# reference: http://unix.stackexchange.com/questions/57641/reload-of-tmux-config-not-unbinding-keys-bind-key-is-cumulative

echo "unbind-key -a" > .tmux.reset.conf
tmux -f /dev/null -L temp start-server \; list-keys | \
  sed -r \
  -e "s/bind-key(\s+)([\"#~\$])(\s+)/bind-key\1\'\2\'\3/g" \
  -e "s/bind-key(\s+)([\'])(\s+)/bind-key\1\"\2\"\3/g" \
  -e "s/bind-key(\s+)([;])(\s+)/bind-key\1\\\\\2\3/g" \
  -e "s/command-prompt -I #([SW])/command-prompt -I \"#\1\"/g" \
  >> .tmux.reset.conf

tmux source-file .tmux.reset.conf
rm .tmux.reset.conf

