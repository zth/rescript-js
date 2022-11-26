@@uncurried
type undefined = {__rescript_private_none: bool}

let encodeUndefined = (_key, value) =>
  value === Stdlib__Undefined.empty
    ? Stdlib__Undefined.make({__rescript_private_none: true})
    : value

@val external _stringify: ('a, (string, 'b) => 'c) => option<string> = "JSON.stringify"
let serializeExn = x => _stringify(x, encodeUndefined)

@val external _parse: (string, @this ({..}, string, 'b) => 'c) => 'a = "JSON.parse"

let deserializeUnsafe = x => {
  let undefinedValues = []
  let value = _parse(x, @this (this, key, value) => {
    switch value->Stdlib__Nullable.toOption {
    | Some(x) if x.__rescript_private_none =>
      let _ = undefinedValues->Stdlib__Array.push((this, key))
    | _ => ()
    }
    value
  })
  undefinedValues->Stdlib__Array.forEach(((object, key)) => {
    object->Stdlib__Object.set(key, Js.Undefined.empty)
  })
  value
}
