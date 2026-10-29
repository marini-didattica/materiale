// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root . content/raw/private/1d/midjaiti-elif/simulazione-1/correzione.typ /tmp/midjaiti-elif.pdf

#import "/typst-theme/src/lib.typ": theme
#import "/typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Elif Midjaiti", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Elif Midjaiti",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1D · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 4)[
  #raw(read("le-tue-risposte/domanda2"), block: true, lang: "text")
]
#commento[Bene l'elenco! Occhio che il software non è proprio una componente fisica. Mancano le descrizioni.]

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 4)[
  #raw(read("le-tue-risposte/domanda3"), block: true, lang: "text")
]
#commento[Ok, andrebbe estesa leggermente, altrimenti si fa fatica a capire cosa tu intenda. Andrebbero citate codifica in base 2 e tabelle ASCII.]

#risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 4)[
  #raw(read("le-tue-risposte/domanda4"), block: true, lang: "text")
]
#commento[Anche qui andrebbe spiegato meglio. Cosa intendi con "L'instruction set sono tutte le informazioni"? La rappresentazione è fatta tramite codice binario (stringhe di bit).]

= Scrittura del codice (60 punti)

#risposta(none, category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 0, diff: 1)

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 15, diff: 2)[
  #raw(read("le-tue-risposte/es2.py"), block: true, lang: "python")
]
#commento[Wow! Non mi sarei aspettato che qualcuno riuscisse a ricavare la formula di Gauss. Complimenti per il ragionamento! Non posso darti punteggio pieno però perché ciò che hai scritto non è codice Python.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)[
  #raw(read("le-tue-risposte/es3.py"), block: true, lang: "python")
]

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
