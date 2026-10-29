// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/pilloni-francesco/prova-1/correzione.typ /tmp/pilloni-francesco.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Francesco Pilloni", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Francesco Pilloni",
  title: "Correzione — Prova 1",
  subtitle: "Classe 2C · 29 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (70 punti)

#risposta(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 12, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Corretto: sommi gli elementi e calcoli la media. Manca la gestione della lista vuota: con `l = []` la divisione per `len(l)` provoca `ZeroDivisionError`.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 13, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Il controllo è corretto per i valori dell'esempio, ma non scambi `a` e `b`: se `a < b` il programma non funziona. Il codice è generico e lo zero è gestito bene.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 12, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Perfetto, corretto e idiomatico.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 12, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[Corretto: trovi la prima occorrenza, ti fermi con `break` e stampi il messaggio richiesto.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 18, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Corretto: confronti le coppie simmetriche e ti fermi alla prima differenza. La lista di prova è più lunga, ma il codice è generico e funziona anche con lista vuota e con un solo elemento.]

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 5, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[Hai capito il funzionamento, ma l'ordine dell'output è sbagliato: il ciclo parte dal fondo, quindi stampa `10`, `-4`, `0`, `8`.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi il controllo dei negativi e riporti `True`.]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Corretto: descrivi lo scambio tramite `t` e riporti `8, 3`.]

#risposta(category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 8, diff: 2)[
  #raw(read("le-tue-risposte/snippet4.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi passo per passo come `risultato` diventa `a^b` e riporti `81`.]

#risposta(category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 8, diff: 3)[
  #raw(read("le-tue-risposte/snippet5.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi le sottrazioni successive, il valore finale `a = -3` e l'output `3`.]

= Riepilogo dei punteggi

#griglia-correzione()
