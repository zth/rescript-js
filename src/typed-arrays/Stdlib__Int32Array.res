@@uncurried
type t = Stdlib__TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "Int32Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "Int32Array"
@new external fromBuffer: Stdlib__ArrayBuffer.t => t = "Int32Array"
@new external fromBufferToEnd: (Stdlib__ArrayBuffer.t, ~byteOffset: int) => t = "Int32Array"
@new
external fromBufferWithRange: (Stdlib__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Int32Array"
@new external fromLength: int => t = "Int32Array"
@val external from: 'a => t = "Int32Array.from"
