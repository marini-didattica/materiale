// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/battocletti-alessandro/prova-1/correzione.typ /tmp/battocletti-alessandro.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Alessandro Battocletti", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Alessandro Battocletti",
  title: "Correzione — Prova 1",
  subtitle: "Classe 2C · 29 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (70 punti)

#risposta(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 12, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[La somma e la media sono corrette. Però la divisione avviene prima del controllo sulla lista vuota, quindi con `l = []` il programma va in `ZeroDivisionError`: controlla `len(l) == 0` prima di dividere. La variabile `i` inizializzata a 1 non viene usata.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 13, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Il controllo dell'intervallo è corretto e gestisce anche il caso di lista vuota. Attenzione però allo scambio: `a, b = a, b` non fa nulla; per scambiare i due estremi devi scrivere `a, b = b, a`, altrimenti con `a > b` il programma dà il risultato sbagliato.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Il controllo con il `while` è corretto per una lista non vuota. Però, se la lista è vuota, dopo aver stampato `True` stampi anche `0`: la consegna chiede solo `True`. Togli quel secondo `if`.]

#risposta(none, category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 0, diff: 1)

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 4, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[L'idea del confronto simmetrico c'è, ma il codice non è eseguibile: `l(i)` non fa ciò che pensi e da errore; avresti dovuto scrivere `l[i]`; inoltre `l[i-1-i]` vale sempre `l[-1]` e non il penultimo, il terzultimo, ecc. L'indice giusto è `len(l) - 1 - i`.]

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 0, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[Hai scritto solo `programma`: non hai spiegato cosa fa il frammento né riportato l'output.]

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 0, diff: 1)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 0, diff: 1)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
