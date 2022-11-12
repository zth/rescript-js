type t = Stdlib__TypedArray.t<Stdlib__BigInt.t>

module Constants = {
  @val external bytesPerElement: int = "BigUint64Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "BigUint64Array"
@new external fromBuffer: Stdlib__ArrayBuffer.t => t = "BigUint64Array"
@new external fromBufferToEnd: (Stdlib__ArrayBuffer.t, ~byteOffset: int) => t = "BigUint64Array"
@new
external fromBufferWithRange: (Stdlib__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "BigUint64Array"
@new external fromLength: int => t = "BigUint64Array"
@val external from: 'a => t = "BigUint64Array.from"
