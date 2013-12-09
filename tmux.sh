#!/bin/bash
COMMAND='tmux -S /var/tmux/pairing'
$COMMAND new-session -d -s air -n "main"
$COMMAND send-keys -t air 'cd ~/dev; clear' C-m

$COMMAND splitw -t air -p 30

$COMMAND new-window -t air -n "shell" -d

$COMMAND attach -t air
