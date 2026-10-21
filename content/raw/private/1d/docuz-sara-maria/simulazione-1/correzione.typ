// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1d/docuz-sara-maria/simulazione-1/correzione.typ /tmp/docuz-sara-maria.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Sara Maria Docuz", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Sara Maria Docuz",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1D · 20 ottobre 2026",
)

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(none, category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 0)

#v(1em)
#risposta(none, category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 0)

#v(1em)
#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

#v(1em)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 10, diff: 1)[
  #raw(read("le-tue-risposte/esercizio01_py"), block: true, lang: "python")
]
#commento(
  "Perfetto. Corretto e idiomatico",
)

#v(1em)
#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 14, diff: 2)[
  #raw(read("le-tue-risposte/esercizio02_py"), block: true, lang: "python")
]
#commento(
  "Hai impostato la somma, ma manca l'incremento di i e la stampa finale. Siccome manca l'incremento, il ciclo va in loop infinito.",
)

#v(1em)
#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 5, diff: 3)[
  #raw(read("le-tue-risposte/esercizio03_py"), block: true, lang: "python")
]
#commento(
  "L'idea di scorrere la lista c'è; attenzione a len(l) (con le parentesi tonde) e all'incremento di i(hai scritto i = 1 + 1, probabilmente intendevi i = i + 1).",
)

#v(1em)

= Lettura del codice (30 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 6, diff: 2)[
  #raw(read("le-tue-risposte/snippet01_txt"), block: true, lang: "text")
]
#commento(
  "Faccio fatica a capire se effettivamente hai capito, dal punto di vista intuitivo, cosa questo programma faccia. Non mi serve una descrizione riga per riga di ciò che accade, l'ultima riga sarebbe bastata. Inoltre manca l'output. Avresti dovuto sottolineare che scorre la lista, stampandola AL CONTRARIO",
)

#v(1em)
#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)[
  #raw(read("le-tue-risposte/snippet02_txt.txt"), block: true, lang: "text")
]
#commento(
  "Ha il valore di cosa?? Secondo me avevi capito, ma non posso darti punteggio visto che manca proprio ciò che mi serve!",
)

#v(1em)
#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 8, diff: 2)[
  #raw(read("le-tue-risposte/snippet03_txt"), block: true, lang: "text")
]
#commento(
  "Bene! Manca l'output e va specificato che stai STAMPANDO, non CONTANDO i numeri pari.",
)

#v(1em)

= Riepilogo dei punteggi

#griglia-correzione()
