// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1d/quatrale-lorenzo/simulazione-1/correzione.typ /tmp/quatrale-lorenzo.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Lorenzo Quatrale", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Lorenzo Quatrale",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1D · 20 ottobre 2026",
)

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 3)[
  #raw(read("le-tue-risposte/Untitled-1.txt"), block: true, lang: "text")
]
#commento(
  "Bene dai! Attento però: RAM e ROM sono invertite. La scheda video è una unità di computazione, non di memoria. La sua caratteristica è che è in grado di eseguire istruzioni IN PARALLELO",
)

#v(1em)
#risposta(none, category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 0)

#v(1em)
#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

#v(1em)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/Es1.py"), block: true, lang: "python")
]
#commento(
  "L'idea è giusta, ma n/2 non riconosce i pari: serve n % 2. Occhio anche al nome delle variabili: nel testo dell'esercizio chiedevo di contare i numeri pari da 0 a n, quindi il ruolo di x e n qui andrebbe invertito. Occhio anche agli estremi, questo algoritmo non conta 7, anche se dovrebbe",
)

#v(1em)
#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 5, diff: 2)[
  #raw(read("le-tue-risposte/es2.py"), block: true, lang: "python")
]
#commento(
  "Hai impostato il ciclo, ma manca tutto il resto.",
)

#v(1em)
#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

#v(1em)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#v(1em)
#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#v(1em)
#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

#v(1em)

= Riepilogo dei punteggi

#griglia-correzione()
