# Image Sources

Images and icons can be defined in several ways.

Images can be jpg, tiff, png, svg, pdf, heif, heic, and non-animated gif.

## From the web

When the images source string starts with `http` or `https`, The app will attempt to download a file from that URL and interpret it as an image file. It will show a spinning progress view while downloading.

```xml
<key>icon</key>
<string>https://example.com/path/to/icon.png</string>
```

## Local file

When the icon source is an absolute file path (starts with `/`), The app will attempt to read that file as an image file and display it.

```xml
<key>icon</key>
<string>/Library/Organization/image.png</string>
```

You will need to install custom local image files _before_ the app runs.

## Application Icon

When the icon source is an absolute file path that ends in `.app`, the app will use that app's icon.

```xml
<key>icon</key>
<string>/System/Applications/Clock.app</string>
```

## Name

Icon sources that start with `name:` can access built-in icons. Two names are useful: `Checklist` gets the app icon and `Computer` (or `NSComputer`) will get an icon representing the current hardware.

```xml
<key>icon</key>
<string>name:AppIcon</string>
```

## SF Symbol

When the icon source starts with `symbol:`, Welcome app will create the icon using that symbol's name. You can look up symbol names using the [SF Symbols](https://developer.apple.com/sf-symbols/) app.

Note that the availability and appearance of SF Symbols may vary with the OS version and language/region.

```xml
<key>icon</key>
<string>symbol:clock</string>
```

## Dark Mode

Some images support providing a different source for dark and light mode.

Example:

```xml
<key>icon</key>
<dict>
  <key>dark</key>
  <string>/Library/Branding/icon_white</string>
  <key>light</key>
  <string>/Library/Branding/icon_blue</string>
</dict>
```
