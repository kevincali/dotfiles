#!/usr/bin/env sh
# This script is used to launch rofi-rbw and if necessary set the rbw pinentry config.

if ! rbw unlocked; then
    echo "Bitwarden is locked"
    rbw config set pinentry pinentry-rofi
fi

rofi-rbw --selector-args "rofi -theme catppuccin-mocha-large"
