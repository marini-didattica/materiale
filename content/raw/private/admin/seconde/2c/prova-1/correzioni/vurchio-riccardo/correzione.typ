// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root . content/raw/private/2c/vurchio-riccardo/prova-1/correzione.typ /tmp/vurchio-riccardo.pdf

#import "/typst-theme/src/lib.typ": theme
#import "/typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Riccardo Vurchio", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Riccardo Vurchio",
  title: "Correzione — Prova 1",
  subtitle: "Classe 2C · 29 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (70 punti)

#risposta(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 12, score: 12, diff: 2)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Corretto: sommi gli elementi, conti quanti sono e calcoli la media, gestendo anche la lista vuota.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 14, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Il controllo è corretto per i valori dell'esempio. Manca però lo scambio di `a` e `b` quando `a > b`: con gli estremi invertiti il programma dà il risultato sbagliato.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 12, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Corretto: confronti ogni elemento con il successivo e segnali il primo calo. Funziona anche con lista vuota e con un solo elemento.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 10, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[La ricerca della prima occorrenza è corretta e idiomatica, ma stampi letteralmente `Trovato all'indice N` invece del numero trovato, e non stampa mai `Non trovato`. Devi stampare `Trovato all'indice`, `indice_trovato` e aggiungere l'`else`.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 18, diff: 2)[
  #raw(read("le-tue-risposte/esecizio5.py"), block: true, lang: "python")
]
#commento[Corretto: usi lo slicing `l[::-1]` per confrontare la lista con la sua inversa. Funziona anche con lista vuota e con un solo elemento. Attenzione al nome del file: `esecizio5.py` invece di `esercizio5.py`.]

= Lettura del codice (40 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 0, diff: 1)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 0, diff: 1)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 0, diff: 1)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
