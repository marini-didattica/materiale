// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/dal-savio-daniele/prova-1/correzione.typ /tmp/dal-savio-daniele.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Daniele Dal Savio", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Daniele Dal Savio",
  title: "Correzione — Prova 1",
  subtitle: "Classe 2C · 29 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (70 punti)

#risposta(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 12, score: 3, diff: 2)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Il programma non è eseguibile: la riga `media` da sola genera un `NameError`, e `somma=((l[i]))` azzera la somma a ogni iterazione invece di accumularla. Calcola la somma nel ciclo e la media una sola volta alla fine.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 0, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Hai solo riportato il template.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 5, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[La condizione `l[i] <= l[i]+1` è sempre vera, quindi il programma stampa sempre `True`. Per controllare l'ordine devi confrontare ogni elemento con il precedente, cioè `l[i] < l[i-1]`. Occhio però agli indici!]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[La ricerca funziona, ma il messaggio non rispetta il formato richiesto: devi stampare `Trovato all'indice N` oppure `Non trovato` (con la maiuscola). Inoltre stampare il valore di `i` fuori dal ciclo funziona, però solo perché sei stato fortunato, visto che noi abbiamo sempre *inizializzato* le variabili prima di usarle. La variabile `i`, per buone pratiche, andrebbe usata solo all'interno del ciclo stesso.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 3, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[L'idea del confronto simmetrico c'è, ma gli indici sono fissi per una lista di 5 elementi: con `i = 1` arrivi a `l[5]` e vai in `IndexError`, e con liste di lunghezza diversa non funziona. Confronta `l[i]` con `l[len(l)-1-i]` per `i` che va da 0 a `len(l)//2`.]

= Lettura del codice (40 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 0, diff: 1)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 0, diff: 1)

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 3, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[L'output è giusto, ma la spiegazione è molto confusa: non si capisce quale sia il ruolo della variabile temporanea `t`.]

#risposta(category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 1, diff: 2)[
  #raw(read("le-tue-risposte/snippet4.txt"), block: true, lang: "text")
]
#commento[L'output è sbagliato: il programma calcola `3^4`, quindi stampa `81`, non `3`. La descrizione del ciclo è confusa.]

#risposta(category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 5, diff: 3)[
  #raw(read("le-tue-risposte/snippet5.txt"), block: true, lang: "text")
]
#commento[Giusto, però andrebbe approfondito meglio: mancano la spiegazione delle sottrazioni successive e il valore finale di `a` (`-3`).]

= Riepilogo dei punteggi

#griglia-correzione()
