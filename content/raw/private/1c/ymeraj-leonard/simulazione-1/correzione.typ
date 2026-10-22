// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1c/ymeraj-leonard/simulazione-1/correzione.typ /tmp/ymeraj-leonard.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Leonard Ymeraj", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Leonard Ymeraj",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(none, category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 0)

#risposta(none, category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 0)

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 1, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[La condizione del `while x == x % 2 == 0` non fa sicuramente ciò che ti aspettavi. Mi raccomando, non bisogna MAI inventarsi sintassi nuova da zero. I programmi sono sempre combinazioni di blocchi di costruzioni che abbiamo visto insieme.]

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Mancava davvero poco: bastava incrementare `i` all'interno del ciclo e stampare la somma fuori. La variabile somma andrebbe aggiornata con `somma = somma + i` (nota `i` invece che `1`).]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[Hai consegnato il codice dello snippet 2 (lo scambio di `a` e `b`), non la soluzione dell'esercizio. La consegna chiedeva di verificare che tutti gli elementi della lista fossero nell'intervallo.]

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
