#  Markdown

In some fields, markdown formatting can be used to generate rich, formatted text. For example:

```xml
<key>message</key>
<string>_Let's configure your new **Mac**!_</string>
```

The entire text will be in _italics_ and "Mac" will be bold. You can find details on markdown formatting in the [Markdown Cheat Sheet](https://www.markdownguide.org/cheat-sheet/).

If you want to insert a line break, you need to insert two line breaks into the markdown text. Note also, that property lists do not understand `\n` as an escape character, so you have to insert two actual line breaks.

```xml
<key>message</key>
<string>Please select a browser.

You **have to** select a browser to continue.</string>
```

These keys can use markdown:

- `message`
- Step
  - `message`
