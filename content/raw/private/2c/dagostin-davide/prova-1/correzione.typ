// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/dagostin-davide/prova-1/correzione.typ /tmp/dagostin-davide.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Davide Dagostin", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Davide Dagostin",
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
#commento[Corretto: sommi gli elementi e dividi per `len(l)`, gestendo anche la lista vuota. Piccola cosa: nel caso vuoto stampi la stringa `"0"` invece del numero `0`; non lo considero un errore, ma la consegna chiedeva di stampare un numero.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 16, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Perfetto: scambi `a` e `b` quando serve, controlli tutti gli elementi e stampi un unico booleano. Funziona anche con la lista vuota.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 6, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[L'idea di confrontare elementi consecutivi c'è, ma `for i in l` assegna a `i` i *valori* della lista, non gli indici: `l[i]` e soprattutto `l[i+1]` possono andare fuori range. Inoltre non stampi nulla e con la lista vuota dovresti stampare `True`. Usa `for i in range(1, len(l))` e confronta `l[i]` con `l[i-1]`.]

#risposta(none, category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 0, diff: 1)

#risposta(none, category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 0, diff: 2)

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[Corretto: hai spiegato il ciclo al contrario e riportato l'output giusto.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 2, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Hai riportato solo l'output, senza spiegare cosa fa il programma. Va bene il risultato, ma manca la descrizione.]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 2, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Hai riportato solo l'output, senza spiegare cosa fa il programma. Va bene il risultato, ma manca la descrizione.]

#risposta(category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 2, diff: 2)[
  #raw(read("le-tue-risposte/snippet4.txt"), block: true, lang: "text")
]
#commento[Hai riportato solo l'output, senza spiegare cosa fa il programma. Va bene il risultato, ma manca la descrizione.]

#risposta(category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 2, diff: 3)[
  #raw(read("le-tue-risposte/snippet5.txt"), block: true, lang: "text")
]
#commento[Hai riportato solo l'output, senza spiegare cosa fa il programma. Va bene il risultato, ma manca la descrizione.]

= Riepilogo dei punteggi

#griglia-correzione()
