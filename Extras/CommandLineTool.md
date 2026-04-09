#  Command Line Tool

Setup Checklist has a command line tool which allows you to interact with the app from scripts and other automations.

The command line tool is `setupchecklist` and is located at `/Applications/Setup Checklist/Contents/Resources/`. For simplicity, the installer pkg creates a symbolic to the command line tool at `/usr/local/bin/setupchecklist`.

You can run `setupchecklist help` to get an overview of the available commands.

## Launch Setup Checklist

Most commands will require Setup Checklist to be running to work properly. You can launch Setup Checklist with 

```shell
$ setupchecklist launch
```

## Get current step

Running `setupchecklist current` will return the identifier of the current step:

```shell
$ setupchecklist current
browser-edge
```

## Go to a specific step

You can tell Setup Checklist to go to a specific step, determined by the steps identifier:

```shell
$ setupchecklist goto <identifier>
```

## Get and update status

You can get the status of a step with

```shell
$ setupchecklist status <identifier>
suggested
```

You can set the status of a step with

```shell
$ setupchecklist status <identifier> <newStatus>
```

Possible status values are `suggested`, `error`, `canContinue`, and `completed`

## Set step values

You can set or update values of a step with

```shell
$ setupchecklist step <identifier> <key> <newValue>
```

Changes will not persist when Setup Checklist is quit and re-launched.

e.g.

```shell
$ setupchecklist step default-app-edge image "/Applications/Microsoft Edge.app"
```

The values you can use are: 

- `title`
- `icon`
- `image`
- `iconColor`
- `windowPosition`
- `movie`
- `accentColor`
- `item`
- `buttonLabel`

(Note: not all combinations haven been tested yet. Please file issues, when something doesn't work as expected.)
