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

### Top-level keys

- `icon`
- `title`
- `message`

### Steps

- `title`
- `icon`
- `message`

### Welcome app (domain `com.jamf.setup.welcome`)

- `title`

Use these two-letter codes for these languages:

| Language           | two-letter code |
|--------------------|-----------------|
| English            | en (default)    |
| Dutch (Nederlands) | nl              |
| French             | fr              |
| German             | de              |
| Italian            | it              |
| Hebrew             | he              |
| Norwegian          | nb              |
| Spanish            | es              |
| Swedish            | sv              |

The [plist and profile example files](Examples) contain localizations for many of the custom text elements.
