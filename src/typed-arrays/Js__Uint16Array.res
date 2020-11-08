type t = Js__TypedArray.t<int>

module Constants = {
  @bs.val external bytesPerElement: int = "UInt16Array.BYTES_PER_ELEMENT"
}

@bs.new external make: array<int> => t = "UInt16Array"
@bs.new external fromBuffer: Js__ArrayBuffer.t => t = "UInt16Array"
@bs.new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "UInt16Array"
@bs.new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "UInt16Array"
@bs.new external fromLength: int => t = "UInt16Array"
@bs.val external from: 'a => t = "UInt16Array.from"
