#!/bin/bash -ue

DIARY_PATH="$HOME/memo/diary"

if [ -e $DIARY_PATH ]; then
  exit 1
fi

cd $DIARY_PATH

diary-generator init
