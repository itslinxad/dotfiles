#!/bin/bash

SESSION_NAME="main" # Or any name you prefer

# Check if the session already exists
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? -eq 0 ]; then
  # If the session exists, reattach to it
  exec tmux attach-session -t $SESSION_NAME
else
  # If the session doesn't exist, start a new one and attach
  exec tmux new-session -s $SESSION_NAME
fi

