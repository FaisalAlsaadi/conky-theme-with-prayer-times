#!/bin/bash
 
# DATA
playing=' '
pause=' '
# status=` dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' | tail -1 | cut -d "\"" -f2`
# ---


# PLAY_PAUSE_FUNC
symDisplay() {
    if [ "$status" = "Playing" ]; then
        echo $playing
    else
        echo $pause
    fi
}

# statStr() {
# 	 echo $status
# }
# ---


# ACT_TO_ARGS
# if [ "$1" = "--stat_str" ]; then
    # statStr
if [ "$1" = "--sym_display" ]; then
    symDisplay
else
    echo "invalid args: $1"
fi
