#!/bin/bash -ue

cd $(dirname $0)


DOT_FILES_PATH=$(readlink -f ../)

# ファイル内の {{DOT_FILES_PATH}} を実際のパスに置換し、 crontab に登録
cat crontab_template.txt | sed -e "s|{{DOT_FILES_PATH}}|$DOT_FILES_PATH|g" | crontab -
