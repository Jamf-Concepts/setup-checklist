<img src="Images/Checklist.png" alt="Setup Checklist icon" width="300" height="auto">

# Setup Checklist App from Jamf Concepts

<img src="Checklist.png" alt="Setup Checklist icon" width="300" height="auto">

![minOS](https://img.shields.io/badge/macOS-15%2B-success)
![GitHub Release](https://img.shields.io/github/v/release/Jamf-Concepts/setup-checklist?color=green)
![GitHub Pre-Release](https://img.shields.io/github/v/release/Jamf-Concepts/setup-checklist?include_prereleases&label=pre-release)
![GitHub Downloads total](https://img.shields.io/github/downloads/Jamf-Concepts/setup-checklist/total)
![GitHub Downloads latest](https://img.shields.io/github/downloads/Jamf-Concepts/setup-checklist/latest/total)

## What it does

First login experience powered by Jamf

Updates are published in the '[Releases](https://github.com/Jamf-Concepts/setup-checklist/releases)' section of the repo. There you can also [download the latest pkg installer](https://github.com/Jamf-Concepts/setup-checklist/releases/latest). You can subscribe to notifications for the repo using the 'Watch' button above.


## BETA Warning!

This tool is still in beta. While we do test the app and do our best to make sure everything is working, you might quickly leave the 'happy path' in your testing and run into bugs or things that may not work as expected. Your feedback is required and much appreciated for us to find and address these issues, thank you.

This also means that features and the format of the configuration profile might change from one beta version to the next. We will do our best to document these changes, but be prepared that you will have to update your profile.

## Feedback

Please report issues, feature requests [as an issue.](https://github.com/Jamf-Concepts/setup-checklist/issues)

We have opened the [discussions](https://github.com/Jamf-Concepts/setup-checklist/discussions) area for questions and more generic feedback.

There is also a [`#jamf-setup-checklist`](https://macadmins.slack.com/archives/C0A4J4Q3ZHC) channel on the [MacAdmins Slack](https://macadmins.org).

## Documentation

- Installation
  - minimum macOS: 15.0
  - device has to be managed by Jamf Pro
- Configuration
  - [Setup Checklist](Profile/SetupChecklist.md)
  - [Welcome screen and language chooser](Profile/Welcome.md)
  - [Image Sources](Profile/ImageSources.md)
  - [Defining Colors](Profile/DefiningColors.md)
  - [Localization](Profile/Localization.md)
- Extras
  - [Logging](Extras/Logging.md)
  - [Telemetry](Extra/Telemetry.md)

## Known Issues (and Plans)

- currently, Setup Checklist only works with Jamf Pro, we want to extend that Jamf School at some time
- you can achieve a nice workflow presenting the Screen Sharing (and similar) settings pane with an `open` step, but it doesn't check if the user actually turned it on. We are working on a dedicated step
- `background` key in Welcome screen only allows local files
- there is no custom JSON to get a custom profile interface in Jamf Pro and there won't be until we are fairly certain the profile schema is stable
- there is a very limited number of steps right now, we have plans for more, but your feedback on which kinds of steps you need is appreciated and will help us prioritize

Please report issues, feature requests [as an issue.](/issues)

