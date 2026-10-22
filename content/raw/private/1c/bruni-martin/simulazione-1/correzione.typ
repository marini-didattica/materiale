// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1c/bruni-martin/simulazione-1/correzione.typ /tmp/bruni-martin.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Martin Bruni", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Martin Bruni",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 7)[
  #raw(read("le-tue-risposte/domanda1.txt"), block: true, lang: "text")
]
#commento[Cinque componenti ben descritte. Piccola imprecisione: si dice LA CPU.]

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 4.5)[
  #raw(read("le-tue-risposte/domanda2.txt"), block: true, lang: "text")
]
#commento[Hai detto correttamente che i numeri sono in binario, ma non hai spiegato come si salvano caratteri e parole (codifica ASCII o Unicode).]

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 10, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Perfetto: corretto e idiomatico.]

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 20, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Perfetto: corretto e idiomatico.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 1, diff: 3)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[La consegna chiedeva di verificare che tutti gli elementi della lista fossero nell'intervallo: stampare `len(l)` non c'entra. Serve un ciclo, che controlli ogni elemento.]

= Lettura del codice (30 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[Perfetto: ordine inverso e output corretti.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 2, diff: 2)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Non è vero che i valori restano uguali: con `c = a`, `a = b`, `b = c` le due variabili si scambiano. L'output è `8 5`.]

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
