// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root . content/raw/private/1c/zaninetti-sara/simulazione-1/correzione.typ /tmp/zaninetti-sara.pdf

#import "/typst-theme/src/lib.typ": theme
#import "/typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Sara Zaninetti", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Sara Zaninetti",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 3)[
  #raw(read("le-tue-risposte/domanda1.txt"), block: true, lang: "text")
]
#commento[Hai elencato quattro componenti, ma senza descriverne lo scopo e con qualche sovrapposizione (CPU e processore sono la stessa cosa). Mancano RAM e GPU.]

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 6)[
  #raw(read("le-tue-risposte/domanda2.txt"), block: true, lang: "text")
]
#commento[Bene: l'unica cosa che manca è il riferimento alla codifica in base 2 per i numeri e alla tabella ASCII per i caratteri.]

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

= Scrittura del codice (60 punti)

#risposta(none, category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 0, diff: 1)

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 20, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Perfetto: corretto e idiomatico.]

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/snippet.txt"), block: true, lang: "text")
]
#commento[Perfetto.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 8, diff: 2)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Bene, però avresti dovuto spiegare a parole cosa fa il codice, non solo riportare l'output. "Il codice inverte il valore delle variabili `a` e `b`" sarebbe stato sufficiente.]

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
