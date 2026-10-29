// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/zuech-gabriele/prova-1/correzione.typ /tmp/zuech-gabriele.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Gabriele Zuech", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Gabriele Zuech",
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
#commento[Corretto: sommi gli elementi e calcoli la media, gestendo anche la lista vuota.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 16, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Corretto: scambi `a` e `b` quando serve, controlli tutti gli elementi e stampi un unico booleano. Funziona anche con la lista vuota.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 12, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Corretto: confronti ogni elemento con il successivo e ti fermi al primo calo. Funziona anche con lista vuota e con un solo elemento.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 11, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[Corretto: trovi la prima occorrenza, ti fermi con `break` e stampi l'indice. C'è solo un refuso: `Trovato al'indice` invece di `Trovato all'indice`.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 18, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Corretto: confronti gli estremi simmetrici e conti le coppie uguali; il controllo finale `p == len(l)` funziona. Funziona anche con lista vuota e con un solo elemento.]

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 4, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[La spiegazione è quasi giusta, ma l'output è incompleto e nell'ordine sbagliato: manca `0` e il ciclo parte dal fondo, quindi stampa `10`, `-4`, `0`, `8`.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi il controllo dei negativi e riporti `True`.]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 7, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Corretto: descrivi lo scambio e riporti `8 3`.]

#risposta(category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 8, diff: 2)[
  #raw(read("le-tue-risposte/snippet4.txt"), block: true, lang: "text")
]
#commento[Corretto: il programma calcola `a^b = 81`.]

#risposta(category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 7, diff: 3)[
  #raw(read("le-tue-risposte/snippet5.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi le sottrazioni successive, il valore finale `a = -3` e l'output `3`. La frase “toglie tutti i multipli di b” è imprecisa: sottrae `b` finché `a` non diventa negativo.]

= Riepilogo dei punteggi

#griglia-correzione()
