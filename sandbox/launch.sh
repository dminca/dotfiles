#!/bin/sh
# Create session, detach it and name it
tmux new-session -d -s devel
 
tmux new-window -t devel:1 -n 'Server1' 'ssh root@10.x.x.x'
tmux new-window -t devel:2 -n 'Server2' 'ssh root@10.x.x.x'
tmux new-window -t devel:3 -n 'Server3' 'ssh root@10.x.x.x'
tmux new-window -t devel:4 -n 'Server4' 'ssh root@10.x.x.x'
tmux new-window -t devel:5 -n 'Server5' 'ssh root@10.x.x.x'
 
tmux select-window -t devel:1
tmux -2 attach-session -t devel
