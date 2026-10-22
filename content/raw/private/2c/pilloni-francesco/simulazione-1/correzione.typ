// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/pilloni-francesco/simulazione-1/correzione.typ /tmp/pilloni-francesco.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Francesco Pilloni", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Francesco Pilloni",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 2C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (80 punti)

#risposta(category: "E", tag: "Esercizio", title: [Posizioni alternate], points: 12, score: 10, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento(
  "La selezione degli indici pari è corretta, ma stampi una lista invece degli elementi uno per uno.",
)

#risposta(category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 16, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento(
  "Corretto: estendi la lista con la sua copia invertita e poi rimuovi la prima metà, ottenendo l'inversione in place.",
)

#risposta(category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 16, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento(
  "Corretto: confronto con la lista invertita e output True/False.",
)

#risposta(category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, score: 5, diff: 3)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento(
  "Hai trovato il massimo ma non il secondo: dopo pop(max) continui a confrontare con il massimo e stampi di nuovo il massimo (5 invece di 4). Inoltre pop vuole un indice, non un valore.",
)

#risposta(category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, score: 0, diff: 3)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento(
  "Questo file risolve l'esercizio 4 (secondo più grande), non il 5: manca la rimozione dei negativi.",
)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
