#!/bin/bash

# Specify IDs of Counter Strike: Global Offensive workshop content as arguments.
# Login is required to download CS:GO workshop items, otherwise steamcmd will claim it does not exist.
#
# Note: In the future a Steam login may be required to download workshop content.

echo "$@" | xargs printf -- '+workshop_download_item 730 %s\n' | cat - <(echo "+quit") | xargs /usr/src/steamcmd/steamcmd.sh +login anonymous +force_install_dir /usr/src/csgo
