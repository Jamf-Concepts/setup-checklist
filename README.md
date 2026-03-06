<img src="Images/Checklist.png" alt="Setup Checklist icon" width="300" height="auto">

# Setup Checklist App from Jamf Concepts

![minOS](https://img.shields.io/badge/macOS-15%2B-success)
![GitHub Release](https://img.shields.io/github/v/release/Jamf-Concepts/setup-checklist?color=green)
![GitHub Pre-Release](https://img.shields.io/github/v/release/Jamf-Concepts/setup-checklist?include_prereleases&label=pre-release)
![GitHub Downloads total](https://img.shields.io/github/downloads/Jamf-Concepts/setup-checklist/total)
![GitHub Downloads latest](https://img.shields.io/github/downloads/Jamf-Concepts/setup-checklist/latest/total)

## What it does

**First login experience powered by Jamf**

The enrollment is done, [apps and tools are installed](https://github.com/jamf/setup-manager), the user account created... now they can start working, right!?

Unfortunately, not quite. Even in the best managed deployment, there are some Apple services and third party apps and tools that will need just some more setup. Either Apple deems the settings so privacy sensitive that they require user approval, such as setting the default browser or providing screen recording access to video conferencing apps. Many third party apps and tools require the user to log in, and do some configuration. And sometimes, we (as the admins) just want to give the user a heads up, or a _choice_.

We have seen several approaches to this. From guided sessions in a classroom where users setup their Macs, to papers or PDFs with instructions handed out with the Macs, to massive scripts using various tools to guide the user.

Setup Checklist is our solution to unify this in a nice and manageable way.

Admins can deploy Setup Checklist together with configuration profile to guide the user through these last necessary steps to the Mac ready to go!

Setup Checklist works with **Jamf Pro** and **Jamf School**.

## BETA Warning!

This tool is still in beta. While we do test the app and do our best to make sure everything is working, you might quickly leave the 'happy path' in your testing and run into bugs or things that may not work as expected. [Your feedback](https://github.com/Jamf-Concepts/setup-checklist/issues) is required and much appreciated for us to identify and address these issues. Thank you.

This also means that features and the format of the configuration profile might change from one beta version to the next. We will do our best to document these changes, but be prepared that you might have to update the configuration profile you built frequently.

## Installer and Updates

Updates are published in the '[Releases](https://github.com/Jamf-Concepts/setup-checklist/releases)' section of the repo. There you can also [download the latest pkg installer](https://github.com/Jamf-Concepts/setup-checklist/releases/latest). You can subscribe to notifications for the repo using the 'Watch' button above.


## Documentation

- Installation
  - minimum macOS: 15.0
  - device has to be managed by Jamf Pro
  - [installation instructions](Profile/Overview.md#installation)
- Configuration
  - [Overview](Profile/Overview.md)
  - [Setup Checklist](Profile/SetupChecklist.md)
  - [Welcome screen and language chooser](Profile/Welcome.md)
- Extras
  - [Logging](Extras/Logging.md)
  - [Telemetry](Extras/Telemetry.md)
  - [Bundle Identifiers](Extras/BundleIdentifiers.md)
  - [URL Scheme](Extras/URLScheme.md)
  - [Command Line Tool](Extras/CommandLineTool.md)

## Known Issues (and Plans)

- there is a limited number of steps right now, we have plans for more, but your feedback on which kinds of steps you need is appreciated and will help us prioritize
- `background` key in Welcome screen only allows local files
- there is no custom JSON to get a custom profile interface in Jamf Pro and we are not planning to provide one until the profile schema is stable
- there is known issue in Self Service Plus where launching an action through a URL stalls in Self Service Plus

## Feedback

Please report issues, feature requests [as an issue.](https://github.com/Jamf-Concepts/setup-checklist/issues)

We have opened the [discussions](https://github.com/Jamf-Concepts/setup-checklist/discussions) area for questions, support and more generic feedback. You can also share solutions or your Setup Checklist workflow there!

There is also a [`#jamf-setup-checklist`](https://macadmins.slack.com/archives/C0A4J4Q3ZHC) channel on the [MacAdmins Slack](https://macadmins.org).
