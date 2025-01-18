#!/usr/bin/env bash
# This script displays online voice channel users of a Discord server that I use.
# The endpoint is available due to a custom Discord bot.
# There is no official Discord API for this functionality, as far as I know.

# param --exec-if is defined:
# exit with 1 if a screen is shared
# exit with 0 if no screen sharing is active
if [[ "$1" == "--exec-if" ]]; then
    pw-dump | \
      jq --exit-status 'map(.info?.props?) |
          map(select(.["node.name"]? == "xdg-desktop-portal-hyprland")) |
          map(.["stream.is-live"]? == true) .[]' &>/dev/null \
      && exit 1 \
      || exit 0
fi

curl --silent \
  --show-error \
  --user "$(rbw get discord-cakebot --field BasicAuth)" \
  "$(rbw get discord-cakebot --field Endpoint)"
