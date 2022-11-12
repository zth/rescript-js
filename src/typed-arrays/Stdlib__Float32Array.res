type t = Stdlib__TypedArray.t<float>

module Constants = {
  @val external bytesPerElement: int = "Float32Array.BYTES_PER_ELEMENT"
}

@new external make: array<float> => t = "Float32Array"
@new external fromBuffer: Stdlib__ArrayBuffer.t => t = "Float32Array"
@new external fromBufferToEnd: (Stdlib__ArrayBuffer.t, ~byteOffset: int) => t = "Float32Array"
@new
external fromBufferWithRange: (Stdlib__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Float32Array"
@new external fromLength: int => t = "Float32Array"
@val external from: 'a => t = "Float32Array.from"
