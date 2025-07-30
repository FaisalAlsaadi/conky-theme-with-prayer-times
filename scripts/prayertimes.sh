#!/bin/bash
# ENTER CITY AND COUNTY AND MEASUREMENT METHOD BELOW ACCORDING TO ALADHAN API https://aladhan.com/prayer-times-api
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

printf "%-9s %s\n" "     Fajr:" "   $fajr"
printf "%-9s %s\n" "	Dhuhr:" "$dhuhr"
printf "%-9s %s\n" "	Asr:" "$asr"
printf "%-9s %s\n" "	Maghrib:" "$maghrib"
printf "%-9s %s\n" "	Isha:" "$isha"

