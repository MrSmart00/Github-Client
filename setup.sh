#!/bin/bash

set -eu

if test ! $(which mint); then
  brew install mint
fi

if test ! $(which xcodegen); then
  brew install xcodegen
fi