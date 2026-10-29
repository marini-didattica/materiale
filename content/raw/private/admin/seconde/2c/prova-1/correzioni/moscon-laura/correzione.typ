// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/moscon-laura/prova-1/correzione.typ /tmp/moscon-laura.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Laura Moscon", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Laura Moscon",
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
#commento[Corretto, un po' più contorto del dovuto. Non serve calcolare la media ad ogni iterazione, basterebbe calcolarla alla fine, una volta calcolata la somma.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 10, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[L'applicazione è perfetta per `a > b`. Tuttavia nel caso in cui `a < b` le variabili antrebbero invertite, altrimenti il programma non da il risultato corretto. Prima del ciclo, se `a > b`, scambiali.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 12, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Corretto: confronti ogni elemento con il successivo e ti fermi al primo calo. Funziona anche con lista vuota e con un solo elemento. In realtà l'else non è necessario, ma non crea nemmeno problemi]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 12, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[Corretto: trovi la prima occorrenza, ti fermi con `break` e stampi il messaggio richiesto. Brava che hai rispettato al 100% il formato richiesto dal testo]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 18, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Perfetto, corretto e idiomatico: confronti le coppie simmetriche con due indici e ti fermi alla prima differenza. Funziona anche con lista vuota e con un solo elemento.]

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 4, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[La spiegazione è quasi giusta, ma l'output è incompleto: manca `-4`. Il programma stampa `10`, `-4`, `0`, `8`. Mi sarebbe bastato un "il programma stampa solo i numeri pari della lista in ordine invertito"]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi il controllo dei negativi e riporti l'output `True`.]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Corretto: lo scambio è descritto bene e l'output è `8 3`.]

#risposta(category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 8, diff: 2)[
  #raw(read("le-tue-risposte/snippet4.txt"), block: true, lang: "text")
]
#commento[Corretto: il programma calcola `a^b` e stampa `81`.]

#risposta(category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 8, diff: 3)[
  #raw(read("le-tue-risposte/snippet5.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi le sottrazioni successive e il valore finale `a = -3`; l'output è `3`.]

= Riepilogo dei punteggi

#griglia-correzione()
