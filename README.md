# rescript-stdlib

The new standard library for ReScript. Based on `rescript-js`, with a few additions taken from `Belt`, and a few tweaks.

This standard library is intended to be familiar for JS developers, easy to use, be rich enough that you don't need to reach for anything else for typical ReScript development.

It will start its life as a separate package, but will eventually make its way into the compiler.

## Acknowledgements

@bloodyowl + contributors to `rescript-js` are the people who've done the heavy lifting here, since this stdlib is based fully on `rescript-js`.
Also a shout out to the authors of `Belt`, as a few key things have been incorporated directly from `Belt`.

## Installation

```console
$ yarn add @gabnor/rescript-stdlib
```

> The `@gabnor` scope is for "private" testing before the package is officially published. When officially published, it'll be under the appropriate `@rescript` scope.

Then add `rescript-stdlib` to your `bsconfig.json`'s `bs-dependencies`:

```diff
 {
   "bs-dependencies": [
+    "@gabnor/rescript-stdlib"
   ]
 }
```

Open the stdlib, so it's available in the global scope:

```diff
 {
   "bsc-flags": [
+    "-open ReScriptStdLib",
   ]
 }
```

## What it looks like

```rescript
Console.log("Hello world!")

let timeout = setTimeout(() => {
  Console.log("Hello!")
}, 100)

clearTimeout(timeout)

let array = [1, 2, 3]

let sum = array
  ->Array.map(x => x * 2)
  ->Array.reduce((acc, item) => acc + item, 0)

let maybeValidFloats = ["1", "1.5", "some random string"]

let validFloats = maybeValidFloats
  ->Array.filterMap(v => v->Float.fromString)
```

## Editor tooling

Whenever you have the stdlib auto-opened (`-open ReScriptStdLib`), the ReScript editor tooling will prefer modules from the stdlib for pipe autocompletion whenever it makes sense.

## Differences to `rescript-js`

This stdlib is based on `rescript-js`, but with a few tweaks and modifications. Those tweaks and modifications are listed below.

### Array

- `push`/`pushMany`/`unshift`/`unshiftMany` are changed to return `unit`, for convenience. In JS, these return the new length of the array. That's however extremely rare to actually use, and you can just do `Array.length(array)` after pushing to get the new length. Changing the return type to be `unit` gets rid of needing to do `let _ = `, which can be confusing for beginners.
- `findIndexOpt`/`lastIndexOf`/`indexOfOpt` are added, returning `None` instead of `-1` if the item searched for does not exist. These are in addition to `findIndex`/`lastIndexOf`, which still returns `-1` when the item you're looking for does not exist.
- `getUnsafe` added (copied from `Belt`).
- `setUnsafe` added (copied from `Belt`).
- `reverse` added (copied from `Belt`), in addition to existing `reverseInPlace`. `reverseInPlace` is zero cost but does not produce a new array. `reverse` does produce a new array.
- `keepMap` and `keepMapU` is added from `Belt`, but **renamed to `filterMap`**. Rationale: `filterMap` is closer to the JS convention of naming. It's also available in other languages like Rust. `keep` et al can confuse beginners, who're bound to be looking for `filter` style names since that's what JS has.
- `shuffle` and `shuffleInPlace` are added (copied from `Belt`).
- `flatMap` added (copied from `Belt`, but using native `map` and `concat` functions).

### Float

- `fromString` is copied from `Belt`. Main difference is that `fromString` now returns an `option` that's `None` if the parsed float is `NaN`. If you want the raw JS behavior of potentially parsing a float to `NaN` you can use `Float.parseFloat(string)`.

### String

- `searchOpt`/`indexOfOpt`/`lastIndexOfOpt` added. Convenience methods for returning an `option` instead of returning `-1` for not found.
- Added bindings for `localeCompare`.

### Option

- The entire `Option` module is brought in from `Belt`. Options are widely used in the ecosystem. We want the stdlib to make working with options as convenient as possible in the non-exotic cases.
