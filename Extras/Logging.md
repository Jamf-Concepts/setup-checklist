# Logging

While Setup Checklist is running you can open a log window with command-L.

Setup Checklist and Welcome app use macOS unified system logging. That means you can follow events in the Console app. The subsystems are `com.jamf.setupchecklist` and `com.jamf.setup.welcome`.

You can also use the `log` command line tool to read the log.

For example:

```
sudo log show --last 60m --predicate 'subsystem="com.jamf.setupchecklist"'
```
