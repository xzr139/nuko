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
if type bundle &> /dev/null; then
  echo "  + Bundler found."
else
  echo "  x You need to install Bundler:"
  echo "    $ gem install bundler"
  exit 1
fi

#
# Check for Homebrew
#
if type brew &> /dev/null; then
  echo "  + Homebrew found."
else
  echo "  x You need to install Homebrew:"
  echo "    $ ruby -e '\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)'"
  exit 1
fi

# Update Homebrew formula
echo "  + Updating Homebrew..."

if brew update; then
  echo "  + Formulas was successfully updated."
else
  echo "  x Formulas was unsuccessfully updated."
  exit 1
fi

#
# Check for MySQL
#
if ps aux | grep -v 'grep' | grep 'mysql' &> /dev/null && type mysql &> /dev/null; then
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
if [ -d ./Guardfile ]; then
  echo "  + Guard config file 'Guardfile' found."
else
  echo "  + Creating Guardfile"
  cp Guardfile.sample Guardfile
fi

#
# Install Gems
#
echo "  + Installing gems."

if bundle install --quiet --jobs=4 --path=./vendor/bundle; then
  echo "  + Gems was successfully installed."
else
  echo "  x Gems was unsuccessfully installed."
  exit 1
fi

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
