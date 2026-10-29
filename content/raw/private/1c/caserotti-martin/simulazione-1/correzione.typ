// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root . content/raw/private/1c/caserotti-martin/simulazione-1/correzione.typ /tmp/caserotti-martin.pdf

#import "/typst-theme/src/lib.typ": theme
#import "/typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Martin Caserotti", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Martin Caserotti",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 5)[
  #raw(read("le-tue-risposte/domanda1.txt"), block: true, lang: "text")
]
#commento[Hai nominato sei componenti con descrizioni sensate, ma mancano CPU, RAM e disco, che sono tra le più importanti. Tra l'altro, mi dimentichi il radiatore!?]

#risposta(none, category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 0)

#risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 3)[
  #raw(read("le-tue-risposte/domanda3.txt"), block: true, lang: "text")
]
#commento[L'idea di istruzione come comando c'è, ma non hai spiegato come viene rappresentata (in binario) e l'instruction set è l'insieme delle istruzioni eseguibili da un processore, non una singola serie di informazioni.]

= Scrittura del codice (60 punti)

#risposta(none, category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 0, diff: 1)

#risposta(none, category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
