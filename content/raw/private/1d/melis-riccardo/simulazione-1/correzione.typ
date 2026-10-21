// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1d/melis-riccardo/simulazione-1/correzione.typ /tmp/melis-riccardo.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Riccardo Melis", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Riccardo Melis",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1D · 20 ottobre 2026",
)

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(none, category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 0)

#v(1em)
#risposta(none, category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 0)

#v(1em)
#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

#v(1em)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 7, diff: 1)[
  #raw(read("le-tue-risposte/esrcizio1.py"), block: true, lang: "python")
]
#commento(
  "Hai provato a usare len, ma len(7) non funziona: len si usa con liste o stringhe. Se n e x fossero inizializzate correttamente il programma sarebbe quasi corretto (non conterebbe n ma è una sottigliezza)",
)

#v(1em)
#risposta(none, category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)

#v(1em)
#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

#v(1em)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#v(1em)
#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#v(1em)
#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

#v(1em)

= Riepilogo dei punteggi

#griglia-correzione()
