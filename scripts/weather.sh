#!/bin/bash

API_KEY=""
CITY="Doha"
COUNTRY="QA"

response=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=${CITY},${COUNTRY}&units=metric&appid=${API_KEY}")
if [[ $? -ne 0 || -z "$response" ]]; then
  echo "Failed to fetch weather"
  exit 1
fi

temp=$(echo "$response" | jq '.main.temp' | awk '{printf("%.1f°C", $1)}')
condition=$(echo "$response" | jq -r '.weather[0].description' | sed 's/\b\(.\)/\u\1/g')

echo "${temp}, ${condition}"

