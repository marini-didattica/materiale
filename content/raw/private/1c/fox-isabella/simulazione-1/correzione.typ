// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1c/fox-isabella/simulazione-1/correzione.typ /tmp/fox-isabella.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Isabella Fox", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Isabella Fox",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 4)[
  #raw(read("le-tue-risposte/domanda1.txt"), block: true, lang: "text")
]
#commento[Hai elencato molte componenti, ma alcune sono confuse: la GPU non è la mente del computer (lo è la CPU) e la CPU non è la memoria a breve termine (lo è la RAM). Tante idee un po' confuse diciamo. Risposta particolarmente simile a quella della tua compagna di banco... Poi ti scongiuro, almeno in verifica, non scrivermi che il sistema di raffreddamento di un PC serve per evitare esplosioni...]

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 6)[
  #raw(read("le-tue-risposte/domanda2.txt"), block: true, lang: "text")
]
#commento[Hai spiegato bene la codifica binaria dei file e dei caratteri, ma la domanda riguardava i numeri: manca la rappresentazione in base 2. Si fa un po' di fatica a capire cosa tu stia intendendo, cerca di essere un po' più chiara in generale.]

#risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 1)[
  #raw(read("le-tue-risposte/domanda3.txt"), block: true, lang: "text")
]
#commento[La risposta parla delle prestazioni del processore, non di cosa sia un'istruzione né dell'instruction set. Rileggi la domanda.]

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 4, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Il programma stampa i pari invece di contarli; inoltre `i` e `c` aumentano solo dentro l'`if`, quindi con i dispari il ciclo non termina. Qui sì che il computer "esplode"! Inoltre manca la stampa del conteggio.]

#risposta(none, category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
