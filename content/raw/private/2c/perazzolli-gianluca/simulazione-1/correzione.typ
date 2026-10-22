// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/perazzolli-gianluca/simulazione-1/correzione.typ /tmp/perazzolli-gianluca.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Gianluca Perazzolli", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Gianluca Perazzolli",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 2C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (80 punti)

#risposta(category: "E", tag: "Esercizio", title: [Posizioni alternate], points: 12, score: 12, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento(
  "Corretto: scorri la lista a passi di 2 e stampi gli elementi nelle posizioni pari.",
)

#risposta(category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 6, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento(
  "Stampi gli elementi al contrario, ma non inverti la lista in place e non stampi la lista finale.",
)

#risposta(category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 16, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento(
  "Corretto: costruisci l'inversa e confronti le due liste.",
)

#risposta(category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, score: 14, diff: 3)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento(
  "La logica del secondo massimo funziona con valori distinti, anche negativi, ma non con duplicati: con [5, 5, 3] stampi 5 invece di 3.",
)

#risposta(category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, score: 14, diff: 3)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento(
  "Filtri correttamente i non negativi e mantieni lo zero, ma stampi l1 invece di aggiornare l come richiesto.",
)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
