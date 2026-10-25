// Opzione 5 — composizione centrata, impostazione da attestato.
#set document(title: "Programmazione didattica — Informatica 1C")

#let ink = rgb("#211f1c")
#let muted = rgb("#6f6a63")
#let rule = rgb("#d8d2c8")
#let accent = rgb("#8a1730")
#let tint = rgb("#f7f3ec")
#let sans = "Liberation Sans"

#set page(paper: "a4", margin: (x: 2.4cm, y: 2.4cm), footer: none)
#set text(lang: "it", region: "IT", fill: ink)
#set par(leading: 0.75em)

#let etichetta(txt) = text(font: sans, size: 8pt, tracking: 0.14em, fill: muted)[#txt]

#align(center)[
  #text(font: sans, size: 9pt, tracking: 0.18em, fill: muted)[LICEO B. RUSSELL]
  #v(0.35em)
  #text(size: 9.5pt, fill: muted)[VIA IV NOVEMBRE 35, 38023 CLES]
]

#v(2em)
#align(center)[#line(length: 5em, stroke: 1pt + accent)]
#v(3em)

#align(center)[
  #text(font: sans, size: 8.5pt, tracking: 0.16em, fill: accent)[PROGRAMMAZIONE DIDATTICA]
  #v(0.8em)
  #text(size: 38pt, weight: 700)[Informatica]
  #v(0.5em)
  #text(size: 14pt)[Classe 1C]
  #v(0.4em)
  #text(size: 11.5pt, fill: muted)[Scientifico Opz. Scienze Applicate]
]

#v(3.5em)

#grid(
  columns: (1fr, 1fr),
  align: center,
  [
    #etichetta("DOCENTE")
    #v(0.4em)
    #text(size: 12pt)[Prof.ssa Antonella Sonna]
  ],
  [
    #etichetta("ANNO SCOLASTICO")
    #v(0.4em)
    #text(size: 12pt)[2024/25]
  ],
)

#v(3em)

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 4em,
    align: horizon,
    [
      #etichetta("ORE ANNUE")
      #v(0.3em)
      #text(size: 30pt, weight: 700)[66]
    ],
    [
      #etichetta("ORE A CONSUNTIVO")
      #v(0.3em)
      #text(size: 30pt, weight: 700, fill: accent)[68]
    ],
  )
]

#v(1fr)

#align(center)[#line(length: 100%, stroke: 0.5pt + rule)]
#v(0.9em)
#align(center)[
  #text(font: sans, size: 8.5pt, tracking: 0.14em, fill: muted)[A.S. 2024/25]
]
