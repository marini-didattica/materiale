// Opzione 2 — fascia colorata e scheda con righe sottili.
#set document(title: "Programmazione didattica — Informatica 1C")

#let ink = rgb("#211f1c")
#let muted = rgb("#6f6a63")
#let rule = rgb("#d8d2c8")
#let accent = rgb("#8a1730")
#let tint = rgb("#f7f3ec")
#let sans = "Liberation Sans"

#set page(paper: "a4", margin: (x: 2cm, y: 2cm), footer: none)
#set text(font: sans, lang: "it", region: "IT", fill: ink)
#set par(leading: 0.7em)

#let etichetta(txt) = text(size: 8.5pt, tracking: 0.12em, fill: muted)[#txt]

#block(width: 100%, fill: accent, inset: (x: 1.1em, y: 0.85em))[
  #grid(
    columns: (1fr, auto),
    align: horizon,
    [
      #text(fill: white, weight: 700)[Liceo B. Russell]
      #h(0.6em)
      #text(fill: white, size: 9.5pt)[VIA IV NOVEMBRE 35, 38023 CLES]
    ],
    text(fill: white, size: 9.5pt)[Anno scolastico 2024/25],
  )
]

#v(3em)

#text(size: 30pt, weight: 700)[Programmazione didattica]
#v(0.3em)
#text(size: 14pt, fill: accent)[Informatica · Classe 1C]

#v(3em)

#table(
  columns: (8em, 1fr),
  stroke: (top: none, bottom: 0.5pt + rule, left: none, right: none),
  inset: (left: 0.1em, right: 1em, y: 0.7em),
  align: (left, left),
  etichetta("INDIRIZZO"), [Scientifico Opz. Scienze Applicate],
  etichetta("DISCIPLINA"), [Informatica],
  etichetta("CLASSE"), [1C],
  etichetta("DOCENTE"), [Prof.ssa Antonella Sonna],
)

#v(2.5em)

#block(width: 100%, fill: tint, inset: (x: 1.2em, y: 1em), radius: 2pt)[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,
    grid(
      columns: (auto, 1fr),
      column-gutter: 0.8em,
      align: horizon,
      text(size: 28pt, weight: 700, fill: accent)[66],
      [Ore annue],
    ),
    grid(
      columns: (auto, 1fr),
      column-gutter: 0.8em,
      align: horizon,
      text(size: 28pt, weight: 700, fill: accent)[68],
      [Ore a consuntivo],
    ),
  )
]
