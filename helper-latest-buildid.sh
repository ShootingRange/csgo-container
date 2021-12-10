#!/bin/sh
set -e

steamcmd/steamcmd.sh +login anonymous +app_info_update 1 +app_info_print 740 +quit | grep -Pzo '"branches"\s+{\s+"public"\s+{(\s+".*?"\s+".*?")*\s+"buildid"\s+"(.*?)"(\s+".*?"\s+".*?")*\s*}' | grep -a "buildid" | sed -E 's/^\s+"buildid"\s+"(.*?)"/\1/g'
