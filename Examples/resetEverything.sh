#!/bin/sh

#  resetEverything.sh
#  Setup Checklist

# this script resets settings performed by Setup Checklist for a new "fresh run"

# you will need to adapt this script to your needs
# pay attention to potentially destructive "resets" such as the `tccutil reset`

# uses/requires theses tools:
# https://github.com/scriptingosx/desktoppr
# https://github.com/scriptingosx/utiluti

desktoppr=/usr/local/bin/desktoppr
utiluti=/usr/local/bin/utiluti

echo "clear completed steps"
defaults delete com.jamf.setupchecklist statuses

echo "clear welcome app completed"
defaults delete com.jamf.setup.welcome completed

echo "reset default wallpaper"
if [ -x "$desktoppr" ]; then
  "$desktoppr" /System/Library/CoreServices/DefaultDesktop.heic
fi

echo "reset default browser"
if [ -x "$utiluti" ]; then
  "$utiluti" url set http com.apple.safari
  "$utiluti" url set mailto com.apple.mail
fi

echo "reset Screen Recording in Privacy"
tccutil reset ScreenCapture us.zoom.xos
tccutil reset ScreenCapture com.microsoft.teams2
