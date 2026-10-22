// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/dagostin-davide/simulazione-1/correzione.typ /tmp/dagostin-davide.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Davide Dagostin", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Davide Dagostin",
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

#risposta(category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Funziona e stampa la lista invertita, ma usi una lista ausiliaria (`L0`) e non modifichi `L` sul posto, come *esplicitamente richiesto dalla consegna*. Inoltre stampi `L0` invece di `L`.],

#risposta(category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 16, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Corretto: costruisci l'inversa e confronti elemento per elemento. Va bene anche l'uso della lista ausiliaria, non era vietato. Nota che in realtà sarebbe bastato controllare `if L[j] != L1[j]`.],

#risposta(category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, score: 13, diff: 3)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[Cerchi il massimo correttamente, ma poi usi `L.pop(max)`: `pop` vuole un indice, non un valore, e comunque dovresti assicurarti di rimuovere OGNI valore uguale al massimo. Comunque un'idea piuttosto solida c'è!]

#risposta(none, category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
