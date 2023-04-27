#!/bin/bash

# set the source and destination paths

echo "enter the path:"
read src

echo "enter the path:"
read dest

# check if the source file exists
if [ -f "$src" ]; then
  # move the file to the destination directory
  cp "$src" "$dest"
  echo "File moved successfully to $dest"
else
  echo "File not found at $src"
fi

