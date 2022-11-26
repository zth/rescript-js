@@uncurried
type t

@new external make: unit => t = "Intl.DateTimeFormat"
@new external makeWithLocale: string => t = "Intl.DateTimeFormat"
@new external makeWithLocales: array<string> => t = "Intl.DateTimeFormat"
@new external makeWithLocaleAndOptions: (string, {..}) => t = "Intl.DateTimeFormat"
@new external makeWithLocalesAndOptions: (array<string>, {..}) => t = "Intl.DateTimeFormat"
@new external makeWithOptions: (@as(json`undefined`) _, {..}) => t = "Intl.DateTimeFormat"

@val external supportedLocalesOf: array<string> => t = "Intl.DateTimeFormat.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, {..}) => t =
  "Intl.DateTimeFormat.supportedLocalesOf"

@send external resolvedOptions: t => {..} = "resolvedOptions"

@send external format: (t, Stdlib__Date.t) => string = "format"
@send
external formatToParts: (t, Stdlib__Date.t) => array<{"type": string, "value": string}> =
  "formatToParts"

@send
external formatRange: (t, ~startDate: Stdlib__Date.t, ~endDate: Stdlib__Date.t) => string =
  "formatRange"

@send
external formatRangeToParts: (
  t,
  ~startDate: Stdlib__Date.t,
  ~endDate: Stdlib__Date.t,
) => array<{
  "type": string,
  "value": string,
  "source": string,
}> = "formatRange"
