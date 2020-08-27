# CS:GO container

The Counter Strike: Global Offensive server packaged into minimalist container.

## Configuration

The server will automaticly execute the `/usr/src/csgo/csgo/cfg/instance.cfg` config. If further configuration files needs to be loaded add a `+exec $CFG_FILE` argument to the commandline, and drop the configuration file in `/usr/src/csgo/csgo/cfg/*.cfg`. Take care not use `exec` statement inside configuration files loaded using a `exec` statement since this will result in nothing happening.

The environment variable `CSGO_GSLT` has too be set too a valid GSLT token. Get one from https://steamcommunity.com/dev/managegameservers

A couple of settings come preconfigured and can be overridden by setting some environment variables as listed in the below table:

Name | Default | Description
-----|---------|------------
`CSGO_TICKRATE` | `128` | Tickrate
`CSGO_GAME_PORT` | `27015` | Game and RCON port
`CSGO_MAXPLAYER` | `10` | Max number of players. Increase to allow for spectators
`CSGO_MAPGROUP` | `mg_active` | List of maps used during auto rotation. Defaults to maps in active duty
`CSGO_MAP` | `de_dust2` | First map loaded
`CSGO_GSLT` | *none* | GSLT token, get one from https://steamcommunity.com/dev/managegameservers
`DISABLE_AUTOUPDATE` | *empty* | Setting this disables automatic updating of CS:GO during container startup

## Workshop maps

See https://developer.valvesoftware.com/wiki/CSGO_Workshop_For_Server_Operators
