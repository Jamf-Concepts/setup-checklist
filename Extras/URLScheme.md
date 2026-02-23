#  Setup Checklist URL Scheme

You can use URL calls to remote control some aspects of Setup Checklist. Its url scheme is `jamf-setupchecklist`.

From a shell script, you can use the `open` command:

```shell
$ open "jamf-setupchecklist:"
```

## Launch Setup Checklist

You can launch Setup Checklist with `jamf-setupchecklist:`

## Go to a Specific Step

You can tell Setup Checklist to launch and go to a specific step, determined by the step's identifier.

Example: `jamf-setupchecklist:goto/browser-edge

## Change Status

You can change the `completed` status of a step with this call.

`jamf-setupchecklist:step/browser-edge?status=completed`

`jamf-setupchecklist:step/browser-edge?status=suggested`

Note that many will recalculate the completed status when the step is loaded and right before it is shown, so manually overwriting the completed status may have limited effect.

Valid values are `completed`, `suggested`, `error`
