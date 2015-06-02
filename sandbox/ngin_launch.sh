#!/bin/sh
###############################
# Launch MarketsWorld engines #
###############################
## Define paths
APP="$HOME/Projects/application/"
SDI="$HOME/Projects/stream-dispatcher/"
MWC="$HOME/Projects/mwd-comm"
MKD="$HOME/Projects/market-data"
DRT="$HOME/Projects/data-retention"
GME="$HOME/Projects/game"
REN="$HOME/Projects/resolve"
EXP="$HOME/Projects/expiry"
WDG="$HOME/Projects/watchdog"
# END global vars

tmux new-session -d -s devel

# Create window 1
tmux send-keys -t development 'cd $APP' C-m

	# Run server thin
   
	# Add horizontal pane
	#	Run console on sandbox mode
	# Switch to right pane
	# Run DB console

# Create window 2
tmux send-keys -t development 'cd $SDI' C-m

	# cd in stream-dispatcher
	# Run node server.js

	# Add vertical pane
	# cd in mwd-comm
	# run node app.js

	# Add horizontal pane
	# cd in market data
	# Run bundle exec bin/market-data

	# Add vertical pane
	# cd in data-retention
	# Run bundle exec bin/...

	# Add horizontal pane
	# cd game
	# Run bundle exec bin/..
	
	# Add vertical pane
	# cd resolve
	# Run bundle exec bin/...

	# Add horizontal pane
	# cd expiry
	# Run bundle exec bin/..

	# Add vertical pane
	# cd watchdog
	# Run bundle exec bin/...
