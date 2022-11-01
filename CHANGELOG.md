## Array

- `push`/`pushMany`/`unshift`/`unshiftMany` are changed to return `unit`, for convenience. These would otherwise return the new length of the array.
- `findIndexOpt`/`lastIndexOf`/`indexOfOpt` is added, in addition to `findIndex`/`lastIndexOf`. These return `None` instead of `-1` if the item does not exist.
- `getUnsafe` is added (copied from `Belt`)
- `setUnsafe` is added (copied from `Belt`)
- `reverse` is added (copied from `Belt`), in addition to existing `reverseInPlace`, which is zero cost but does not produce a new array.
- `keepMap` and `keepMapU` is added from `Belt`, but **renamed to `filterMap`**. Rationale: `filterMap` is closer to the JS convention of naming things filter. It's also available in other languages like Rust. `keep` et al can confuse beginners, who're bound to be looking for `filter` style names since that's what JS has.
- `shuffle` and `shuffleInPlace` is added (copied from `Belt`).
- `flatMap` is added (copied from `Belt`, but using native `map` and `concat` functions).

## Float

- `fromString` is copied from `Belt`. Main difference is that `fromString` now returns an `option` that's `None` if the parsed float is `NaN`.

## String

- `searchOpt`/`indexOfOpt`/`lastIndexOfOpt` added. Convenience methods for returning an `option` that's `None` instead of returning `-1` for not found.
- Added bindings for `localeCompare`.
