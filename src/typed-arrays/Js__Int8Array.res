type t = Js__TypedArray.t<int>

module Constants = {
  @bs.val external bytesPerElement: int = "Int8Array.BYTES_PER_ELEMENT"
}

@bs.new external make: array<int> => t = "Int8Array"
@bs.new external fromBuffer: Js__ArrayBuffer.t => t = "Int8Array"
@bs.new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "Int8Array"
@bs.new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t = "Int8Array"
@bs.new external fromLength: int => t = "Int8Array"
@bs.val external from: 'a => t = "Int8Array.from"
