// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1d/malanotti-stefano/simulazione-1/correzione.typ /tmp/malanotti-stefano.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Stefano Malanotti", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Stefano Malanotti",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1D · 20 ottobre 2026",
)

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 6)[
  #raw(read("le-tue-risposte/domanda01.txt"), block: true, lang: "text")
]
#commento(
  "Bene, cinque componenti con i loro ruoli. Occhio: è RAM, non CAM.",
)

#v(1em)
#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 7)[
  #raw(read("le-tue-risposte/domanda02.txt"), block: true, lang: "text")
]
#commento(
  "Buona l'idea di binario, byte e caratteri. Il top sarebbe citare anche codifica in base 2 e tabelle ASCII/Unicode per i caratteri.",
)

#v(1em)
#risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 3)[
  #raw(read("le-tue-risposte/domanda03.txt"), block: true, lang: "text")
]
#commento(
  "L'idea di istruzione c'è; prova a definirla come comando in binario e a dire che l'instruction set è l'insieme delle istruzioni che il processore è in grado di eseguire. Ciò che descrivi è una visione più 'ad alto livello' di ciò che avviene. In questa domanda veniva richiesto il concetto di istruzione come stringa binaria letta da un processore",
)

#v(1em)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 10, diff: 1)[
  #raw(read("le-tue-risposte/esercizio01.py"), block: true, lang: "python")
]
#commento(
  "Perfetto. Occhio sempre al solito discorso: tendi a trovare soluzioni funzionanti ma più complesse di quanto richiesto!",
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
