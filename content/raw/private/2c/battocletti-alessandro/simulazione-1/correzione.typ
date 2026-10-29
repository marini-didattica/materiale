// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root . content/raw/private/2c/battocletti-alessandro/simulazione-1/correzione.typ /tmp/battocletti-alessandro.pdf

#import "/typst-theme/src/lib.typ": theme
#import "/typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Alessandro Battocletti", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Alessandro Battocletti",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 2C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (80 punti)

#risposta(category: "E", tag: "Esercizio", title: [Posizioni alternate], points: 12, score: 12, diff: 1)[
  #raw(read("le-tue-risposte/es1.py"), block: true, lang: "python")
]
#commento[Corretto: scorri la lista a passi di 2 e stampi solo gli elementi nelle posizioni pari. Il controllo sulla lista vuota non serve, ma non fa male.]

#risposta(none, category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 0, diff: 2)

#risposta(category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 16, diff: 2)[
  #raw(read("le-tue-risposte/es3.pyt"), block: true, lang: "python")
]
#commento[Corretto: costruisci la lista invertita e la confronti con l'originale. Attenzione al nome del file: l'estensione deve essere `.py`, non `.pyt`.]

#risposta(category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, score: 3, diff: 3)[
  #raw(read("le-tue-risposte/es2.py"), block: true, lang: "python")
]
#commento[L'idea di cercare il secondo massimo c'è, ma il codice non è eseguibile: `max2 = maxmax = i` usa una variabile inesistente, `if max2 < i < max` non ha corpo e `print(max2)()` non è valido. Inoltre hai chiamato il file `es2.py` mentre questo è l'esercizio 4.]

#risposta(none, category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
