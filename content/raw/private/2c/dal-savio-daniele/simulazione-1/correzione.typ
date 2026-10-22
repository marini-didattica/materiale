// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/dal-savio-daniele/simulazione-1/correzione.typ /tmp/dal-savio-daniele.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Daniele Dal Savio", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Daniele Dal Savio",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 2C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (80 punti)

#risposta(category: "E", tag: "Esercizio", title: [Posizioni alternate], points: 12, score: 10, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento(
  "La logica per gli indici pari è corretta, ma il file è impostato su l = [] e stampa un messaggio extra quando la lista è vuota. Gli esempi richiedono nessun output per la lista vuota e solo gli elementi negli altri casi.",
)

#risposta(none, category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 0, diff: 2)

#risposta(none, category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 0, diff: 2)

#risposta(category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, score: 3, diff: 3)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento(
  "L'idea di confrontare i valori non porta al secondo massimo: il ciclo interno continua a sovrascrivere s e per [1, 2, 3, 4, 5] stampi 5 invece di 4. Conviene tenere due variabili, massimo e secondo massimo, aggiornate in un solo passaggio.",
)

#risposta(category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, score: 14, diff: 3)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento(
  "Filtri correttamente i valori non negativi e mantieni lo zero, ma costruisci l1 e stampi quella: la consegna chiedeva che alla fine l contenesse solo i non negativi.",
)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
