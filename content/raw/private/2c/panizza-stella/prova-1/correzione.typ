// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/panizza-stella/prova-1/correzione.typ /tmp/panizza-stella.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Stella Panizza", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Stella Panizza",
  title: "Correzione — Prova 1",
  subtitle: "Classe 2C · 29 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (70 punti)

#risposta(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 12, score: 11, diff: 2)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Corretto, un po' più contorto del dovuto. Non serve calcolare la media ad ogni iterazione, basterebbe calcolarla alla fine, una volta calcolata la somma.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 11, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[L'idea di gestire entrambi gli ordini di `a` e `b` è buona, ma il risultato viene riassegnato a `True` a ogni elemento interno all'intervallo: se prima trovi un elemento fuori e poi uno dentro, il programma torna a `True`. Una volta trovato un elemento fuori devi fermarti (o non rimettere più `True`).]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 7, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Il confronto è impostato male: usi `>` invece di `>=`, quindi due elementi uguali consecutivi fanno risultare la lista non ordinata; inoltre `ordine` viene sovrascritto a ogni iterazione. Per `[1, 2, 2]` il programma stampa `False`, ma la lista è ordinata. Ti conviene partire da `True` e mettere `False` solo quando trovi `l[i] < l[i-1]`, senza più rimetterlo a `True`.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 12, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[Corretto: trovi la prima occorrenza, ti fermi con `break` e stampi il messaggio richiesto.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 18, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Corretto: costruisci la lista invertita e la confronti con l'originale. Funziona anche con lista vuota e con un solo elemento.]

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 5, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[L'output è giusto, ma la spiegazione è imprecisa: il programma non cerca i numeri “che divisi per due fanno 0”, ma quelli il cui resto della divisione per due è zero, cioè i pari.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi il controllo dei negativi e riporti l'output `True`.]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Corretto: descrivi lo scambio tramite `t` e riporti l'output `8 3`.]

#risposta(category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 8, diff: 2)[
  #raw(read("le-tue-risposte/snippet4.txt"), block: true, lang: "text")
]
#commento[Corretto: il programma calcola `3^4 = 81`.]

#risposta(category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 6, diff: 3)[
  #raw(read("le-tue-risposte/snippet5.txt"), block: true, lang: "text")
]
#commento[Corretto. Mi manca solo la spiegazione di quanto vale `a` alla fine del ciclo.]

= Riepilogo dei punteggi

#griglia-correzione()
