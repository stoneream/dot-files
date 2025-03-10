#!/bin/bash -ue

TARGET_DIR=$1
OUTPUT_FILE=$2

if [ ! -d $TARGET_DIR ]; then
  echo "指定されたディレクトリが存在しません: $TARGET_DIR"
  exit 1
fi

if [ -z $OUTPUT_FILE ]; then
  OUTPUT_FILE="result.txt"
fi

find "$TARGET_DIR" -type f | while IFS= read -r FILE
do
  echo "--- $FILE ---" >> "$OUTPUT_FILE"

  if file "$FILE" | grep -q text; then
    cat "$FILE" >> "$OUTPUT_FILE"
  fi

  echo -e "\n\n" >> "$OUTPUT_FILE"
done
