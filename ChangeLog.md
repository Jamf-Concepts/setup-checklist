#  Setup Checklist - Change Log


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

