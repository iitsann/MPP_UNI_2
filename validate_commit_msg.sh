#!/bin/bash

# Validate commit message
validate_commit_msg() {
  message=$(cat "$1")
  if ! echo "$message" | grep -Eq '^TASK: .*'; then
    echo "Error: Commit message should start with 'TASK: '!"
    exit 1
  fi
}

# Validate commit message
validate_commit_msg "$1"
