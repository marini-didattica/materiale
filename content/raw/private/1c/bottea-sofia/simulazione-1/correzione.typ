// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1c/bottea-sofia/simulazione-1/correzione.typ /tmp/bottea-sofia.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Sofia Bottea", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Sofia Bottea",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 1.5)[
  #raw(read("le-tue-risposte/domanda1.txt"), block: true, lang: "text")
]
#commento[Hai indicato solo CPU e scheda madre, senza descriverne lo scopo e lasciando la frase incompleta. La consegna chiedeva almeno cinque componenti con una breve spiegazione.]

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 4)[
  #raw(read("le-tue-risposte/domanda2.txt"), block: true, lang: "text")
]
#commento[Qui c'è stato un problema di interpretazione di domanda. Mi sarei aspettato qualcosa riguardo codice binario, codifica in base 2 e tabelle ASCII.]

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 4, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[L'idea dei pari c'è, ma il programma stampa i numeri invece di contarne quanti sono. Inoltre il ciclo si ferma a `i < n`, quindi `n` non viene mai considerato.]

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 20, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Perfetto: somma corretta e n incluso.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 10, diff: 3)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Stai confrontando un intero con una lista (`a > l`), operazione non valida in Python. Ciò che fai dentro all'`if` è giusto, ma andrebbe applicato ad ogni elemento della lista.]

= Lettura del codice (30 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 4, diff: 2)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[Hai capito che scorre la lista al contrario, ma la condizione è sbagliata: il ciclo continua finché `i >= 0`, non finché `i < 0`. Manca inoltre l'output.]

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
