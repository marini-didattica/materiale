// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/mezzena-nicolò/simulazione-1/correzione.typ /tmp/mezzena-nicolò.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Nicolò Mezzena", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Nicolò Mezzena",
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
#commento[Corretto: selezioni gli indici pari e stampi gli elementi corrispondenti. Occhio che il `continue` è inutile.]

#risposta(category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 2, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Il codice non inverte la lista: `l[i] == l[i+4]` è un confronto, non un'assegnazione, e gli indici sono fissi per una lista di 5 elementi. Alla fine stampi la lista invariata.]

#risposta(category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 2, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[La soluzione è costruita per una lista di 5 elementi: con `l = [7]` vai in errore già alla prima riga (`l[4]`). Serve un confronto generico delle coppie simmetriche.]

#risposta(none, category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, score: 0, diff: 3)

#risposta(none, category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 6, score: 3, diff: 2)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[Hai colto il confronto con l'elemento precedente, ma non hai detto cosa fa il programma nel complesso né l'output: controlla se la lista è ordinata in modo non decrescente e stampa `True`.]

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
