@@uncurried
module Array = Stdlib__Array
module Console = Stdlib__Console
module DataView = Stdlib__DataView
module Date = Stdlib__Date
module Dict = Stdlib__Dict
module Error = Stdlib__Error
module Float = Stdlib__Float
module Global = Stdlib__Global
module Int = Stdlib__Int
module BigInt = Stdlib__BigInt
module Math = Stdlib__Math
module Null = Stdlib__Null
module Nullable = Stdlib__Nullable
module Object = Stdlib__Object
module Promise = Stdlib__Promise
module RegExp = Stdlib__RegExp
module String = Stdlib__String
module Undefined = Stdlib__Undefined
module Symbol = Stdlib__Symbol
module Type = Stdlib__Type
module JSON = Stdlib__JSON

module Iterator = Stdlib__Iterator
module AsyncIterator = Stdlib__AsyncIterator
module Map = Stdlib__Map
module WeakMap = Stdlib__WeakMap
module Set = Stdlib__Set
module WeakSet = Stdlib__WeakSet

module ArrayBuffer = Stdlib__ArrayBuffer
module TypedArray = Stdlib__TypedArray
module Float32Array = Stdlib__Float32Array
module Float64Array = Stdlib__Float64Array
module Int8Array = Stdlib__Int8Array
module Int16Array = Stdlib__Int16Array
module Int32Array = Stdlib__Int32Array
module Uint8Array = Stdlib__Uint8Array
module Uint16Array = Stdlib__Uint16Array
module Uint32Array = Stdlib__Uint32Array
module Uint8ClampedArray = Stdlib__Uint8ClampedArray
module BigInt64Array = Stdlib__BigInt64Array
module BigUint64Array = Stdlib__BigUint64Array

module Intl = Stdlib__Intl

module Serializer = Stdlib__Serializer

@val external window: Dom.window = "window"
@val external document: Dom.document = "document"
@val external globalThis: {..} = "globalThis"

external null: Stdlib__Null.t<'a> = "#null"
external undefined: Stdlib__Undefined.t<'a> = "#undefined"
external typeof: 'a => Stdlib__Type.t = "#typeof"

include Stdlib__Global

type t<'a> = Js.t<'a>
module Fn = Js.Fn
module MapperRt = Js.MapperRt
module Internal = Js.Internal
module Re = Stdlib__RegExp // needed for the %re sugar
module Exn = Js.Exn
module Option = Stdlib__Option
module List = Stdlib__List
module Result = Stdlib__Result

type null<+'a> = Js.null<'a>

type undefined<+'a> = Js.undefined<'a>

type nullable<+'a> = Js.nullable<'a>
