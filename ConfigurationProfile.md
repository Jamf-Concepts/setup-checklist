#  Configuration Profile

#### Debug Mode

(key: `DEBUG`, Boolean, optional, default: `false`)

When set to true, the app will not actually perform any steps that will change any setting. In addition, extra information will be shown at the top of the window.

#### Accent Color

(key: `accentColor`, String, optional, default: system accent color)

When present sets the accent color for buttons, progress bar and other UI elements. Use this to match branding. Color is encoded as a six digit hex code, i.e. `#FF0088`.

Example:

```
<key>accentColor</key>
<integer>#FF0088</integer>
```

#### Hide other Apps

(key: `hideOtherApps`, Boolean, optional, default: `true`)

Controls whether other apps are hidden at launch. Note that other apps are not hidden when running with `DEBUG` set.


## Steps

(key: `steps`, array of dicts, required)

The workflow in the Welcome app is divided into steps. Each step is shown as its own page and can perform actions.
Some steps will only display information.

Example:

```xml
<key>steps</key>
<array>
  <dict>
    <key>kind</key>
    <string>fullScreenWelcome</string>
  </dict>
  <dict>
    <key>kind</key>
    <string>message</string>
  </dict>
</array>  
```

### The Kind of Step

Each step requires a `kind` key 

Example:

```xml
<dict>
  <key>kind</key>
  <string>message</string>
</dict>
```

All steps share these keys:

#### Title

