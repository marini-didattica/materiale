// Opzione 4 — titolo in alto e colophon in fondo alla pagina.
#set document(title: "Programmazione didattica — Informatica 1C")

#let ink = rgb("#211f1c")
#let muted = rgb("#6f6a63")
#let rule = rgb("#d8d2c8")
#let accent = rgb("#8a1730")
#let tint = rgb("#f7f3ec")
#let sans = "Liberation Sans"

#set page(paper: "a4", margin: (x: 2.8cm, y: 2.6cm), footer: none)
#set text(lang: "it", region: "IT", fill: ink)
#set par(leading: 0.75em)

#let etichetta(txt) = text(font: sans, size: 8.5pt, tracking: 0.12em, fill: muted)[#txt]

#let campo(lbl, value) = block[
  #etichetta(lbl)
  #v(0.4em)
  #text(size: 12pt)[#value]
]

#v(2em)

#text(font: sans, size: 8.5pt, tracking: 0.14em, fill: accent)[PROGRAMMAZIONE DIDATTICA]
#v(0.8em)
#text(size: 40pt, weight: 700)[Informatica]
#v(0.4em)
#text(size: 15pt, fill: muted)[Classe 1C · Scientifico Opz. Scienze Applicate]

#v(3.5em)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 2em,
  campo("DOCENTE", "Prof.ssa Antonella Sonna"),
  campo("ORE ANNUE", "66"),
  campo("ORE A CONSUNTIVO", "68"),
)

#v(1fr)

#line(length: 100%, stroke: 0.8pt + ink)
#v(0.9em)
#grid(
  columns: (1fr, auto),
  align: bottom,
  [
    #text(size: 12pt, weight: 700)[Liceo B. Russell]
    #v(0.2em)
    #text(size: 9.5pt, fill: muted)[VIA IV NOVEMBRE 35, 38023 CLES]
  ],
  align(right)[
    #etichetta("ANNO SCOLASTICO")
    #v(0.2em)
    #text(size: 12pt)[2024/25]
  ],
)
