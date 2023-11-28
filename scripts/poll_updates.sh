#!/bin/bash

td="$(cd $(dirname $0)/.. && pwd)"
UPDATE_MARKER=/_work/update_gitmirror.trigger

while true; do
  if [ -f "$UPDATE_MARKER" ]; then
    echo "Updating mirrors..."
    if $td/scripts/update_mirrors.sh update; then
      echo "Mirror update success."
      rm -f "$UPDATE_MARKER"
    else
      echo "Mirror update failure."
    fi
  fi
  sleep 1
done

