// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1d/laccona-alessandro-massimo/simulazione-1/correzione.typ /tmp/laccona-alessandro-massimo.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Alessandro Massimo Laccona", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Alessandro Massimo Laccona",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1D · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(none, category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 0)

#risposta(none, category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 0)

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 0, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento(
  "Come specificato nelle istruzioni, i programmi che funzionano solo su un input specifico verranno valutati 0. Inoltre la variabile l è una tupla; le liste usano le parentesi quadre. Questo esercizio non aveva bisogno di una lista",
)

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento(
  "L'idea del ciclo è giusta però stai facendo una gran confusione. Sta ancora usando una tupla al posto di una lista. In ogni caso non servono liste per questo tipo di esercizio. E' poco chiaro cosa tu stia cercando di fare nel corpo del while",
)

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
