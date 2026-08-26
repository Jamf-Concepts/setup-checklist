# Localization

The app will pick up the user choice of the UI language for the interface elements. (Table of currently available languages below.) The app will fall back to English for other language choices.

You can provide localizations for the custom texts given in the configuration profile. 

To provide a set of localizations for a value in the profile, change its type from `string` to `dict`. Inside the `dict`, provide a value for each localization for each localization with the language code as key.

For example, this unlocalized key-value pair

```xml
<key>title</key>
<string>Welcome!</string>
``` 

can be localized like this:

```xml
<key>title</key>
<dict>
  <key>en</key>
  <string>Welcome!</string>
  <key>de</key>
  <string>Willkommen!</string>
  <key>fr</key>
  <string>Bienvenue!</string>
  <key>nl</key>
  <string>Welkom!</string>
</dict>
```

When there is no value for the localization, the app will fall back to the value of the `en` key.

The following keys can be localized:

## Setup Checklist

### Top-level keys

- `icon`
- `title`
- `message`

### Steps

- `title`
- `icon`
- `message`
- `buttonLabel` (`open`, `script`, `agreement`)
- `document` (`agreement`)

## Welcome app (domain `com.jamf.setup.welcome`)

- `title`

## Supported Languages

Use these codes for these languages:

| Language           | Native Name  | language code   |
|--------------------|--------------|-----------------|
| English (US)       |              | en              |
| English (UK)       |              | en-GB           |
| Bulgarian          | Български    | bg              |
| Dutch              | Nederlands   | nl              |
| French             | Français     | fr              |
| German             | Deutsch      | de              |
| Hindi              | हिन्दी          | hi              |
| Italian            | Italiano     | it              |
| Korean             | 한국어         | ko              |
| Norwegian Bokmål   | Norsk bokmål | nb              |
| Spanish            | Español      | es              |
| Swedish            | Svenska      | sv              |

For unknown codes and languages _not_ in this list, the app will revert to `en` (US English).

The [plist and profile example files](../Examples) contain localizations for many of the custom text elements.
