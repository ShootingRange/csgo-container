#!/bin/sh
set -e

grep buildid /usr/src/csgo/steamapps/appmanifest_740.acf | sed -E 's/^\s+"buildid"\s+"(.*?)"/\1/g' | tr -d '\r'
