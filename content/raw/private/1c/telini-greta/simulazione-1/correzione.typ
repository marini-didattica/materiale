// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1c/telini-greta/simulazione-1/correzione.typ /tmp/telini-greta.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Greta Telini", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Greta Telini",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 3.5)[
  #raw(read("le-tue-risposte/domanda1.txt"), block: true, lang: "text")
]
#commento(
  "Hai nominato molte parti, ma la risposta è confusa: la GPU non è la scheda madre e il processore non velocizza il disco. Mancano RAM e una descrizione chiara della CPU.",
)

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 3)[
  #raw(read("le-tue-risposte/domanda2.txt"), block: true, lang: "text")
]
#commento(
  "Hai detto che i numeri sono salvati in binario, ma non hai spiegato come si rappresentano in base 2 né come si codificano i caratteri (ASCII). Il disco è solo il supporto, non il codice.",
)

#risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 2)[
  #raw(read("le-tue-risposte/domanda3.txt"), block: true, lang: "text")
]
#commento(
  "L'istruzione è descritta in modo vago; l'instruction set non è l'insieme di if, elif ed else (che sono costrutti Python), ma l'insieme delle istruzioni macchina di un processore. L'idea di regole precise è comunque un buon punto di partenza.",
)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 6, diff: 1)[
  #raw(read("le-tue-risposte/es1.py"), block: true, lang: "python")
]
#commento(
  "La struttura di base c'è e l'idea è giusta. Ci sono più problemi però. Innanzitutto il `print(i)` andrebbe rimosso, ma non è grave che te lo sia dimenticato. Il vero problema sono le ultime due righe nell'if: rimuovendole l'applicazione funziona correttamente",
)

#risposta(none, category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
