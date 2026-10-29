// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/zambelli-giovanni/prova-1/correzione.typ /tmp/zambelli-giovanni.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Giovanni Zambelli", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Giovanni Zambelli",
  title: "Correzione — Prova 1",
  subtitle: "Classe 2C · 29 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (70 punti)

#risposta(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 12, score: 5, diff: 2)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[La somma è corretta, ma la media divide per `i`, che dopo il ciclo vale `len(l)-1`: per una lista di 13 elementi dividi per 12. Devi usare `len(l)`. Manca anche la gestione della lista vuota.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 10, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Il controllo è corretto per una lista i cui elementi sono tutti nell'intervallo, ma non gestisce il caso di un elemento fuori: `c` viene messo a `True` quando un elemento è dentro e non viene mai riportato a `False`. Serve `c = False` appena trovi un elemento fuori, oppure un `break`.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 2, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Il codice parte male: alla prima iterazione `i == 0`, la condizione è falsa e l'`else` mette subito `c = False` con `break`, quindi per una lista ordinata stampa `False`. Devi saltare il primo elemento e confrontare `l[i]` con `l[i-1]`.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 7, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[La ricerca è corretta e ti fermi alla prima occorrenza, ma stampi `True 4` invece di `Trovato all'indice 4`. Devi comporre il messaggio richiesto.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 2, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Il confronto è sbagliato: `l[i] == l[i+i]` non confronta gli estremi simmetrici (per `i = 1` confronta `l[1]` con `l[2]`, non con il penultimo). Inoltre il conteggio `c` e il controllo `c == i+1` non funzionano. Usa `l[i]` e `l[len(l)-1-i]`.]

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi il ciclo al contrario e riporti l'output giusto.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 1, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[La risposta è sbagliata: il programma non controlla se la lista è tutta negativa o mista, ma se esiste almeno un numero negativo. L'output è `True`, non `False`.]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 7, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Corretto: descrivi lo scambio tramite `t` e riporti `8,3`.]

#risposta(category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 8, diff: 2)[
  #raw(read("le-tue-risposte/snippet4.txt"), block: true, lang: "text")
]
#commento[Corretto: il programma calcola `a^b = 81`.]

#risposta(category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 7, diff: 3)[
  #raw(read("le-tue-risposte/snippet5.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi le sottrazioni successive e riporti `3`. La frase “toglie tutti i multipli di b” è imprecisa: sottrae `b` finché `a` non diventa negativo.]

= Riepilogo dei punteggi

#griglia-correzione()
