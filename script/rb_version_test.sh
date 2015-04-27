#!/usr/bin/env sh

echo "Testing readme md..."

if grep `cat .ruby-version` README.md > /dev/null 2>&1; then
  echo "Success"
  exit 0
else
  echo "Failed"
  exit 1
fi
