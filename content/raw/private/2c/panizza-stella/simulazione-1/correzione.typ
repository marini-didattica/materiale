// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/panizza-stella/simulazione-1/correzione.typ /tmp/panizza-stella.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Stella Panizza", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Stella Panizza",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 2C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (80 punti)

#risposta(category: "E", tag: "Esercizio", title: [Posizioni alternate], points: 12, score: 12, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Perfetto: corretto e idiomatico.]

#risposta(category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 1, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Il file non è eseguibile: `storto` è un intero e non ha `append`, la condizione `len(l) < i` non è mai vera e `storto.append(l)` non inverte nulla.]

#risposta(none, category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 0, diff: 2)

#risposta(none, category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, score: 0, diff: 3)

#risposta(none, category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
