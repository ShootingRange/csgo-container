#!/bin/sh
set -x

CONTAINER="$1"

# Check if appmanifest exists in the container
docker run --rm --entrypoint=/usr/bin/test "${CONTAINER}" -f /usr/src/csgo/steamapps/appmanifest_740.acf || exit 1

# Extract buildid from the appmanifest
BUILDID="$(docker run --rm --entrypoint=/bin/sh $CONTAINER /usr/src/helper-installed-buildid.sh)"

# Build the new tag
# Check if the container name already contains a tag
echo "${CONTAINER}" | grep ":" >/dev/null
if [ "$?" -ne 0 ]; then
	TAGGED_CONTAINER="${CONTAINER}:buildid-${BUILDID}"
else
	TAGGED_CONTAINER="${CONTAINER}-buildid-${BUILDID}"
fi

docker tag "${CONTAINER}" "${TAGGED_CONTAINER}" || exit 1

echo "${TAGGED_CONTAINER}"
