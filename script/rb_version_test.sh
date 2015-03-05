#!/usr/bin/env sh

echo "Testing readme md..."
if grep `cat .ruby-version` README.md > /dev/null 2>&1; then
  echo "Success"
else
  echo "Failed"
fi
