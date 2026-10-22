// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1c/bertoldi-emma/simulazione-1/correzione.typ /tmp/bertoldi-emma.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Emma Bertoldi", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Emma Bertoldi",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 3.5)[
  #raw(read("le-tue-risposte/domanda1.txt"), block: true, lang: "text")
]
#commento(
  "Hai elencato cinque componenti, ma confondi i ruoli: la CPU è il processore, non la memoria a breve termine (che è la RAM), e la GPU non è la mente del computer. Manca proprio la RAM.",
)

#risposta(none, category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 0)

#risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 2.5)[
  #raw(read("le-tue-risposte/domanda3.txt"), block: true, lang: "text")
]
#commento(
  "L'idea di istruzione come comando c'è, ma manca come viene rappresentata (codice binario) e l'instruction set non è tutto ciò che scriviamo noi: è l'insieme delle istruzioni che un processore sa eseguire.",
)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 3, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento(
  "Il programma non conta i pari: stampa la stringa i e non ha un vero ciclo, perché while i == n non viene mai eseguito. Riparti da un ciclo while i <= n e incrementa un contatore quando i % 2 == 0.",
)

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 1, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento(
  "Il ciclo while i == 10 non parte mai perché i vale 0; inoltre sum(i) non è valido su un intero. Serve un ciclo che accumuli i valori in una variabile somma e stampi il risultato.",
)

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
