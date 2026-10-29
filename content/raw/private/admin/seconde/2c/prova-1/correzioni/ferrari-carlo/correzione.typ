// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root . content/raw/private/2c/ferrari-carlo/prova-1/correzione.typ /tmp/ferrari-carlo.pdf

#import "/typst-theme/src/lib.typ": theme
#import "/typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Carlo Ferrari", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Carlo Ferrari",
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
#commento[Corretto: sommi e conti gli elementi, poi calcoli la media. Attenzione al caso vuoto: controlli `media == 0` invece di `len(l) == 0`, quindi una lista non vuota con somma zero (ad esempio `[0, 0]`) stampa `"0"` invece di `0.0`. Piccolissima sottigliezza.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 16, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Perfetto, corretto e idiomatico. L'`else` che rimette `valori = True` è superfluo ma innocuo.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 12, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Corretto: confronti ogni elemento con il precedente e gestisci anche lista vuota e lista con un solo elemento. L'uso di `a` come “elemento precedente” è chiaro.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 9, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[La ricerca della prima occorrenza è corretta. Piccola sottigliezza: il messaggio che stampi non è esattamente quello richiesto dalla consegna: devi stampare `Trovato all'indice N` (con la maiuscola) oppure `Non trovato`; qui stampi `il numero 8 e stato trovato a indice 1`.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 14, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Il programma funziona, ma in modo molto contorto: `a = i-(i+1+i)` equivale sempre a `-i-1`, quindi stai confrontando `l[i]` con `l[-i-1]`. È corretto, ma il blocco iniziale `if l != []` è inutile e la condizione è invertita rispetto all'idea. Semplifica usando direttamente `l[i] != l[len(l)-1-i]`. Inoltre noi non abbiamo visto accesso a lista con indici negativi (che in realtà è valido in python), quindi il fatto che funzioni probabilmente è dovuto in parte alla fortuna.]

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 5, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[Hai capito il funzionamento, ma l'ordine dell'output è sbagliato: il ciclo parte dall'ultimo elemento, quindi stampa `10`, `-4`, `0`, `8`, non `8, 0, -4, 10`.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 6, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Corretto: il programma controlla se esiste almeno un negativo e stampa `True`. Cura un po' la forma della spiegazione, perché non si capisce bene se tu abbia effettivamente capito.]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Corretto: descrivi bene lo scambio tramite `t` e riporti l'output.]

#risposta(category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 8, diff: 2)[
  #raw(read("le-tue-risposte/snippet4.txt"), block: true, lang: "text")
]
#commento[Corretto: il ciclo moltiplica `risultato` per `a` esattamente `b` volte, quindi calcola `3^4 = 81`.]

#risposta(category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 4, diff: 3)[
  #raw(read("le-tue-risposte/snippet5.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi le sottrazioni successive, il valore finale di `a` (`-3`) e l'output `3`. Mi sarebbe piaciuto vedere un semplice "il programma esegue una divisione intera".]

= Riepilogo dei punteggi

#griglia-correzione()
