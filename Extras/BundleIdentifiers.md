#  Notes on Bundle Identifiers

On macOS, apps have bundle identifiers which allow the system to, well, identify them and associate them with other resources such as being the default application for a certain url scheme, or file type or unlocking certain privacy settings.

## Determining the bundle identifier for an app

You can determine the identifier for an app with:

```shell
$ osascript -e 'id of app "Firefox"'
org.mozilla.firefox
```

or

```shell
$ mdls /Applications/Firefox.app -name kMDItemCFBundleIdentifier
kMDItemCFBundleIdentifier = "org.mozilla.firefox"
```

or with the [`utiluti`](https://github.com/scriptingosx/utiluti) tool

```shell
$ utiluti app identifier /Applications/Safari.app      
com.apple.Safari
```

[Apparency by Mothers Ruin Software](https://www.mothersruin.com/software/Apparency/) can also display the bundle identifier, among much other useful information about an app.

You can use [`utiluti`](https://github.com/scriptingosx/utiluti) to determine where an app for a specific bundle identifier is installed:

```shell
$ utiluti app for-identifier com.microsoft.teams2              
/Applications/Microsoft Teams.app
```


