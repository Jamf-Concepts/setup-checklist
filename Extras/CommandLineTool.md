#  Command Line Tool

Setup Checklist has a command line tool which allows you to interact with the app from scripts and other automations.

The command line tool is `setupchecklist` and is located at `/Applications/Setup Checklist/Contents/Resources/`. For simplicity, the installer pkg creates a symbolic to the command line tool at `/usr/local/bin/setupchecklist`.

You can run `setupchecklist help` to get an overview of the available commands.

## Launch Setup Checklist

Most commands will require Setup Checklist to be running to work properly. You can launch Setup Checklist with `setupchecklist launch`.

## Get current step

Running `setupchecklist current` will return the identifier of the current step:

```shell
$ setupchecklist current
browser-edge
```

## Go to a specific step

You can tell Setup Checklist to go to a specific step, determined by the steps identifier:

```shell
$ setupchecklist goto browser-edge
```
