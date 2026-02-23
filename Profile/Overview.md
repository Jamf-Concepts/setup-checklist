#  Setup Checklist - Overview

Setup Checklist is an app that welcomes the user to their new Mac and guides them through some setup steps that cannot be automated, or that the user should take note of or have a choice in. Setup Checklist allows an admin to configure this first login experience to match your organisation, branding and workflow.

## The applications

Setup Checklist is comprised of two apps. The main Setup Checklist app and a helper app called "Welcome" which displays the initial full screen welcome message and language chooser. This allows the Welcome app to change the language and localization settings Setup Checklist and other apps, before they launch.

You can skip the the full screen welcome message by setting the `showWelcome` key in the Welcome app's Profile to `true`.

## Configuration

Setup Checklist and Welcome app are configured with configuration profiles. Each app has their own preference domain.

- [Setup Checklist](SetupChecklist.md)
- [Welcome screen and language chooser](Welcome.md)

You can find example plist files for each [in the Examples folder](../Examples).

## Steps

The main configuration in the Setup Checklist app are the [steps](SetupChecklist.md#steps) that the user will be guided through.

There are different 'kinds' of steps:

- [message](SetupChecklist.md#message-2)
- [open](SetupChecklist.md#open)
- [wallpaper](SetupChecklist.md#wallpaper)
- [browser](SetupChecklist.md#default-browser)
- [screensharing](SetupChecklist.md#screen-recordingsharing)
- [script](SetupChecklist.md#script)
  - [detailed example implementation](ScriptStep.md)

And we are planning to add more going forward.

## Managed Login Items and Privacy Preferences Policy Control

Setup Checklist requires the following exemptions in privacy, which you should deploy with a PPPC profile:

- SystemPolicyAllFiles (Full disk access): required for `screensharing` step

The app identifier is `com.jamf.setupchecklist` and the code requirement is:

```
anchor apple generic and identifier "com.jamf.setupchecklist" and (certificate leaf[field.1.2.840.113635.100.6.1.9] /* exists */ or certificate 1[field.1.2.840.113635.100.6.2.6] /* exists */ and certificate leaf[field.1.2.840.113635.100.6.1.13] /* exists */ and certificate leaf[subject.OU] = "483DWKW443")
```

You also want to pre-approve the launch agent. Add a 'Managed Login Items' payload to the profile with the rule type 'Bundle Identifier', rule value `com.jamf.setupchecklist` and team identifier `483DWKW443`.

You can find a [mobileconfig file with these two payloads](../Examples/SetupChecklistPPPCLogin.mobileconfig) in the [Examples](../Examples).


## Workflow

The installation contains a LaunchAgent plist. If a user is logged in during the installation it will launch the Welcome app immediately, otherwise it will be launched at the next log in of a user. 

When the user clicks "Continue" on the welcome screen, a `completed` key in the Welcome app's preference domain is set to `true`. When the Welcome app launches again (at next user login or because it was launched manually) it checks for this key. When it is set, the app will do nothing and terminate immediately.

You can see the status of the `completed` key with:

```shell
$ defaults read com.jamf.setup.welcome completed
1
```

This will return `1` when the completed key is set and Welcome app will not re-launch. It will return `0` or an error that the 'domain/default pair' does not exist otherwise.

This will prevent the launch of the Welcome app, automated or manual, but the main Setup Checklist app will still be able to be re-launched manually.

When the main Setup Checklist app is launched, it will read the `steps` configured in the profile one by one and evaluate them. When there is insufficient or erroneous data for a given step kind, an [error is logged](../Extras/Logging.md) and the step will be skipped.

Some kinds of steps can determine if their target setting is already configured correctly and will be marked as 'Completed' and shown in that section in the sidebar list. A user can still click on the step to call it up and, when possible, re-do the setting. When Setup Checklist is re-launched, the status will be re-evaluated, though the exact behavior depends on the kind of setting.

All steps will store their completed status in the `completedSteps` with the preference domain. You can read this with

```shell
 $ defaults read com.jamf.setupchecklist completedSteps
{
    "browser-edge" = 1;
    movie = 1;
    "screensharing-new" = 1;
    "thankyou-message" = 1;
    wallpaper = 1;
    "welcome-message" = 1;
}
```
The keys in this list are the identifier of each step. They will not necessarily be shown in the correct order. When the value of a key is `1` the step is completed. When the value is `0` or the key is missing the step is not completed.

## Testing

While testing can re-launch Setup Checklist over and over again. Setup Checklist will determine the state of each step when it loads the profile. You may need to reset the `completedSteps` default to get a proper fresh run:

```
$ defaults delete com.jamf.setupchecklist completedSteps
```

Since the app also changes other settings, you may want to build a script that resets the settings to on "out of box" value during your testing. You can find [a sample script here](../Examples/resetEverything.sh), but you will have to adapt it for your particular workflow.

You can also set the `DEBUG` key in the profile to `true`. With this value set, Setup Checklist will not apply any changes to the system and you can always proceed through the steps. This is useful for testing the user interface.
