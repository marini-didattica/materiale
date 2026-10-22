// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/moscon-laura/simulazione-1/correzione.typ /tmp/moscon-laura.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Laura Moscon", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Laura Moscon",
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
#commento(
  "Corretto: selezioni gli indici pari e stampi gli elementi corrispondenti.",
)

#risposta(category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 3, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento(
  "Non stai invertendo la lista: costruisci una lista di indici decrescenti e la stampi. Servono scambi tra gli estremi della lista stessa.",
)

#risposta(category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 8, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento(
  "Il confronto a due puntatori è impostato bene, ma palindromo viene riassegnato a ogni iterazione: per una lista non palindroma l'ultimo confronto può rimetterlo a True. Esci dal ciclo al primo disallineamento.",
)

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
