#!/bin/bash

update_marker=/_work/update_gitmirror.trigger

echo "Waiting for mirror update..."
if ! touch "$update_marker"; then
  echo "ERROR: Failed to touch update marker (permissions?): $update_marker"
  exit 1
fi

while [[ -f "$update_marker" ]]; do
  sleep 0.25
done

echo "Mirrors updated."

