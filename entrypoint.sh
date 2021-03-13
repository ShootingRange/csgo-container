#!/bin/sh

# Install or update CS:GO
if [ ! -d "/usr/src/csgo" ]; then
	/usr/src/install-csgo.sh	
elif [ -z "${DISABLE_AUTOUPDATE}" ]; then
	/usr/src/update-csgo.sh
fi

# Check for GSLT token
if [ -z "$CSGO_GSLT" ]; then
	echo "CSGO_GSLT is not set, this is required to run a public server"
	echo "Visit https://steamcommunity.com/dev/managegameservers to get a token"
	exit 1
fi

# Execute CS:GO
export LD_LIBRARY_PATH="/usr/src/csgo/bin:/usr/src/csgo:$LD_LIBRARY_PATH"
exec /usr/src/csgo/srcds_linux \
	-game csgo \
	-net_port_try 1 \
	-ip 0.0.0.0 \
	-tickrate "${CSGO_TICKRATE:-128}" \
	-port "${CSGO_GAME_PORT:-27015}" \
	-usercon \
	-maxplayers "${GSGO_MAXPLAYER:-10}" \
	+sv_setsteamaccount "${CSGO_GSLT}" \
	+mapgroup "${CSGO_MAPGROUP:-mg_active}" \
	+map "${CSGO_MAP:-de_dust2}" \
	"$@" \
	+exec "instance.cfg"
