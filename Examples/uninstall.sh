#!/bin/sh

# uninstall.sh

# removes Setup Checklist app and all related files

export PATH=/usr/bin:/bin:/usr/sbin:/sbin

appName="Setup Checklist"
bundleID="com.jamf.setupchecklist"

appPath="/Applications/${appName}.app"

if [ "$(whoami)" != "root" ]; then
    echo "needs to run as root!"
    exit 1
fi

echo "removing files"
rm -rfv "$appPath"
rm -v "/usr/local/bin/setupchecklist"
rm -v /Library/LaunchAgents/"$bundleID".plist

echo "forgetting $bundleID pkg receipt"
pkgutil --forget "$bundleID"

# always exit success regardless of exit code of above commands
exit 0
