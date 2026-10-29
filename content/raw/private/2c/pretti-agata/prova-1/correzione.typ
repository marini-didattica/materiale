// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/pretti-agata/prova-1/correzione.typ /tmp/pretti-agata.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Agata Pretti", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Agata Pretti",
  title: "Correzione — Prova 1",
  subtitle: "Classe 2C · 29 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (70 punti)

#risposta(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 12, score: 0, diff: 2)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Hai solo inizializzato la lista: manca tutto il calcolo della media e la stampa.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 8, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Il controllo dell'intervallo è concettualmente giusto, ma il risultato viene sovrascritto a ogni iterazione (senza `break`), quindi può tornare `True` dopo un elemento fuori intervallo; inoltre stampi `nell'intervallo`/`non nell'intervallo` invece di `True`/`False`, e non gestisci correttamente il caso in cui `a < b`. In quest'ultimo caso andrebbero invertite le variabili. Manca anche la gestione della lista vuota.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 2, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Il confronto è sbagliato: `l[i] <= i-1` confronta un elemento con un indice, non con l'elemento precedente. Inoltre stampi un messaggio per ogni elemento. Devi confrontare `l[i]` con `l[i-1]` e stampare un unico `True`/`False`.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 9, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[Corretto. Piccola sottigliezza: il messaggio non rispetta il formato richiesto: `trovato all'indice` è minuscolo e manca la maiuscola in `Non trovato`.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 0, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Il codice non è eseguibile: `d = len(l)//2, -1` crea una tupla (struttura dati che non abbiamo visto) e `len(s)` chiama `len` su un intero. Manca completamente il confronto tra le coppie simmetriche.]

= Lettura del codice (40 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 0, diff: 1)

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 4, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.py"), block: true, lang: "text")
]
#commento[Hai ricopiato il codice con qualche commento, ma non hai spiegato a parole cosa fa il programma né riportato l'output (`True`). Inoltre il file dovrebbe essere `snippet2.txt`, non `.py`.]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 4, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.py"), block: true, lang: "text")
]
#commento[Hai ricopiato il codice con i commenti, ma non hai spiegato cosa fa il programma né riportato l'output (`8 3`). Inoltre il file dovrebbe essere `snippet3.txt`, non `.py`.]

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
