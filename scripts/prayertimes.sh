#!/bin/bash

json=$(curl -sL "https://api.aladhan.com/v1/timingsByCity?city=Doha&country=Qatar&method=10")

if [[ -z "$json" ]]; then
    echo "Failed to fetch prayer times."
    exit 1
fi

fajr=$(echo "$json" | jq -r '.data.timings.Fajr')
dhuhr=$(echo "$json" | jq -r '.data.timings.Dhuhr')
asr=$(echo "$json" | jq -r '.data.timings.Asr')
maghrib=$(echo "$json" | jq -r '.data.timings.Maghrib')
isha=$(echo "$json" | jq -r '.data.timings.Isha')

# Use fixed spacing with dots for better alignment visibility
echo "$fajr"
echo "$dhuhr"
echo "$asr"
echo "$maghrib"
echo "$isha"
