#!/usr/bin/env bash
#
# Bootstrap
#
# Get readly to develop Kachime

set -e

#
# Welcome to Kachime
#

echo ""
echo "  Kachime"
echo ""

#
# Check for Bundler
#
if type bundle > /dev/null 2>&1; then
  echo "  + Bundler found."
else
  echo "  x You need to install Bundler:"
  echo "    $ gem install bundler"
  exit 1
fi

#
# Check for Homebrew
#
if type brew > /dev/null 2>&1; then
  echo "  + Homebrew found."
else
  echo "  x You need to install Homebrew:"
  echo "    $ ruby -e '\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)'"
  exit 1
fi

# Update Homebrew formula
echo "  + Updating Homebrew..."
brew update

#
# Check for MySQL
#
if ps aux | grep -v 'grep' | grep 'mysql' > /dev/null 2>&1 && type mysql > /dev/null 2>&1; then
  echo "  + MySQL found."
else
  echo "  x Maybe you didn't install MySQL or set path for it."
  echo "    You can install it:"
  echo "    $ brew install mysql"
  exit 1
fi

#
# Creating Guard config file
#
if [ ! -d ./Guardfile ]; then
  echo "  + Creating Guardfile"
  cp Guardfile.sample Guardfile
else
  echo "  + Guard config file 'Guardfile' found."
fi

#
# Install Gems
#
echo "  + Installing gems."
bundle install --quiet --jobs=4 --path=./vendor/bundle

#
# Startup instructions
#
echo ""
echo "  It's all done. We're ready."
echo ""
echo "  Run 'bin/rails s' to start rails server."
echo "  And you can see Kachime app on 'locahost:3000'"
echo ""

exit 0