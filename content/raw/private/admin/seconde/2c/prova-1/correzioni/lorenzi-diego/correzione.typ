// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root . content/raw/private/2c/lorenzi-diego/prova-1/correzione.typ /tmp/lorenzi-diego.pdf

#import "/typst-theme/src/lib.typ": theme
#import "/typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Diego Lorenzi", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Diego Lorenzi",
  title: "Correzione — Prova 1",
  subtitle: "Classe 2C · 29 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (70 punti)

#risposta(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 12, score: 3, diff: 2)[
  #raw(read("le-tue-risposte/es1.py"), block: true, lang: "python")
]
#commento[Il programma non calcola la media: sommi gli *indici* (`somma = somma + i`) invece degli elementi, e poi dividi per `l[i]`, che è un valore della lista e può anche essere zero. Servono `somma = somma + l[i]` e `media = somma / len(l)`, con il controllo sulla lista vuota.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 8, diff: 3)[
  #raw(read("le-tue-risposte/es2.py"), block: true, lang: "python")
]
#commento[L'idea è di controllare ogni elemento, ma stampi un `True`/`False` per ogni elemento invece di un unico risultato; inoltre la condizione `a > l[i] and b < l[i]` non gestisce il caso `a < b`, e il caso `l[i] == 0` non c'entra con l'intervallo. Imposta `compresi = True`, aggiornalo e stampa una sola volta.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 0, diff: 2)[
  #raw(read("le-tue-risposte/es3.py"), block: true, lang: "python")
]
#commento[Il codice non controlla la lista: confronta solo `b < i` con `b = 0` e `i = 1`, quindi stampa sempre `True`. Devi scorrere la lista e confrontare ogni elemento con il precedente.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 6, diff: 1)[
  #raw(read("le-tue-risposte/es4.py"), block: true, lang: "python")
]
#commento[La ricerca c'è, ma stampi “numero non trovato” per ogni elemento che precede quello cercato e non usi il formato richiesto. Devi fermarti alla prima occorrenza con `break` e stampare `Trovato all'indice N` oppure `Non trovato`.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 1, diff: 2)[
  #raw(read("le-tue-risposte/es5.py"), block: true, lang: "python")
]
#commento[Il file non è eseguibile: `if l[i], l[j] = l[j], l[i]:` non è sintassi valida. Inoltre il ciclo assegna solo `j` e non confronta nulla. Penso che tu faccia confusione con l'inversione in place, ma anche li lo scambio fra `l[i]` e `l[j]` deve avvenire dentro il ciclo.]

= Lettura del codice (40 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 0, diff: 1)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 0, diff: 1)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 0, diff: 1)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
