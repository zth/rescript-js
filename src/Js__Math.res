module Constants = {
  @bs.val external e: float = "Math.E"
  @bs.val external ln2: float = "Math.LN2"
  @bs.val external ln10: float = "Math.LN10"
  @bs.val external log2e: float = "Math.LOG2E"
  @bs.val external log10e: float = "Math.LOG10E"
  @bs.val external pi: float = "Math.PI"
  @bs.val external sqrt1_2: float = "Math.SQRT1_2"
  @bs.val external sqrt2: float = "Math.SQRT2"
}

module Int = {
  @bs.val external abs: int => int = "Math.abs"
  @bs.val external clz32: int => int = "Math.clz32"
  @bs.val external imul: (int, int) => int = "Math.imul"
  @bs.val external min: (int, int) => int = "Math.min"
  @bs.variadic @bs.val external minMany: array<int> => int = "Math.min"
  @bs.val external max: (int, int) => int = "Math.max"
  @bs.variadic @bs.val external maxMany: array<int> => int = "Math.max"
  @bs.val external pow: (int, ~exp: int) => int = "Math.pow"
  @bs.val external sign: int => int = "Math.sign"
}

@bs.val external abs: float => float = "Math.abs"
@bs.val external acos: float => float = "Math.acos"
@bs.val external acosh: float => float = "Math.acosh"
@bs.val external asin: float => float = "Math.asin"
@bs.val external asinh: float => float = "Math.asinh"
@bs.val external atan: float => float = "Math.atan"
@bs.val external atanh: float => float = "Math.atanh"
@bs.val external atan2: (~x: float, ~y: float) => float = "Math.atan2"
@bs.val external cbrt: float => float = "Math.cbrt"
@bs.val external ceil: float => float = "Math.ceil"
@bs.val external cos: float => float = "Math.cos"
@bs.val external cosh: float => float = "Math.cosh"
@bs.val external exp: float => float = "Math.exp"
@bs.val external expm1: float => float = "Math.expm1"
@bs.val external floor: float => float = "Math.floor"
@bs.val external fround: float => float = "Math.fround"
@bs.val external hypot: (float, float) => float = "Math.hypot"
@bs.variadic @bs.val external hypotMany: array<float> => float = "Math.hypot"
@bs.val external log: float => float = "Math.log"
@bs.val external log1p: float => float = "Math.log1p"
@bs.val external log10: float => float = "Math.log10"
@bs.val external log2: float => float = "Math.log2"
@bs.val external min: (float, float) => float = "Math.min"
@bs.variadic @bs.val external minMany: array<float> => float = "Math.min"
@bs.val external max: (float, float) => float = "Math.max"
@bs.variadic @bs.val external maxMany: array<float> => float = "Math.max"
@bs.val external pow: (float, ~exp: float) => float = "Math.pow"
@bs.val external random: unit => float = "Math.random"
@bs.val external round: float => float = "Math.round"
@bs.val external sign: float => float = "Math.sign"
@bs.val external sin: float => float = "Math.sin"
@bs.val external sinh: float => float = "Math.sinh"
@bs.val external sqrt: float => float = "Math.sqrt"
@bs.val external tan: float => float = "Math.tan"
@bs.val external tanh: float => float = "Math.tanh"
@bs.val external trunc: float => float = "Math.trunc"
