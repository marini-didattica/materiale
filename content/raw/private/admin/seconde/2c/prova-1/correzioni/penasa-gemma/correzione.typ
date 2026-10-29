// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/penasa-gemma/prova-1/correzione.typ /tmp/penasa-gemma.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Gemma Penasa", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Gemma Penasa",
  title: "Correzione — Prova 1",
  subtitle: "Classe 2C · 29 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (70 punti)

#risposta(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 12, score: 12, diff: 2)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Corretto: sommi gli elementi e calcoli la media, gestendo anche la lista vuota. La media può essere calcolata una sola volta dopo il ciclo, ma funziona.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 16, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Corretto: scambi `a` e `b` quando serve, controlli tutti gli elementi e ti fermi al primo fuori intervallo. Funziona anche con lista vuota.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Corretto per una lista non vuota: tieni traccia del massimo visto finora e segnali quando un elemento è minore. Con la lista vuota però `l[0]` genera un `IndexError`; la consegna chiede `True` per la lista vuota.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 5, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[Il file è incompleto: manca la stampa finale e la ricerca non si ferma alla prima occorrenza. Inoltre hai scritto `ntrovato` nella prima riga e poi `trovato`, probabilmente però è solo un errore di battitura. L'idea è giusta, ma incompleta.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 1, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Il file è incompleto: l'`if` non ha né condizione né corpo, quindi il programma non parte. L'idea di costruire la lista invertita è giusta, ma va completata.]

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 2, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[La spiegazione è confusa e l'output è vuoto. Il programma stampa gli elementi pari partendo dal fondo: `10`, `-4`, `0`, `8`.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 7, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi il controllo dei negativi e riporti `True`. Occhio alla forma, sarebbe stato meglio "scorre la lista determinando se questa contiene *almeno un numero negativo*"]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 7, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Corretto: descrivi lo scambio e riporti `8 3`. Manca un accenno al fatto che `t` serve a non perdere il valore di `a`.]

#risposta(category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 8, diff: 2)[
  #raw(read("le-tue-risposte/snippet4.txt"), block: true, lang: "text")
]
#commento[Corretto: il programma calcola `a^b`, quindi `81`.]

#risposta(category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 8, diff: 3)[
  #raw(read("le-tue-risposte/snippet5.txt"), block: true, lang: "text")
]
#commento[Corretto.]

= Riepilogo dei punteggi

#griglia-correzione()
