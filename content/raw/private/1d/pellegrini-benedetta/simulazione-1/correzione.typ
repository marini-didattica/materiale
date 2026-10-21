// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1d/pellegrini-benedetta/simulazione-1/correzione.typ /tmp/pellegrini-benedetta.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Benedetta Pellegrini", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Benedetta Pellegrini",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1D · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 3)[
  #raw(read("le-tue-risposte/domanda_1.txt"), block: true, lang: "text")
]
#commento(
  "Ok. Occhio che è LA cpu, non IL cpu. Mancano descrizioni e almeno un'altra componente",
)

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 3)[
  #raw(read("le-tue-risposte/domanda_2.txt"), block: true, lang: "text")
]
#commento(
  "Hai parlato di memoria e variabili; avresti dovuto collegarti al codice binario e a come si possano rappresentare numeri e caratteri con questo. In particolare mi sarei aspettato un accenno a codifica in base 2 e tabelle ASCII",
)

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 2, diff: 1)[
  #raw(read("le-tue-risposte/esercizio_1.py"), block: true, lang: "python")
]

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 2, diff: 2)[
  #raw(read("le-tue-risposte/esercizio_2.py"), block: true, lang: "python")
]

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
