#  Setup Checklist - Overview

Setup Checklist is a Jamf-powered tool that presents users with a guided experience on their new Mac.

You (the admin) define the steps, like setting or choosing default apps, configure permissions, choose wallpapers, and users work through them at first login. Configured with configuration profiles, supports localization, and integrates with your existing Jamf workflows.

The onboarding setup checklist that helps users complete required setup tasks before they start working.

## The applications

Setup Checklist is comprised of two apps. The main Setup Checklist app and a helper app called "Welcome" which displays the initial full screen welcome message and language chooser. This allows the Welcome app to change the language and localization settings Setup Checklist and other apps, before they launch.

You can skip the full screen welcome message by setting the `showWelcome` key in the Welcome app's Profile to `false`.

## Installation

Setup Checklist works with and _requires_ a Mac managed with either Jamf Pro or Jamf School. When the Mac is managed with Jamf School [the Scripting Module _must_ be enabled](https://learn.jamf.com/en-US/bundle/jamf-school-documentation/page/Scripts.html).

Download [the latest pkg installer file](https://github.com/Jamf-Concepts/setup-checklist/releases/latest) from releases.

The easiest is to upload the pkg to your Jamf server and install it early in the enrollment, either as a Prestage pkg or with [Setup Manager](https://github.com/jamf/setup-manager) in a policy.

The pkg installer will install:

- Setup Checklist app in `/Applications`
- LaunchAgent `com.jamf.setupchecklist.plist` in `/Library/LaunchAgents`
- a symbolic link `setupchecklist` to the command line tool in `/usr/local/bin`

The LaunchAgent will be loaded (i.e. launch the Welcome app )at installation when a user is logged in. You can prevent the launch of the Welcome app by setting its `completed` default before installation. (Either with defaults or welcome.)

```shell
defaults write com.jamf.setup.welcome completed -bool YES
```

You can then later choose to launch Welcome.app or Setup Checklist manually, or using the `setupchecklist` command line tool.


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
- [defaultApp](SetupChecklist.md#default-app)
- [screensharing](SetupChecklist.md#screen-recordingsharing)
- [script](SetupChecklist.md#script)
  - [detailed example implementation](ScriptStep.md)

And we are planning to add more going forward.

## Managed Login Items and Privacy Preferences Policy Control

Setup Checklist requires the following exemptions in privacy, which you should deploy with a PPPC profile:

- SystemPolicyAllFiles (Full disk access): required for `screensharing` step, likely required for `script` step, depending on what the scripts do

The app identifier is `com.jamf.setupchecklist` and the code requirement is:

```
anchor apple generic and identifier "com.jamf.setupchecklist" and (certificate leaf[field.1.2.840.113635.100.6.1.9] /* exists */ or certificate 1[field.1.2.840.113635.100.6.2.6] /* exists */ and certificate leaf[field.1.2.840.113635.100.6.1.13] /* exists */ and certificate leaf[subject.OU] = "483DWKW443")
```

You also want to pre-approve the launch agent. Add a 'Managed Login Items' payload to the profile with the rule type 'Bundle Identifier', rule value `com.jamf.setupchecklist` and team identifier `483DWKW443`.

You can find a [mobileconfig file with these two payloads](../Examples/SetupChecklistPPPCLogin.mobileconfig) in the [Examples](../Examples).

When you have `script` steps start processes that require other PPPC exemptions, such as sending Apple Events/AppleScript to another process, then you need to give this PPPC setting to Setup Checklist, since the system will see it as the parent process. These are not included in the sample profile.

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

All steps will store their completed status in the `statuses` dictionary in the preference domain. You can read this with

```shell
 $ defaults read com.jamf.setupchecklist statuses
{
    "default-app-browser" = suggested;
    "default-app-pdf" = completed;
    "screensharing-new" = completed;
    "script-remote-login" = suggested;
    "temporary-placeholder" = suggested;
    "thankyou-message" = suggested;
    wallpaper = canContinue;
    "welcome-message" = canContinue;
}
```

The keys in this list are the identifier of each step. They will not necessarily be shown in the correct order. When the value of a key is `completed` or `canContinue` the step is completed. When the value is `suggested` or the key is missing the step is not completed.

You can also use the `setupchecklist` [command line tool](../Extras/CommandLineTool.md) to get the status for a specific step:

```shell
setupchecklist status default-app-browser
suggested
```

## Testing

While testing can re-launch Setup Checklist over and over again. Setup Checklist will determine the state of each step when it loads the profile. You may need to reset the `completedSteps` default to get a proper fresh run:

```
$ defaults delete com.jamf.setupchecklist completedSteps
```

Since the app also changes other settings, you may want to build a script that resets the settings to on "out of box" value during your testing. You can find [a sample script here](../Examples/resetEverything.sh), but you will have to adapt it for your particular workflow.

You can also set the `DEBUG` key in the profile to `true`. With this value set, Setup Checklist will not apply any changes to the system and you can always proceed through the steps. This is useful for testing the user interface.
