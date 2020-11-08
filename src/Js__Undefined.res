type t<'a> = Js.Undefined.t<'a>

external empty: t<'a> = "#undefined"

external make: 'a => t<'a> = "%identity"

external toOption: t<'a> => option<'a> = "#undefined_to_opt"

let fromOption: option<'a> => t<'a> = option =>
  switch option {
  | Some(x) => make(x)
  | None => empty
  }
