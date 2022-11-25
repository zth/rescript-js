@@uncurried
type t = Stdlib__TypedArray.t<float>

module Constants = {
  @val external bytesPerElement: int = "Float64Array.BYTES_PER_ELEMENT"
}

@new external make: array<float> => t = "Float64Array"
@new external fromBuffer: Stdlib__ArrayBuffer.t => t = "Float64Array"
@new external fromBufferToEnd: (Stdlib__ArrayBuffer.t, ~byteOffset: int) => t = "Float64Array"
@new
external fromBufferWithRange: (Stdlib__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Float64Array"
@new external fromLength: int => t = "Float64Array"
@val external from: 'a => t = "Float64Array.from"
