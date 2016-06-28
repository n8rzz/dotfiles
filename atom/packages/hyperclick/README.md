# Hyperclick

Pluggable text-clicking UI for [Atom](https://atom.io/).

Hyperclick is triggered by two events:
- `<alt>` or `<alt-mousemove>` underlines clickable text under the mouse.
- `<alt-mousedown>` performs the action associated with the clickable text.
- `<cmd-alt-enter>` performs the action on the text under the cursor.

## Known Providers

* [Nuclide](https://atom.io/packages/nuclide) features like nuclide-buck-files, nuclide-clang-atom, nuclide-flow, nuclide-hack and nuclide-ocaml.
* [js-hyperclick](https://atom.io/packages/js-hyperclick) Jump to variable definitions, including when imported/required from another file
* [hyperclick-php](https://atom.io/packages/hyperclick-php) Locate php classes with the help of composer, and open the file

## Demo

Install `hyperclick` with this [demo package](https://github.com/oclbdk/hyperclick-provider-demo)
to recreate the screencast below.

![hyperclick-demo](http://i.imgur.com/364jzWO.gif)


## Provider API

### Example

Declare the provider callback in the `package.json` (e.g. `getProvider`).

```js
"providedServices": {
  "hyperclick.provider": {
    "versions": {
      "0.0.0": "getProvider"
    }
  }
}
```

Define the provider callback in `lib/main.js`.

```js
export function getProvider() {
  return {
    getSuggestionForWord(
      textEditor: TextEditor,
      text: string,
      range: Range
    ): ?HyperclickSuggestion {
      return {
        // The range(s) to underline as a visual cue for clicking.
        range,
        // The function to call when the underlined text is clicked.
        callback() {},
      };
    },
  };
}
```

### Details

You must define one of these methods on the provider:

- `getSuggestionForWord(textEditor: TextEditor, text: string, range: Range)`

  Use this to provide a suggestion for single-word matches.
  Optionally set `wordRegExp` on the provider to adjust word-matching.

  - `textEditor`: The text editor the event originated from.
  - `text`: The string containing the word under the mouse.
  - `range`: The buffer position of `text` in the text editor.

- `getSuggestion(textEditor: TextEditor, position: Point)`

  Use this to provide a suggestion if it can have non-contiguous ranges.
  A primary use-case for this is Objective-C methods.

  - `textEditor`: The text editor the event originated from.
  - `position`: The buffer position of the mouse in the text editor.

The methods return a suggestion or a `Promise` that resolves to a suggestion:

- `range`: A range or array of ranges to underline as a visual cue for clicking.

  To distinguish ranges and arrays, this can't be a Range-compatible array.
  For example, use `new Range([0, 0], [0, 10])` instead of `[[0, 0], [0, 10]]`.

- `callback`: The function to call when the underlined text is clicked.

  If there are multiple possibilities, this can be an array of objects with:

    - `title`: A string to present in the UI for the user to select.
    - `rightLabel`(optional): An indicator denoting the "kind" of suggestion this represents
    - `callback`: The function to call when the user selects this object.

Additional properties:

- `priority`: The higher this is, the more precedence the provider gets.

  Hyperclick only returns suggestions from a single provider, so this is a
  workaround for providers to override others. `priority` defaults to 0.
