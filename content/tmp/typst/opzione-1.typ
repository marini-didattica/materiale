// Opzione 1 — testata editoriale, tutta allineata a sinistra.
#set document(title: "Programmazione didattica — Informatica 1C")

#let ink = rgb("#211f1c")
#let muted = rgb("#6f6a63")
#let rule = rgb("#d8d2c8")
#let accent = rgb("#8a1730")
#let tint = rgb("#f7f3ec")
#let sans = "Liberation Sans"

#set page(paper: "a4", margin: (x: 2.2cm, y: 2cm), footer: none)
#set text(lang: "it", region: "IT", fill: ink)
#set par(leading: 0.7em)

#let etichetta(txt) = text(font: sans, size: 8pt, tracking: 0.12em, fill: muted)[#txt]

#let campo(lbl, value) = block[
  #etichetta(lbl)
  #v(0.35em)
  #text(size: 12pt)[#value]
]

#grid(
  columns: (1fr, auto),
  align: bottom,
  [
    #text(size: 13pt, weight: 700)[Liceo B. Russell] \
    #text(size: 9.5pt, fill: muted)[VIA IV NOVEMBRE 35, 38023 CLES]
  ],
  align(right)[
    #etichetta("ANNO SCOLASTICO") \
    #text(size: 12pt)[2024/25]
  ],
)

#v(1em)
#line(length: 100%, stroke: 1.2pt + ink)
#v(3em)

#text(font: sans, size: 8.5pt, tracking: 0.14em, fill: accent)[PROGRAMMAZIONE DIDATTICA]
#v(0.6em)
#grid(
  columns: (1fr, auto),
  align: bottom,
  text(size: 34pt, weight: 700)[Informatica],
  align(right)[
    #etichetta("CLASSE") \
    #text(size: 40pt, weight: 700, fill: accent)[1C]
  ],
)
#v(0.9em)
#text(size: 13pt, fill: muted)[Scientifico Opz. Scienze Applicate]

#v(4em)
#line(length: 100%, stroke: 0.5pt + rule)
#v(1.2em)
#grid(
  columns: (1.4fr, 1fr, 1fr),
  column-gutter: 1.5em,
  campo("DOCENTE", "Prof.ssa Antonella Sonna"),
  campo("ORE ANNUE", "66"),
  campo("ORE A CONSUNTIVO", "68"),
)
