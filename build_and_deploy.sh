#!/bin/sh
set -e
set -o xtrace

# Clone important repos
git clone https://github.com/arg3nt/chera_dev -b $chera_dev_branch

# Build chera_dev main site
cd chera_dev
/flutter/bin/flutter build web

# Copy files to release directory
cp -a build/web/. /release/

cd ..
