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
#commento[Perfetto: corretto e idiomatico]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 16, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Perfetto: corretto e idiomatico.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 12, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Corretto. Un filo più contorto di quanto necessario: avresti potuto scorrere la lista usango `range(1, len(l))` e confrontare `l[i]` con `l[i-1]`, ma il funzionamento è lo stesso.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 12, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[Corretto: trovi la prima occorrenza, ti fermi con `break` e stampi l'indice. C'è solo un refuso: `Trovato al'indice` invece di `Trovato all'indice`. Inoltre, come ti anticipavo, l'uso di `quit()` va bene in questi contesti, ma in generale è meglio evitare di terminare il programma in questo modo (ci sono ragioni tecniche complesse per cui è sconsigliato, ma sarebbe bene scrivere questi algoritmi senza anche solo banalmente per poter continuare l'esecuzione una volta terminato l'algoritmo).]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 18, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Corretto: confronti gli estremi simmetrici e conti le coppie uguali; il controllo finale `p == len(l)` funziona. Funziona anche con lista vuota e con un solo elemento. Avresti potuto farlo in modo più semplice, scorrendo la lista fino a metà, interrompendo alla prima coppia che non rispetta la condizione, ma il funzionamento è corretto.]

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 3, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[Quasi. Non li stampa in ordine di ritrovamento ma al contrario (da destra a sinistra, dall'ultimo al primo); l'output è incompleto e nell'ordine sbagliato: manca `0` e il ciclo parte dal fondo, quindi stampa `10`, `-4`, `0`, `8`.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi il controllo dei negativi e riporti `True`.]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 8, diff: 1)[
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
