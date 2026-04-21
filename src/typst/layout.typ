#let join(values, separator: " | ") = {
  for (index, value) in values.enumerate() {
    if index > 0 {
      separator
    }
    value
  }
}

#let section-title(title) = {
  v(0.8em)
  text(weight: "bold", size: 11pt)[#title]
  // v(0.12em)
  v(-0.80em)
  line(length: 100%, stroke: 0.45pt)
  // v(0.35em)
}

#let dated-heading(primary, secondary) = {
  grid(
    columns: (1fr, auto),
    gutter: 1em,
    align: (left, right),
    [#strong(primary)], [#secondary],
  )
}

#let entry(title, subtitle, meta, bullets: ()) = {
  dated-heading(title, meta)
  text(size: 9.5pt)[#subtitle]
  if bullets.len() > 0 {
    v(0.15em)
    list(
      spacing: 0.18em,
      ..bullets.map(item => [#item]),
    )
  }
  v(0.45em)
}

#let compact-line(label, values) = {
  strong(label)
  ": "
  join(values, separator: ", ")
  linebreak()
}

// New
#let lang = sys.inputs.at("lang", default: "es")

#let tr(value) = value.at(lang)

#let header_row(title, date, subtitle, location) = grid(
  columns: (1fr, auto),
  row-gutter: 3pt,
  align: (left, right),

  [#strong(tr(title))], [#tr(date)],

  [#emph(tr(subtitle))], [#emph(tr(location))],
)
