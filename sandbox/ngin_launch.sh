#!/bin/bash
# Launch MarketsWorld engines

## Define global variables
APP="cd $HOME/Projects/application/"
SDI="cd $HOME/Projects/stream-dispatcher/"
MWC="cd $HOME/Projects/mwd-comm"
MKD="cd $HOME/Projects/market-data"
DRT="cd $HOME/Projects/data-retention"
GME="cd $HOME/Projects/game"
REN="cd $HOME/Projects/resolve"
EXP="cd $HOME/Projects/expiry"
WDG="cd $HOME/Projects/watchdog"
# END global vars

# Create window 1
	# Run server thin
	# Add horizontal pane
	#	Run console on sandbox mode
	# Switch to right pane
	# Run DB console

# Create window 2
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
