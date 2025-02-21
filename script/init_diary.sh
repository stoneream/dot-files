#!/bin/bash -ue

DIARY_PATH="$HOME/memo/diary"

if [ ! -d $DIARY_PATH ]; then
  echo "Error: $DIARY_PATH is not found."
  exit 1
fi

cd $DIARY_PATH

diary-generator init
