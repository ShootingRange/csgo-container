#!/bin/sh
set -e

cat /usr/src/csgo/steamapps/appmanifest_740.acf | grep buildid | sed -E 's/^\s+"buildid"\s+"(.*?)"/\1/g' | tr -d '\r'
