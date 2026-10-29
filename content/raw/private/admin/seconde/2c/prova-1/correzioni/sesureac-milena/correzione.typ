// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root . content/raw/private/2c/sesureac-milena/prova-1/correzione.typ /tmp/sesureac-milena.pdf

#import "/typst-theme/src/lib.typ": theme
#import "/typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Milena Sesureac", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Milena Sesureac",
  title: "Correzione — Prova 1",
  subtitle: "Classe 2C · 29 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (70 punti)

#risposta(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 18, score: 16, diff: 2)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Corretto: sommi gli elementi e calcoli la media. Manca la gestione della lista vuota: con `l = []` la media non viene mai calcolata e il `print(media)` genera un `NameError`.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 20, score: 5, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Il controllo è sbagliato: `a > i > b` confronta l'*indice* `i` con `a` e `b`, non l'elemento `l[i]`. Con `a = 1` e `b = 10` la condizione è sempre falsa e il programma stampa `True` per ogni elemento. Devi controllare `l[i]` e stampare una sola volta.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 15, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[La ricerca funziona, ma stampi il valore `a` (cioè `8`) invece di `Trovato all'indice N`; inoltre non ti fermi alla prima occorrenza (anche se con questa lista non cambia nulla) e con la lista vuota non stampi `Non trovato`.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 23, score: 1, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Il codice non verifica se la lista è palindroma: scambia alcuni elementi con il centro e poi controlla `d == 2`, che non significa nulla. Servono due indici che partono dagli estremi e si avvicinano.]

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 12, score: 3, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[La risposta è sbagliata: il programma non stampa gli elementi in posizione pari, ma gli elementi pari contenuti nella lista in ordine invertito (da destra a sinistra). L'output è `10`, `-4`, `0`, `8`.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 12, score: 3, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Il programma non stampa gli elementi negativi, ma `True`/`False` a seconda che esista almeno un negativo. L'output è `True`.]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 10, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Corretto: descrivi bene lo scambio tramite `t` e riporti l'output `8, 3`.]


= Riepilogo dei punteggi

#griglia-correzione()
