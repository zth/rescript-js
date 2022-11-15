# [ANN] A new standard library for ReScript

We're introducing a new standard library for ReScript. It is intended to be familiar for JavaScript developers and rich enough that you don't need to reach for anything else for typical ReScript development.

It will eventually replace the current `Js` namespace as well as the OCaml pervasives (global `Array`, `List` etc). `Belt` remains unchanged. This is going to clear up the current standard library situation, which can be quite confusing.

The standard library will **ship as its own package at first** so you can start migrating at your convenience, but will eventually become part of the compiler.

Check out the [repository for the package here](https://github.com/rescript-lang/rescript-standard-library).

## Acknowledgements

First thing's first - a huge thanks to @bloodyowl and the rest of the contributors to `rescript-js`. This standard library is heavily based on `rescript-js`. Thank you for your great work!

## What does it look like?

We've primarily based our work on [`rescript-js`](https://github.com/bloodyowl/rescript-js), which focuses on having an even tighter binding to the JavaScript standard library than what `Js.Array2` and friends do.

The new standard library also tries to stay as close to JavaScript as possible. But, we've made some tweaks and sprinkled in a few additional things to make it slightly richer than the standard library of JavaScript, as well as make it better adapted to ReScript where necessary.

We've also carefully incorporated useful utilities and modules that we believe are general enough to cater to a majority of developers. A few examples of what this includes:

- Extra utilities in the `Array` module brought in from `Belt`, like `flatMap`, `filterMap`, and `shuffle`.
- The entire `Option` and `Result` modules brought in from `Belt`. Because options (and to some extent result) is deeply ingrained into the language and ecosystem, they deserve to be first classed.
- [Patrick's `rescript-promise`](https://github.com/ryyppy/rescript-promise) is fully brought in, finally incorporating the refreshed promise module.

Check out all the [details on this in the repository](https://github.com/rescript-lang/rescript-standard-library).

## Cleaning up the current standard library situation

One of the main goals of this initiative is to clean up the current standard library situation. Today, if working with an array, you'll have 4 built-in options:

- `Array`. OCaml pervasives, leftover, shouldn't be used.
- `Js.Array`. Data last, shouldn't be used, prefer data first.
- `Js.Array2`. Data first, use this for zero cost bindings.
- `Belt.Array`. Data first and "batteries included". Use this for more specialized usage.

When integrating this new standard library is finished, you'll have 2 options:

- `Array`. From the standard library.
- `Belt.Array`.

Most importantly, this will make development feel more _natural_ and intuitive if you're used to JavaScript. Instead of reaching for `Js.Array2`, or `Belt.Array`, you'll just reach for `Array`. Simpler, easier and cleaner.

`Belt` will stay as is, and continues to be a great alternative for more specialized use cases.

### Removing the `Js` namespace

> The `Js` namespace refers to `Js.Array`, `Js.Array2` and everything else under `Js`.

Having a separate `Js` namespace is a leftover from when integration between ReScript and OCaml was a lot tighter. Since ReScript is focusing on JavaScript exclusively now, the `Js` namespace is no longer necessary. Therefore we'll eventually remove it, and all it can do today will be replaced by this new standard library, which will be available in the global scope directly.

However, removing it won't happen in the near future. We'll let it live on in its current form for a long time, to let the ecosystem migrate to this new standard library in its own pace.

## Plan

1. ReScript `10.1` ships. The new standard library ships as its own package.
2. ReScript `11.0` ships. The standard library replaces the current global `Array`, `Set` etc. The `Js` namespace remains but is deprecated.
3. At some point in the future, the `Js` namespace is removed.

## Migration

We'll be supplying some basic utilities to ease migration, making most of it automatic. There will however be some manual work involved, but we are going to focus on allowing migration to be gradual.

## Documentation (we need your help!)

With this new standard library, we're going to start de-emphasizing the `Js` namespace in our documentation, and start pushing the new standard library.

As the initial version of the standard library ships as its own package, it'll lack both some of the docstrings in the code, as well as actual documentation. This will be fixed continuously and be fully ready as we ship the standard library to everyone in the compiler.

If you're interested, **your help is much wanted**. We'd some love help crafting proper docstrings for the parts of the standard library that does not already have them. Check [this GitHub issue out](todo-link) for more details.

## Wrapping up

Thank you for reading! We look forward to move forward with this and start clearing up the current situation.
