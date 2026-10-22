// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1d/campi-gabriele/simulazione-1/correzione.typ /tmp/campi-gabriele.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Gabriele Campi", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Gabriele Campi",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1D · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 7)[
  #raw(read("le-tue-risposte/esercizio1.txt.txt"), block: true, lang: "text")
]
#commento[Bene, cinque componenti con scopi chiari. Qualche piccola imprecisione, ma comunque molto bene.]

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 5)[
  #raw(read("le-tue-risposte/esercizio2.txt.txt"), block: true, lang: "text")
]
#commento[Hai spiegato bene i caratteri. Mi sarebbe piaciuto vedere un accenno alle tabelle ASCII; andrebbe aggiunto come si salvano i numeri (in base 2).]

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 6, diff: 1)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[La logica è giusta, però non fa ciò che chiede la consegna. Qui stai contando i numeri pari contenuti in una lista; la consegna chiedeva di contare i numeri pari contenuti fra `0` e `n`!]

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 12, diff: 2)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Come nell'esercizio precedente, la logica è giusta ma non fa ciò che chiede la consegna. Qui stai sommando i numeri contenuti in una lista; la consegna chiedeva di sommare i numeri fra 0 e n!]

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 30, diff: 3)[
  #raw(read("le-tue-risposte/esercizio6.py"), block: true, lang: "python")
]
#commento[Quasi perfetto. Fai caso però che nella consegna ho esplicitamente detto che NON è detto che `a < b`. Quindi nel caso in cui `a > b` dovresti invertire il valore delle variabili. Siccome sei stato l'unico che è riuscito ad arrivare alla logica ti meriti indubbiamente punteggio pieno!]

= Lettura del codice (30 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/esercizio7.txt.txt"), block: true, lang: "text")
]
#commento[Perfetto, spiegazione e output corretti!]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 3, diff: 2)[
  #raw(read("le-tue-risposte/esercizio8.txt.txt"), block: true, lang: "text")
]
#commento[Quasi: l'output giusto è `8 5`, non `8 8`. Di fatto stai solo scambiando i valori di `a` e `b`.]

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
