// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1d/barbaro-arturo/simulazione-1/correzione.typ /tmp/barbaro-arturo.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Arturo Barbaro", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Arturo Barbaro",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1D · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 6, score: 6)[
  #raw(read("le-tue-risposte/domanda1.txt"), block: true, lang: "text")
]
#commento[Bene. Occhio però che non è vero che la GPU "non è precisa". La differenza rispetto alla CPU è proprio che i calcoli vengono eseguiti in parallelo, anziché in serie.]

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 6)[
  #raw(read("le-tue-risposte/domanda2.txt"), block: true, lang: "text")
]
#commento[Bene il binario e i byte. Occhio che per immagazzinare i caratteri si usano le TABELLE ASCII, non linguaggi "huski"!]

#risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 4)[
  #raw(read("le-tue-risposte/domanda3.txt"), block: true, lang: "text")
]
#commento[L'idea di comando c'è; completa dicendo che l'istruzione è in binario e che l'instruction set è l'insieme delle istruzioni della CPU.]

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 10, diff: 1)[
  #raw(read("le-tue-risposte/es1.py"), block: true, lang: "python")
]
#commento[Ottimo! Sei stato uno dei pochi che non è cascato nel tranello di usare i cicli. La formula funziona; c'è solo il dettaglio che con `n` dispari stampa `4.0` invece di `4`. Sarebbe meglio usare `//` (che arrotonda per difetto).]

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 20, diff: 2)[
  #raw(read("le-tue-risposte/es2.py"), block: true, lang: "python")
]
#commento[Perfetto, corretto e idiomatico.]

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
