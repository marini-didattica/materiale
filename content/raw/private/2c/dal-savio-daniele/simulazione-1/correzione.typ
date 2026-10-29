// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root . content/raw/private/2c/dal-savio-daniele/simulazione-1/correzione.typ /tmp/dal-savio-daniele.pdf

#import "/typst-theme/src/lib.typ": theme
#import "/typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Daniele Dal Savio", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Daniele Dal Savio",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 2C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Produzione del codice (80 punti)

#risposta(category: "E", tag: "Esercizio", title: [Posizioni alternate], points: 12, score: 12, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Va bene! Una sottigliezza: la consegna chiedeva di non stampare nulla nel caso in cui vi fosse una lista vuota. Per queste piccole cose però non vi penalizzo, quindi il punteggio è pieno.]

#risposta(none, category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 0, diff: 2)

#risposta(none, category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 0, diff: 2)

#risposta(category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, score: 14, diff: 3)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[Ci sei molto vicino. Il secondo ciclo però andrebbe messo fuori dal primo; la logica è la seguente: prima calcoli il massimo globale, poi ricalcoli il massimo, considerando solo gli elementi DIVERSI dal massimo globale. Il secondo massimo trovato è la risposta all'esercizio.]

#risposta(category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, score: 18, diff: 3)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[La logica è corretta. Occhio che la consegna chiedeva di filtrare `l`. Quindi `l` alla fine del programma dovrebbe contenere solo i valori positivi, mentre qui contiene ancora tutti i valori che conteneva in origine. Per ora non mi soffermo su questi aspetti "marginali", ma più andremo avanti più diventeranno importanti.]

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
