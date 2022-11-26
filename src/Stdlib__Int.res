@@uncurried
module Constants = {
  @inline let minValue = -2147483648
  @inline let maxValue = 2147483647
}

@send external toExponential: int => string = "toExponential"
@send external toExponentialWithPrecision: (int, ~digits: int) => string = "toExponential"

@send external toFixed: int => string = "toFixed"
@send external toFixedWithPrecision: (int, ~digits: int) => string = "toFixed"

@send external toPrecision: int => string = "toPrecision"
@send external toPrecisionWithPrecision: (int, ~digits: int) => string = "toPrecision"

@send external toString: int => string = "toString"
@send external toStringWithRadix: (int, ~radix: int) => string = "toString"
@send external toLocaleString: int => string = "toLocaleString"

external toFloat: int => float = "%identity"
external fromFloat: float => int = "%intoffloat"

// parseInt's return type is a float because it can be NaN
@val external parseInt: 'a => float = "parseInt"
@val external parseIntWithRadix: ('a, ~radix: int) => float = "parseInt"

let fromString = (~radix=?, x) => {
  let maybeInt = switch radix {
  | Some(radix) => parseIntWithRadix(x, ~radix)
  | None => parseInt(x)
  }
  if Stdlib__Float.isNaN(maybeInt) {
    None
  } else if maybeInt > Constants.maxValue->toFloat || maybeInt < Constants.minValue->toFloat {
    None
  } else {
    let asInt = fromFloat(maybeInt)
    Some(asInt)
  }
}

external mod: (int, int) => int = "%modint"
