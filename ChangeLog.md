#  Setup Checklist - Change Log

## v0.3.4
(2026-03-26)

### Setup Checklist

- Steps:
  - script:
    - environment variables are set correctly for `updateStatus` scripts (#38)
    - `openAutomatically` now works for `script` steps (#35)
  - screensharing:
    - added warning in log and user interface when Full Disk Access is not granted
- added `autoplay`, `loop`, and `mute` keys to control movie behavior
- minor user interface updates

### Welcome App

- added `excludedAccounts` to suppress launch for certain account names (#19)
- minor UI updates

### Command Line Tool

- ensures app is running before sending urls

### General

- documentation updates

## v0.3.3
(2026-03-12)

### Setup Checklist

- Steps:
  - defaultApp:
    - improved rendering of apps and selection in single and app list views
    - default app is set on selection in app lists
    - when there is only one app and an `image` or `movie` key is set, that will be displayed instead of the app icon
  - wallpaper:
    - updated image file icon display and scaling
    - improved status determination
  - script:
    - new top-level key `scriptLogging` to enable script execution logging
    - status is no longer reset to 'suggested' on prepare
- image corners are now properly rounded
- sidebar width now fixed (#25)
- when wallpaper or default app steps require a scroll view, scroll bars flash on hover to indicate there is more (#31)

## v0.3.2
(2026-03-05)

### Setup Checklist

- Setup Checklist now works with Jamf School
- Steps:
  - wallpaper: 
    - can handle a larger number of image files (#16)
    - enabling `mayKeepCurrent` allows user to continue without changing
  - script: 
    - added `USER` and `HOME` to environment of scripts
  - defaultApp: 
    - errors when none of the bundle-ids are installed
- improved process clean up on closed window
- improved determination of movie size
- improved concurrency behaviors

### Welcome app

- added `buttonColor` and `titleColor` to override default colors (#12)
- added `titleFont`, `titleFontSize`, and `titleFontStyle`
- added `blur` key to control background blur
- added animation

### General

- several documentation fixes


## v0.3.1

(2026-02-26)

- new step: `defaultApp`, see docs for details
- updated to Swift version 6.2, now fully uses "approachable concurrency"
- disabled region setting in Welcome app as it always set region to "World"

### Deprecations

- `browser` step is deprecated and will be removed (soon!) from a future update. Use `defaultApp` with a `urlScheme` of `http` instead.

## v0.3.0

(2026-02-23)

- new step kind: shell
- improved state observance
- cli tool
  - `status`: get and change status of a step
  - `step`: change values of a step
  - `quit`: quit Setup Checklist
- urlscheme: change values of a step
- changed status tracking and storage logic
- fixed a crashing bug when the window resizes while a movie is playing
- icons update correctly on change
- no longer displays steps with status 'error'

## v0.2.3

(2026-02-16)

- icons in open step show correctly instead of an indeterminate spinner
- screensharing step
  - closes settings app on continue
  - `image`, `icon` or `movie` is shown above target app(s)
- minor UI fixes


## v0.2.2

(2026-02-12)

- `open` step: `item` can be an app bundle identifier
- added `setupchecklist` command line tool
- fixed default language/region codes in Welcome screen (#3)
- new top-level key: `openWhenFinished` will open an item by app bundle id, url or path when finished

## v0.2.1

(2026-02-09)

- completed localizations
- new `screensharing` step
- new `hide` key for `open` step
- new URL scheme `jamf-setupmanager:` to launch app or `goto` a specific step
- documentation overhaul

## v0.2.0

(2026-01-29)

- private beta release

