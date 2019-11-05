#!/usr/bin/env bash

# Synopsis: Updates index.md

set -o errexit
set -o nounset

cd $(dirname $0)

echo -e "# Presentations\n" > index.md

PATHS=$(find -mindepth 2 -maxdepth 2 -name '*.pdf')

for path in $PATHS; do
  DIRECTORY_NAME=$(echo "$path" | sed -E 's/^\.\/([^/]+)\/.+/\1/')
  echo "- [$DIRECTORY_NAME]($path)" >> index.md
done
