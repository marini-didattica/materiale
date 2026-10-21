// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1d/angeli-lorenzo/simulazione-1/correzione.typ /tmp/angeli-lorenzo.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Lorenzo Angeli", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Lorenzo Angeli",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1D · 20 ottobre 2026",
)

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 5)[
  #raw(
    "Domanda 1
    RAM: memoria a breve termine del computer e serve per azioni momentanee che non devono essere salvate
    Disco rigido: memoria a lungo termine del computer 
    Processore/CPU: esegue tutti i calcoli
    Ventole:servono per nonfar surriscaldare il computer",
    block: true,
    lang: "text",
  )
]
#commento(
  "Bene, hai citato RAM, disco, CPU e ventole. Prova ad aggiungere una quinta componente e a dire in una frase a cosa serve.",
)

#v(1em)
#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 5)[
  #raw(
    "DOMANDA 2
    Vengono immagazzinati con una serie di 0 e 1 e i ogni serie di 0 e 1 vuol dire una lettera/parola",
    block: true,
    lang: "text",
  )
]
#commento(
  "L'idea del binario c'è, prova a distinguere meglio numeri e caratteri: i numeri si salvano in base 2, i caratteri con una codifica (tipo ASCII).",
)

#v(1em)
#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

#v(1em)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 4, diff: 1)[
  #raw(read("le-tue-risposte/es1.py"), block: true, lang: "python")
]
#commento(
  "Qui l'idea dei pari c'è, ma il programma stampa i numeri invece di contarli. Inoltre l'incremento di i è fuori dal ciclo: l'applicazione va il loop infinito",
)

#v(1em)
#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 14, diff: 2)[
  #raw(read("le-tue-risposte/es2.py"), block: true, lang: "python")
]
#commento(
  "Hai impostato la somma, ma manca l'incremento di i e la stampa finale. Siccome manca l'incremento, il ciclo va in loop infinito.",
)

#v(1em)
#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 5, diff: 3)[
  #raw(read("le-tue-risposte/es3.py"), block: true, lang: "python")
]
#commento(
  "Stai provando a confrontare una lista (l) con un intero (1, b). Questo non è valido in python. Manca anche l'idea di base, scorrere la lista e verificare che l'elemento corrente sia nel range.",
)

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
