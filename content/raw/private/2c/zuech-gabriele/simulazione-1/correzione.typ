// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/zuech-gabriele/simulazione-1/correzione.typ /tmp/zuech-gabriele.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Gabriele Zuech", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Gabriele Zuech",
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
#commento[Il ciclo usa `range(0, len(l) + 1, 2)` e arriva a `l[len(l)]`, che non esiste; ad esempio, con la lista `[1, 2, 3, 4, 5, 6]` vai in `IndexError`. Fermati a `len(l)` escluso.]

#risposta(category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[L'idea di estendere la lista e rimuovere la prima metà non funziona: rimuovendo elementi durante il ciclo gli indici cambiano e ottieni una lista sbagliata. Meglio scambiare gli estremi, oppure rimuovere sempre e solo il primo elemento nel secondo ciclo (ad esempi con `l.pop(0)`)]

#risposta(category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 16, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento(
  "Ottimo! Apprezzo in particolar modo che hai usato il metodo che confronta gli estremi, senza invertire la lista. Unica cosa: l'ultimo if è inutile!",
)

#risposta(category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, score: 9, diff: 3)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[La ricerca del massimo c'è, ma poi rimuovi il valore e stampi o, che non è mai stato aggiornato. Ti sei un po' complicato la vita. Sarebbe stato molto più facile usare un if nel secondo ciclo, così da controllare *solo* i valori *diversi* dal massimo trovato nel primo ciclo]

#risposta(none, category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
