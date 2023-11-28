#!/bin/bash

td="$(cd $(dirname $0)/.. && pwd)"
roots="$(find $td/mirrors -name '*.git')"

for root in $roots; do
  if ! [[ -f "$root/HEAD" ]]; then
    continue
  fi
  url_path="${root##${td}/mirrors/}"
  orig_url="https://$url_path"
  file_path="$root"
  echo "Redirecting: $orig_url -> $file_path"
  git config --global url."$file_path".insteadOf $orig_url
done

echo "Enabling file protocol"
git config --global protocol.file.allow always

