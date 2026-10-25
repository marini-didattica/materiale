// Opzione 3 — pannello laterale e corpo principale.
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

#let etichetta(txt) = text(size: 8pt, tracking: 0.12em, fill: muted)[#txt]

#grid(
  columns: (1.05fr, 2fr),
  column-gutter: 2em,
  block(fill: tint, inset: 1.4em, radius: 3pt)[
    #etichetta("ISTITUTO")
    #v(0.4em)
    #text(size: 14pt, weight: 700)[Liceo B. Russell]
    #v(0.25em)
    #text(size: 9.5pt, fill: muted)[VIA IV NOVEMBRE 35, \
      38023 CLES]
    #v(2em)
    #line(length: 100%, stroke: 0.5pt + rule)
    #v(2em)
    #etichetta("ANNO SCOLASTICO")
    #v(0.3em)
    #text(size: 12pt)[2024/25]
    #v(1.5em)
    #etichetta("DOCENTE")
    #v(0.3em)
    #text(size: 12pt)[Prof.ssa Antonella Sonna]
  ],
  [
    #text(size: 8pt, tracking: 0.14em, fill: accent)[PROGRAMMAZIONE DIDATTICA]
    #v(0.6em)
    #text(size: 40pt, weight: 700)[Informatica]
    #v(0.2em)
    #text(size: 13pt, fill: muted)[Scientifico Opz. Scienze Applicate]
    #v(2.5em)
    #etichetta("CLASSE")
    #v(0.35em)
    #box(fill: accent, inset: (x: 0.85em, y: 0.18em), radius: 2pt)[
      #text(fill: white, size: 20pt, weight: 700)[1C]
    ]
    #v(3em)
    #line(length: 100%, stroke: 0.5pt + rule)
    #v(1.2em)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 1.5em,
      [
        #etichetta("ORE ANNUE")
        #v(0.3em)
        #text(size: 26pt, weight: 700)[66]
      ],
      [
        #etichetta("ORE A CONSUNTIVO")
        #v(0.3em)
        #text(size: 26pt, weight: 700, fill: accent)[68]
      ],
    )
  ],
)
