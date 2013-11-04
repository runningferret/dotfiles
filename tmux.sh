#!/bin/bash
COMMAND='tmux -S /var/tmux/pairing'
$COMMAND new-session -d -s air -n "main"

$COMMAND splitw -d
$COMMAND splitw -d
$COMMAND select-layout main-horizontal

$COMMAND new-window -t air -n "shell" -d

$COMMAND attach -t air
