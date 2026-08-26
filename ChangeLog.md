#  Setup Checklist - Change Log

## v1.1
(2026-08-25)

**Important Note:** The `screensharing` step of previous versions (1.0 and earlier, as well as 1.1beta) will fail to detect the screen recording status on macOS 27 and later (starting with beta5). This version addresses this issue on macOS 27 (starting with beta5) and, hopefully, going forward.

### Setup Checklist

- new `agreement` step to show licenses, policies and other agreements
- new `windowPosition` value `focus`: centers window, hides sidebar, and overlays a full-screen background to block other apps for the current step
- new `background` key at top and step level to set the image used for the focus background
- new `blur` key at top and step level to control blur of the focus background
- new `allowQuit` top-level key to prevent the user from quitting before the workflow completes (#51)
- new `showSidebar` step level key
- new `wallpaper` image source
- new `openWhenFinishedHide` key to determine if the `openWhenFinished` item is opened hidden (#73)
- new `finishedScript` top-level key to provide a script that is executed when Checklist finishes
- file path, url, and wallpaper image sources now display correctly for image files containing dark and light mode versions
- fix dock preview with a large number of items (#74)
- improved SF Symbol display for wide icons (#82)
- app now quits when last window is closed
- `defaultApp` step now respects `buttonLabel` (#84)
- setting the status to `.error` or `.completed` from a script while the script is shown now works correctly (#67)
- uses `tccutil list` on macOS 27 to determine Screen Recording status (requires at least macOS 27 beta 5)
- fixed an issue where Setup Checklist might not be launched when `showWelcome` is `false`
- removed sidebar button (#61)
- locked down `focus` mode more
- list header `title` now properly localized (#75)
- synchronized window move and background fade animations (#89)
- wallpaper, default app, and agreement steps now show an error when an operation fails
- accessibility and localization improvements
- movies no longer autoplay or loop when 'Auto-Play Animated Images' is turned off in System Settings > Accessibility > Display
- general bug fixes and improvements
- `screensharing` step does not re-open Settings app when configuration is correct (#100)
- interface improvements (#94, #91, #99)

### Welcome

- no user interface "flash" when `showWelcome` is `false` (#66)
- improved langauge determination for localized text (#75)
- `background` now works with all image sources
- accessibility improvements

### Command line tool

- the `status` verb without an identifier will list the status of all steps
- command line tool can now update the `message` data (#64)

### General

- custom JSON Schema for Setup Checklist and Welcome App in Jamf Pro
- documentation updates (#85)
- Localizations
  - Bulgarian (Български) 🇧🇬 (#95)
  - Swedish (Svenska) 🇸🇪
  - Norwegian Bokmål (Norsk bokmål) 🇳🇴
  - Hindi (हिन्दी) 🇮🇳 (#95)
  - Italian (Italiano) 🇮🇹
  - Korean (한국어) 🇰🇷 (#95)
  - Spanish (Español) 🇪🇸
  - British English 🇬🇧


## v1.1beta2

(2026-08-13)

Changes since first beta:

### Setup Checklist

- uses `tccutil list` on macOS 27 to determine Screen Recording status (requires at least beta 5)
- fixed an issue where Setup Checklist might not be launched when `showWelcome` is `false`
- removed sidebar button
- locked down `focus` mode more
- list header `title` now properly localized (#75)
- synchronized window move and background fade animations (#89)
- wallpaper, default app, and agreement steps now show an error when an operation fails
- accessibility and localization improvements
- movies no longer autoplay or loop when 'Auto-Play Animated Images' is turned off in System Settings > Accessibility > Display
- general bug fixes and improvements

### Welcome

- accessibility improvements

### General

- Hindi (हिन्दी) 🇮🇳 (#95)
- Italian localization 🇮🇹
- Korean (한국어) localization 🇰🇷 (#95)
- Spanish localization 🇪🇸
- British English localization 🇬🇧

## v1.1beta

(2026-07-23)

### Setup Checklist

- new `agreement` step to show licenses, policies and other agreements
- new `windowPosition` value `focus`: centers window, hides sidebar, and overlays a full-screen background to block other apps for the current step
- new `background` key at top and step level to set the image used for the focus background
- new `blur` key at top and step level to control blur of the focus background
- new `allowQuit` top-level key to prevent the user from quitting before the workflow completes (#51)
- new `showSidebar` step level key
- new `wallpaper` image source
- new `openWhenFinishedHide` key to determine if the `openWhenFinished` item is opened hidden (#73)
- new `finishedScript` top-level key to provide a script that is executed when Checklist finishes
- file path, url, and wallpaper image sources now display correctly for image files containing dark and light mode versions
- fix dock preview with a large number of items (#74)
- improved SF Symbol display for wide icons (#82)
- app now quits when last window is closed
- `defaultApp` step now respects `buttonLabel` (#84)
- setting the status to `.error` or `.completed` from a script while the script is shown now works correctly (#67)

### Welcome app

- no user interface "flash" when `showWelcome` is `false` (#66)
- improved langauge determination for localized text (#75)
- `background` now works with all image sources

### Command line tool

- the `status` verb without an identifier will list the status of all steps
- command line tool can now update the `message` data (#64)

### General

- custom JSON Schema for Setup Checklist and Welcome App in Jamf Pro
- interface improvements
- documentation updates (#85)


## v1.0
(2026-06-12)

### Setup Checklist
- wallpaper step 
  - now displays image files containing dark and light mode versions, _see notes_
  - display performance improvements
- dock step
  - should now properly determine status in some edge cases (#48)
- open and script step
  - `openAutomatically` does not trigger on select when step is already marked `completed` (#62)
- user interface fixes (#63)

### Automation
- new command line tool and url scheme commands:
  - `reload`: reload steps from defaults/profile
  - `next`: go to next step
  - `list`: list steps in current configuration

### Notes:

#### Wallpaper: 

There are at least three different variants of combined or dynamic wallpapers. The simplest contains a light and dark version of the wallpaper, the second contains several different images which are chosen according to time of day and the last contains different versions chosen according to solar position (calculated from location, time of day and season). Setup Manager will display a combined preview for the simplest case: dark/light mode. For the other variants, the first image resource will be used for the preview. After selecting the image, the proper image should be used for the wallpaper.


## v0.4.0
(2026-04-09)

### Setup Checklist

- NEW: `dock` step kind (#17)
- added `buttonLabel` key to `open`, `script`, and `screensharing` steps to override button label text
- improved scrolling and responsiveness of `wallpaper` with many images
- localization fixes (#42)
- added toolbar button to show list when it is hidden
- fixed a user interface issue where the action button disappears when window is not active
- images and movies scale up when window size is increased

### Welcome app

- fixed an issue where the welcome screen may not go full screen

### General

- added uninstall script
- documentation updates (#45)

### Deprecations and Removals

- `browser` step kind has been _removed_. Use `defaultApp` with a `urlScheme` of `http` instead
- `actionButtonLabel` and `actionButtonScript` keys are simplified to `buttonLabel` and `buttonScript`. The old long forms will keep working for now, but be removed in some future update. (#43)


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

