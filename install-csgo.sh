#!/bin/bash

/usr/src/steamcmd/steamcmd.sh +login anonymous +force_install_dir /usr/src/csgo +app_update 740 +quit

# Fix curl dependency
#ln -s /usr/lib/i386-linux-gnu/libcurl.so.4 /usr/src/csgo/bin/libcurl.so
