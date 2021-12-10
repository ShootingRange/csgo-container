#!/bin/sh

LATEST_BUILDID="$(/usr/src/helper-latest-buildid.sh)"
INSTALLED_BUILDID="$(/usr/src/helper-installed-buildid.sh)"

test "${LATEST_BUILDID}" = "${INSTALLED_BUILDID}"
COMPARE=$?
echo $COMPARE
exit $COMPARE
