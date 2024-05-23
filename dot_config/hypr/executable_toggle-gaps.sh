#!/usr/bin/env bash
# This script toggles the currently set gaps.

# Set the gap size
gap_size=$(grep -oP 'gap_size *= *\K\d+' "$XDG_CONFIG_HOME"/hypr/hyprland.conf)

# Get the current gap size
current_gap=$(hyprctl getoption general:gaps_in | awk '{print $3}')

# Determine the new gap size
new_gap=$((current_gap == 0 ? gap_size : 0))

# Set the new gap size for both outer and inner gaps
hyprctl --batch "keyword general:gaps_out $new_gap; keyword general:gaps_in $new_gap"
