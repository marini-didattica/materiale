// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/visintainer-filippo/prova-1/correzione.typ /tmp/visintainer-filippo.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Filippo Visintainer", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Filippo Visintainer",
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
#commento[Perfetto, corretto e idiomatico: sommi gli elementi, conti quanti sono e calcoli la media, gestendo anche la lista vuota.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 12, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Il controllo degli elementi è corretto. Manca però lo scambio di `a` e `b` quando `a > b`: con i valori del template (`a = 2`, `b = 14`) funziona, ma con gli estremi invertiti no.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 6, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Penso che si tratti di una svista. Se ti fossi ricordato di aggiornare il valore di max ad ogni iterazione, aggiungendo un break dentro l'if avresti ottenuto un programma funzionante. Così però non funziona affatto, siccome `max` non è nemmeno inizializzato.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 10, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[La ricerca della prima occorrenza è corretta, ma manca il caso `Non trovato`: se il valore non c'è, il programma non stampa nulla. Aggiungi l'`else` con `print("Non trovato")`.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 18, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Corretto: usi lo slicing `l[::-1]` per confrontare la lista con la sua inversa. Funziona anche con lista vuota e con un solo elemento.]

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 6, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[La spiegazione è buona, ma l'ordine dell'output è sbagliato: il ciclo parte dal fondo, quindi stampa `10`, `-4`, `0`, `8`.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 6, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Corretto però occhio che ho chiesto una spiegazione generale; mi sarebbe bastato che mi dicessi "il programma stampa True se la lista contiene almeno un numero negativo, False altrimenti".]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 6, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[L'output è giusto (`8 3`), ma la spiegazione è confusa: non è chiaro cosa succede alla variabile `t` e perché serve. Mi sarei aspettato "il programma scambia i valori delle variabili `a` e `b`, usando `t` come appoggio per non perdere il valore di `a`"]

#risposta(category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 2, diff: 2)[
  #raw(read("le-tue-risposte/snippet4.txt"), block: true, lang: "text")
]
#commento[L'output è sbagliato: il programma moltiplica `risultato` per `a` a ogni iterazione, quindi calcola `3^4 = 81`, non `12`. La descrizione del ciclo è imprecisa.]

#risposta(category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 2, diff: 3)[
  #raw(read("le-tue-risposte/snippet5.txt"), block: true, lang: "text")
]
#commento[La spiegazione è corretta, ma anche qui non volevo che spiegaste riga per riga. Mi serviva il concetto generale. In questo caso il programma effettua una divisione intera . Manca anche un accenno al valore finale di `a` (`-3`).]

= Riepilogo dei punteggi

#griglia-correzione()
