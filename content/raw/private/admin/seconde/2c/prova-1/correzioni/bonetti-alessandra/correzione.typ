// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/bonetti-alessandra/prova-1/correzione.typ /tmp/bonetti-alessandra.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Alessandra Bonetti", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Alessandra Bonetti",
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
#commento[La somma e la media sono corrette. Manca però la gestione della lista vuota: con `l = []` la divisione per `len(l)` provoca `ZeroDivisionError`. Inoltre `i += 1` dentro il `for` è inutile, perché `i` viene già gestito da `range`.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 8, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[L'idea è giusta, ma il programma stampa un valore per ogni elemento invece di un unico `True`/`False`. Dovresti usare, ad esempio, una variabile `tutti = True`, scorrerla e stampare una sola volta alla fine; inoltre non scambia `a` e `b` quando `a < b`, e con la lista vuota non stampa nulla (dovrebbe stampare `True`).]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 0, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Il file è incompleto: `if l[i]` non ha né condizione né corpo, quindi il programma non parte. Il confronto va fatto tra `l[i]` e `l[i-1]`, aggiornando una variabile `ordinata`.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 5, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[La ricerca c'è, ma stampi un messaggio per ogni elemento e non ti fermi alla prima occorrenza: per la lista di esempio otterresti più righe. Devi usare `break` e stampare `Trovato all'indice N` una sola volta, oppure `Non trovato`.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 5, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Il confronto simmetrico è l'idea giusta, ma il codice non è eseguibile: `len[i]` non è valido (le parentesi di `len` sono tonde) e `range(len())` chiama `len` senza argomento. Servono due indici, uno da sinistra e uno da destra, oppure una lista invertita.]

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[Corretto: il ciclo parte dal fondo e stampa solo gli elementi pari; l'output è `10`, `-4`, `0`, `8`.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 4, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Corretto: il programma verifica se esiste almeno un numero negativo e stampa `True`. La spiegazione è un po' imprecisa nella forma, per questo si fa fatica a capire se tu abbia effettivamente capito. Mi sarebbe bastato "questo frammeto controlla se la lista contiene almeno un numero negativo".]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Corretto: lo scambio tramite variabile temporanea è descritto bene e l'output è `8 3`.]

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 0, diff: 2)

#risposta(category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 3, diff: 3)[
  #raw(read("le-tue-risposte/snippet5.txt"), block: true, lang: "text")
]
#commento[L'output è giusto, ma la spiegazione del ciclo non è corretta: `quoziente` non assume il valore di `a - b`, viene incrementato di uno a ogni sottrazione. Il programma conta quante volte `b` sta in `a`, ossia effettua una divisoine intera arrotondata per difetto.]

= Riepilogo dei punteggi

#griglia-correzione()