(key: `title`, string, [localizable](#localization), optional, default: `Welcome`)

The title of the shown in the sidebar and the step view.

#### Message

(key: `message`, string/markdown, [localizable](#localization), optional, default: `Just a few more steps to configure your new Mac`)

A longer description of the step. This should contain some instructions of what needs to done.

#### Icon

(key: `icon`, String/[icon source](#icon-sources), [localizable](#localization), optional, default: App Icon)

The icon used in the sidebar list.


#### Icon Color

(key: `icon`, String/[icon source](#icon-sources), [localizable](#localization), optional, default: App Icon)

The color used for SF Symbol icons.




Different kinds of steps may have more keys to configure them.

### Message

(kind: `message`)

A Message step displays a title, a message and an icon.




Example: 

```xml
<dict>
  <key>icon</key>
  <string>hand.thumbsup</string>
  <key>kind</key>
  <string>message</string>
  <key>message</key>
  <string>The configuration is complete. Enjoy your Mac!</string>
  <key>title</key>
  <string>Thank you</string>
</dict>
```


### Full Screen Welcome

(kind: `fullScreenWelcome`)

This step displays a full screen welcome (the value of `title` key) with a blurred background that takes over/blocks the whole screen. When the user dismisses the screen, by clicking on the arrow button, or the return, escape or space key, the view returns to the next step in the Welcome app.

#### Title

(key: `title`, string, [localizable](#localization), optional, default: `Welcome`)

The text shown in the center of the screen. It should not be more than a single line.

#### Background image

(key: `background`, string, optional, default: macOS default wallpaper)

Path to the background image covering the screen. currently, only local image files are possible.

Example:

```xml
<dict>
  <key>background</key>
  <string>/Library/Desktop Pictures/Background.png</string>
  <key>kind</key>
  <string>fullScreenWelcome</string>
  <key>title</key>
  <string>Welcome to Jamf</string>
</dict>
```

### Wallpaper

(kind: `wallpaper`)

This step presents a grid of images in the given folder path and allows the user to set one as their wallpaper on all attached screens.

#### Folder of images

(key: `path`, String, optional, default: `/Library/Desktop Pictures`)

All image files in this folder will be presented.

Example:

```xml
<dict>
  <key>kind</key>
  <string>wallpaper</string>
  <key>path</key>
  <string>/Library/Desktop Pictures</string>
</dict>
```

### Open

(kind: `open`)

Prompts the user to open an app, file or URL.

#### Item

(key: `item`, String, required)

The item to open. The item can be an absolute path to a local file or app, e.g. `/Applications/Microsoft Company Portal.app`, or it can be a URL, e.g. `https://jamf.com` or `x-apple.systempreferences:com.apple.preference.security?Privacy_ScreenCapture`

#### Title

(key: `Title`, String, optional, localized)

When no title is given, a name will be determined from the item.

#### Icon

(key, `icon`, String, optional)

This will be used to represent the item. When no `icon` is given, an image will be determined from the item.

#### Message

(key: `message`, string/markdown, [localizable](#localization), optional)

Examples:

Open a website in the default browser:

```xml
<dict>
  <key>item</key>
  <string>https://scriptingosx.com</string>
  <key>kind</key>
  <string>open</string>
  <key>title</key>
  <string>Open Scripting OS X</string>
</dict>
```

Open an application:

```xml
<dict>
  <key>item</key>
  <string>/System/Applications/Calculator.app</string>
  <key>kind</key>
  <string>open</string>
</dict>
```

Open a pane in System Settings:

```xml
<dict>
  <key>item</key>
  <string>x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension</string>
  <key>kind</key>
  <string>open</string>
  <key>title</key>
  <string>Open About this Mac…</string>
</dict>
```


### Default Browser

(kind: `browser`)

Prompts the user to set this browser as the default. The user cannot continue without approving the browser choice.

#### Browser Identifier

(key: `identifier`, String, required)

The app bundle identifier for the browser, e.g. `org.mozilla.firefox`. When the app cannot be found when Welcome app runs (i.e. the browser is not installed yet, this step will be skipped)

Example: 

```xml
<dict>
  <key>kind</key>
  <string>browser</string>
  <key>identifier</key>
  <string>org.mozilla.firefox</string>
</dict>
```

You can determine the identifier for an app with:

```shell
> mdls /Applications/Firefox.app -name kMDItemCFBundleIdentifier
kMDItemCFBundleIdentifier = "org.mozilla.firefox"
```

Common browser identifiers:

|Browser            |identifier           |
|-------------------|---------------------|
|Safari             |com.apple.safari     |
|Firefox            |org.mozilla.firefox  |
|Google Chrome      |com.google.Chrome    |
|Microsoft Edge     |com.microsoft.edgemac|

## Localization

The app will pick up the user choice of the UI language for the interface elements. (Table of currently available languages below.) The app will fall back to English for other language choices.

You can provide localizations for the custom texts given in the configuration profile. 

**Deprecation notice:** the method for providing localized texts in the configuration profile changed in version 1.1. The previous method (by appending the two letter language code to the key) is considered deprecated. It will continue to work for the time being but will be removed in a future release. It is _strongly_ recommended to change to the new dictionary-based solution.

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
  <string>Bienvenu!</string>
  <key>nl</key>
  <string>Welkom!</string>
</dict>
```

When there is no value for the localization, the app will fall back to the value of the `en` key.

The following keys can be localized:

### Top-level keys

- 

### Steps

- `title`
- `icon`
- `message`

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



## Icon Sources

Icons and images (e.g. `icon`s in individual steps) can be defined in several ways.

### From the web

When the icon source string starts with `http` or `https`, Welcome app will attempt to download a file from that URL and interpret it as an image file. It will show a spinning progress view while downloading.

```xml
<key>icon</key>
<string>https://example.com/path/to/icon.png</string>
```

### Local file

When the icon source is an absolute file path, Welcome app will attempt to read that file as an image file and display it.

```xml
<key>icon</key>
<string>/Library/Organization/image.png</string>
```

You will need to install custom local image files _before_ Welcome app runs.

### Application:

When the icon source is an absolute file path that ends in `.app`, Welcome app will use the app's icon.

```xml
<key>icon</key>
<string>/System/Applications/App Store.app</string>
```

### Name:

Icon sources that start with `name:` can access built-in icons. Two names are useful: `Checklist` gets the app icon and `NSComputer` will get an icon representing the current hardware.

```xml
<key>icon</key>
<string>name:AppIcon</string>
```

### SF Symbols:

When the icon source starts with `symbol:`, Welcome app will create the icon using that symbol's name. You can look up symbol names using the [SF Symbols](https://developer.apple.com/sf-symbols/) app.

Note that the availability and appearance of SF Symbols may vary with the OS version and language/region.

```xml
<key>icon</key>
<string>symbol:clock</string>
```
