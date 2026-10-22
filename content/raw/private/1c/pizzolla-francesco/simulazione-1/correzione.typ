// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1c/pizzolla-francesco/simulazione-1/correzione.typ /tmp/pizzolla-francesco.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Francesco Pizzolla", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Francesco Pizzolla",
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
#commento[Ottima risposta: cinque componenti con ruoli ben distinti. Piccola imprecisione: la RAM è la memoria di lavoro temporanea, non la memoria dei dati in generale.]

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 6.5)[
  #raw(read("le-tue-risposte/domanda2.txt"), block: true, lang: "text")
]
#commento[Molto bene: base 2 per i numeri e ASCII per i caratteri. Cura l'ortografia (ASCII, non aschii) e accenna al fatto che ogni carattere ha un codice numerico.]

#risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 4.5)[
  #raw(read("le-tue-risposte/domanda3.txt"), block: true, lang: "text")
]
#commento[Risposta convincente: istruzione tradotta in binario e instruction set come insieme condiviso di istruzioni. Manca solo un accenno esplicito all'assembly.]

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Il conteggio dei pari c'è, ma il programma stampa anche tutti i numeri e l'incremento doppio dentro l'`if` salta i dispari. Il risultato per `n = 7` è sbagliato: serve un solo incremento e una sola stampa finale.]

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 2, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Il file è incompleto (`if` senza condizione): il programma non può funzionare. La struttura del ciclo è impostata, ma manca il corpo che accumula la somma.]

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 7, diff: 2)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[Hai capito l'ordine inverso e l'output, ma hai scritto ordine decrescente: non è un ordinamento, è la lista letta dal fondo.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Perfetto: lo scambio tramite `c` è spiegato e l'output è corretto.]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 9, diff: 2)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Bene: hai riconosciuto i pari e riportato l'output. Piccola imprecisione: il ciclo parte da `i = 0`, non da `1`, e stampa i valori, non li conta.]

= Riepilogo dei punteggi

#griglia-correzione()
