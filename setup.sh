#!/bin/bash

set -eu

if test ! $(which xcodegen); then
  brew install xcodegen
fi