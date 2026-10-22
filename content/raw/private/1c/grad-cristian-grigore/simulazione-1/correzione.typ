// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1c/grad-cristian-grigore/simulazione-1/correzione.typ /tmp/grad-cristian-grigore.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Cristian Grigore Grad", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Cristian Grigore Grad",
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
#commento[Cinque componenti con scopi chiari. Qualche imprecisione: dire che la RAM è la memoria "corta" non ha alcun significato, ma si capisce che intendevi "a breve termine"; cura l'ortografia.]

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 4)[
  #raw(read("le-tue-risposte/domanda2.txt"), block: true, lang: "text")
]
#commento[Hai colto il ruolo del codice binario per numeri e parole, ma manca la distinzione tra rappresentazione in base 2 dei numeri e codifica dei caratteri (ASCII).]

#risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 4.5)[
  #raw(read("le-tue-risposte/domanda3.txt"), block: true, lang: "text")
]
#commento[Buona risposta: istruzione in binario e instruction set come insieme condiviso. Manca solo un accenno all'assembly.]

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 0, diff: 1)[
  #raw(read("le-tue-risposte/es1.py"), block: true, lang: "python")
]
#commento[Hai solo inizializzato le variabili: manca completamente il codice che conta i pari.]

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 4, diff: 2)[
  #raw(read("le-tue-risposte/es2.py"), block: true, lang: "python")
]
#commento[Il ciclo `while i <= n` non incrementa mai `i`, quindi va in loop infinito; inoltre `print` senza parentesi non stampa nulla. Manca l'accumulo della somma.]

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/snippe2t.txt"), block: true, lang: "text")
]
#commento[Perfetto: lo scambio è spiegato correttamente e l'output è `8 5`.]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Bene: hai riconosciuto i pari e riportato l'output. Il ciclo parte da `0`, non da `1`, e stampa i valori invece di contarli.]

= Riepilogo dei punteggi

#griglia-correzione()
