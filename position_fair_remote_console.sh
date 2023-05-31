#!/usr/bin/env bash


# Position a window at the start of the 3rd monitor from top to bottom
# and left to right over into the 4th monitor.
#
# Setup for 4 monitor config from left to right.
# 1 - 1680x1050
# 2 - 1280x1024
# 3 - 1280x1024
# 4 - 1280x1024

# All monitor details from left to right with tops of monitors aligned.
# Monitor 1
#MON_1_WIDTH=1680
#MON_1_HEIGHT=1050
MON_1_WIDTH=1280
MON_1_HEIGHT=1024
# Monitor 2
MON_2_WIDTH=1280
MON_2_HEIGHT=1024
# Monitor 3
MON_3_WIDTH=1280
MON_3_HEIGHT=1024
# Monitor 4
MON_4_WIDTH=1280
MON_4_HEIGHT=1024

# Array for height and width layouts
# (Monitor_1 Monitor_2 Monitor_3 ... )
MONITOR_HEIGHTS=(1024 1024 1024)
MONITOR_WIDTHS=(1280 1280 1280)

# Assumed to cross only 2 monitors
START_MONITOR=2
END_MONITOR=$(( $START_MON + 1 ))

# Window Top Border spacing in pixels
WINDOW_TOP_BORDER=38
WINDOW_TITLE_SEARCH_PATTERN=fair  # Word in windows total. Assume only one matching result.

# Calculate the required width and height plus the x,y top left corner offset.
WINDOW_WIDTH=$(( ${MONITOR_WIDTHS[$START_MONITOR - 1]} + ${MONITOR_WIDTHS[$END_MONITOR - 1]} ))  # Horizontal, left to right size.
#WINDOW_WIDTH=1920  # Horizontal, left to right size.
WINDOW_HEIGHT=$(( ${MONITOR_HEIGHTS[$START_MONITOR - 1]} - $WINDOW_TOP_BORDER ))  # Vertical, top to bottom size. (Reserve space for window border)
WINDOW_TOP_LEFT_X=$(( ${MONITOR_WIDTHS[$START_MONITOR - 1]} ))  # How far in from the left.
WINDOW_TOP_LEFT_Y=0  # How far down from the top.

echo "Window Width: $WINDOW_WIDTH"
echo "Window Height: $WINDOW_HEIGHT"
echo "Window Top Left X: $WINDOW_TOP_LEFT_X"
echo "Window Top Left Y: $WINDOW_TOP_LEFT_Y"
# Chain together xdotool commands to find window ID, set window size and position window on screen.
WINDOW_POSITIONING_COMMAND="xdotool search --name $WINDOW_TITLE_SEARCH_PATTERN windowsize $WINDOW_WIDTH $WINDOW_HEIGHT windowmove $WINDOW_TOP_LEFT_X $WINDOW_TOP_LEFT_Y"
echo "Running Command: $WINDOW_POSITIONING_COMMAND"
eval $WINDOW_POSITIONING_COMMAND
