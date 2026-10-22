// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/filippi-renato/simulazione-1/correzione.typ /tmp/filippi-renato.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Renato Filippi", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Renato Filippi",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 2C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (80 punti)

#risposta(category: "E", tag: "Esercizio", title: [Posizioni alternate], points: 12, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Hai interpretato la consegna come stampa i valori dispari: qui serve invece stampare gli elementi nelle *posizioni* alternate (indici 0, 2, 4, ...), indipendentemente dal loro valore.]

#risposta(category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 6, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Stampi gli elementi al contrario uno per uno, ma non inverti la lista in place e non stampi la lista finale.]

#risposta(category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 5, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Il doppio ciclo non confronta le coppie simmetriche: per `[1, 2, 3, 2, 1]` stampa `False`. Servono due indici, uno da sinistra e uno da destra, oppure il confronto con la lista invertita.]

#risposta(none, category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, score: 0, diff: 3)

#risposta(category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, score: 14, diff: 3)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Stampi i valori non negativi uno per uno, ma non modifichi `l` e non stampi la lista finale.]

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
