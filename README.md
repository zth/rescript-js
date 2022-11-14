# rescript-standard-library

**This is not officially published yet, and is in private testing.**

The new ReScript standard library. Intended to be familiar for JavaScript developers, easy to use, and be rich enough that you don't need to reach for anything else for typical ReScript development.

It ships as a separate package initially, so you can start migrating to it at your convenience. Eventually it'll make its way into the compiler (likely in ReScript `v11`). And, long term it will replace the current `Js` namespace.

Ultimately, this + `Belt` is what'll be available for ReScript developers out of the box. Read more about the plan in [this forum post]().

## Acknowledgements

- @bloodyowl + contributors to `rescript-js` are the people who've done the heavy lifting here, since this stdlib is based fully on `rescript-js`.
- Also a shout out to the authors of `Belt`, as a few key things have been incorporated directly from `Belt`.
- Patrick (@ryyppy) for his work on `rescript-promise`, which is fully inlined into the stdlib.

## Installation

ReScript `>=10.1` is required.

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

Open the standard library so it's available in the global scope. This is important because this is the way it'll ship in the compiler eventually, automatically available in the global scope.

```diff
 {
   "bsc-flags": [
+    "-open RescriptStdlib",
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

## Documentation

Documentation will be added successively to this repository, and will be fully available as the standard library is officially merged into the compiler.

## OCaml compat

During the transition phase to this standard library you might find yourself needing to access the current global `Array`/`List` etc modules that originate from OCaml. These will be removed eventually, but in the transition phase you'll be able to access them by adding this open at the top of any file:

```rescript
open OCamlCompat
```

## Differences to `rescript-js`

This standard library is based on `rescript-js`, but with a few tweaks and modifications:

### Array

- `reduce`/`reduceReverse` and friends (uncurried versions, withIndex versions) are taken from `Belt` and replace the bindings to the JavaScript equivalents (`reduce` and `reduceRight`). The `reduce` versions from `Belt` works fully with type inference because of the argument order being reversed (`init` value comes first), whereas the JavaScript versions don't work well with inference. The runtime added for this is minor (and very fast still), and we want users to have to annotate as little as possible for the standard functions they'll be using.
- `push`/`pushMany`/`unshift`/`unshiftMany` are changed to return `unit`, for convenience. In JS, these return the new length of the array. That's however extremely rare to actually use, and you can just do `Array.length(array)` after pushing to get the new length. Changing the return type to be `unit` gets rid of needing to do `let _ = ` (or `->ignore`), which can be confusing for beginners.
- `findIndexOpt`/`lastIndexOf`/`indexOfOpt` are added, returning `None` instead of `-1` if the item searched for does not exist. These are in addition to `findIndex`/`lastIndexOf`, which still returns `-1` when the item you're looking for does not exist.
- `getUnsafe` added (copied from `Belt`).
- `setUnsafe` added (copied from `Belt`).
- `reverse` added (copied from `Belt`), in addition to existing `reverseInPlace`. `reverseInPlace` is zero cost but does not produce a new array. `reverse` does produce a new array.
- `keepMap` and `keepMapU` is added from `Belt`, but **renamed to `filterMap`**. Rationale: `filterMap` is closer to the JS convention of naming. It's also available in other languages like Rust. `keep` et al can confuse beginners, who're bound to be looking for `filter` style names since that's what JS has.
- `shuffle` and `shuffleInPlace` are added (copied from `Belt`).
- `flatMap` added (copied from `Belt`, but using native `map` and `concat` functions).
- `concatMany` is changed to have the same signature as `Js.Array2.concatMany`, which differs slightly from the original one in `rescript-js`.

### Float

- `fromString` is copied from `Belt`. Main difference is that `fromString` now returns an `option` that's `None` if the parsed float is `NaN`. If you want the raw JS behavior of potentially parsing a float to `NaN` you can use `Float.parseFloat(string)`.

### String

- `searchOpt`/`indexOfOpt`/`lastIndexOfOpt` added. Convenience methods for returning an `option` instead of returning `-1` for not found.
- Added bindings for `localeCompare`.

### Promise

The `Promise` module is inlined from https://github.com/ryyppy/rescript-promise, with these additions:

- Jaap's `ignorePromise` PR is merged.
- `then` and `catch` is replaced with Cristiano's "safe promises" (where nested promises do not cause runtime breakages).

### Option, List, Result

- The above stated modules are brought in from `Belt`, since they're widely used in the ecosystem.
- In `Option` and `List`, the same naming convention is applied as in `Array` for `keep*` functions. As in `keep` becomes `filter`, `keepMap` becomes `filterMap`, etc.

### window, document

- `window` and `document` are typed as `Dom.window`/`Dom.document` rather than open objects (`{..}`).

## Migration

_Things are added to this section on migration gradually._

Migrating to the new standard library should be easy to do gradually. In this section we'll gather information that's intended to help migrating as painlessly as possible.

### Name clashes

Since the standard library is designed to live in the global scope, you _might_ have your own modules whose names might collide with the modules from the standard library. The easiest way to solve this is to just rename your own module to something else.
