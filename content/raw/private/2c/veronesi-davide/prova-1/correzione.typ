// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/veronesi-davide/prova-1/correzione.typ /tmp/veronesi-davide.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Davide Veronesi", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Davide Veronesi",
  title: "Correzione — Prova 1",
  subtitle: "Classe 2C · 29 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (70 punti)

#risposta(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 12, score: 2, diff: 2)[
  #raw(read("le-tue-risposte/esercizio 1.py"), block: true, lang: "python")
]
#commento[Il programma non calcola la media: somma 1 a `s` per ogni elemento, calcola `len(l)/s` senza usare il risultato e stampa l'indice finale. Servono la somma degli elementi e la divisione per `len(l)`.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 0, diff: 3)[
  #raw(read("le-tue-risposte/esercizio 2.py"), block: true, lang: "python")
]
#commento[Il codice non controlla gli elementi della lista: confronta `len(l)` con `a` e `b`, e `c == True` è un confronto, non un'assegnazione. Inoltre non stampa nulla. Devi scorrere `l[i]` e stampare un unico `True`/`False`.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 0, diff: 2)[
  #raw(read("le-tue-risposte/esercizio 3.py"), block: true, lang: "python")
]
#commento[Il codice confronta la *lunghezza* della lista con i suoi elementi (`len(l) < l[i]`), non controlla l'ordine; inoltre `c == True` è un confronto e la stampa è dentro l'`if`. Per la lista di esempio non stampa nulla. Questo codice stampa `True` ogni volta che si incontra un elemento maggiore della lunghezza stessa della lista]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 4, diff: 1)[
  #raw(read("le-tue-risposte/esercizio 4.py"), block: true, lang: "python")
]
#commento[Il programma non cerca `a` nella lista: confronta `len(l)` con `a` e stampa sempre `Non trovato`; inoltre `n` non viene mai incrementato (`n = +1` assegna 1, in più è fuori dal ciclo), quindi il ciclo è infinito. Devi scorrere gli elementi e confrontare `l[i] == a`.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 0, diff: 2)[
  #raw(read("le-tue-risposte/esercizio 5.py"), block: true, lang: "python")
]
#commento[Il codice non è eseguibile: `min(len(l))` e `max(len(l))` chiamano `min`/`max` su un intero, e `c == True` è un confronto. Manca il confronto tra le coppie simmetriche.]

= Lettura del codice (40 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 0, diff: 1)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 0, diff: 1)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 0, diff: 1)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
