// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root . content/raw/private/2c/filippi-renato/prova-1/correzione.typ /tmp/filippi-renato.pdf

#import "/typst-theme/src/lib.typ": theme
#import "/typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Prova 1 — Renato Filippi", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Prova 1")

#intestazione-correzione(
  "Renato Filippi",
  title: "Correzione — Prova 1",
  subtitle: "Classe 2C · 29 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (70 punti)

#risposta(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 12, score: 9, diff: 2)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[La somma è corretta, ma la media usa `i+1` dove `i` è l'indice dell'ultima iterazione: funziona solo perché il `for` termina con `i = len(l)-1`. Con la lista vuota `i` non esiste e il programma va in errore. Usa direttamente `len(l)`.]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, score: 10, diff: 3)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Il controllo funziona per l'esempio (con `a = 10` e `b = 1`), ma non gestisci il caso `a < b`: la condizione `a >= l[i] and b <= l[i]` va bene solo se `a` è il limite superiore. Prima di controllare, scambia `a` e `b` se necessario. Inoltre occhio che dentro all'if sovrascrivi il valore False, quindi anche se hai già trovato un valore fuori, poi sovrascrivi il suo valore appena ne trovi un'altro che è incluso nel range. Dovresti interrompere l'iterazione appena trovi un elemento che viola la condizione di inclusione.]

#risposta(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, score: 3, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Il ciclo non controlla l'ordine: l'unica iterazione che fa qualcosa è quella con `i == 0`, e confronta `l[0]` con `l[-1]` (l'ultimo elemento, tramite indice negativo, cosa valida ma che noi non abbiamo visto), non con il precedente. Per tutte le restanti iterazioni non viene fatto nulla.]

#risposta(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[La ricerca c'è, ma stampi un messaggio per ogni elemento e non ti fermi alla prima occorrenza; inoltre il formato non è quello richiesto. Usa `break` e stampa una sola volta `Trovato all'indice N` oppure `Non trovato`.]

#risposta(none, category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, score: 0, diff: 2)

= Lettura del codice (40 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 8, score: 5, diff: 1)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[La spiegazione del ciclo è corretta, ma non riporti l'output: manca l'elenco `10`, `-4`, `0`, `8`. Mi sarebbe bastato "il programma stampa i numeri pari della lista in ordine inverso"]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 8, score: 5, diff: 1)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Corretto: spieghi che il programma cerca almeno un numero negativo e stampa un booleano. Manca però l'output esplicito (`True`).]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 8, score: 6, diff: 1)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Corretto: descrivi lo scambio tramite `t`; manca solo l'output esplicito (`8 3`).]

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 8, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 8, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
