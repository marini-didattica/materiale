// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1c/melis-nicolò/simulazione-1/correzione.typ /tmp/melis-nicolò.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Nicolò Melis", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Nicolò Melis",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 3)[
  #raw(read("le-tue-risposte/domanda1.txt"), block: true, lang: "text")
]
#commento(
  "Bene l'elenco, ma mancano le descrizioni e la GPU non è una memoria, ma un'unità di calcolo che esegue istruzioni IN PARALLELO",
)

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 1)[
  #raw(read("le-tue-risposte/domanda2.txt"), block: true, lang: "text")
]
#commento(
  "Probabilmente stai facendo riferimento alla sintassi di python. Ad ogni modo se non elabori un filo di più è impossibile capire cosa tu intenda",
)

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 0, diff: 1)[
  #raw(read("le-tue-risposte/esecizio1.py"), block: true, lang: "python")
]
#commento(
  "Il ciclo while somma == n non entra mai (somma vale 0 e n vale 7) e il corpo è vuoto: il programma non fa nulla. Serviva un ciclo su i da 0 a n.",
)

#risposta(none, category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 1, diff: 2)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento(
  "La risposta non descrive il codice: non si tratta di una media, ma della stampa degli elementi della lista dal fondo all'inizio. Manca l'output.",
)

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 1, diff: 2)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento(
  "Non viene stampato ERROR: le variabili sono definite correttamente e il programma scambia i valori. L'output è 8 5.",
)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
