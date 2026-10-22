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

#risposta(category: "E", tag: "Esercizio", title: [Posizioni alternate], points: 12, score: 12, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento(
  "Perfetto: corretto e idiomatico.",
)

#risposta(category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 16, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento(
  "Ottimo! Buona l'idea di aggiungere gli elementi alla lista stessa anziché utilizzarne un'altra. Nota che in realtà questa non è una inversione in place in realtà. La vera inversione in place vuole che non venga usata memoria aggiuntiva oltre a quella della lista, mentre qui, dopo il primo ciclo, il programma deve ospitare il doppio della dimensione della lista",
)

#risposta(category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 16, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento(
  "Perfetto: corretto e idiomatico.",
)

#risposta(category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, score: 14, diff: 3)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[Hai trovato il massimo ma non il secondo. La funzione `pop` vuole un indice, non un valore. Inoltre pop rimuove solo *un* valore. Dovresti assicurarti di averli rimossi tutti prima di cercare di nuovo il massimo]

#risposta(category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, score: 0, diff: 3)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento(
  "Questo file (non) risolve l'esercizio 4",
)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
