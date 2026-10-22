// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1c/larcher-diego/simulazione-1/correzione.typ /tmp/larcher-diego.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Diego Larcher", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Diego Larcher",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 5.5)[
  #raw(read("le-tue-risposte/domanda1.txt"), block: true, lang: "text")
]
#commento[Cinque componenti con scopi chiari. Occhio però: la memoria da sola è troppo generica, meglio distinguere RAM e disco; inoltre dire che la GPU "fa girare le immagini" è un po' troppo vago.]

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 1.5)[
  #raw(read("le-tue-risposte/domanda2.txt"), block: true, lang: "text")
]
#commento[La memoria è dove i dati vengono conservati, ma non spieghi come: servono il codice binario e la codifica dei caratteri. Il comando leggi era una cosa inventata da noi per usarla nel giochino del robottino, ma quella parte lì l'abbiamo conclusa e archiviata quasi due mesi fa...]

#risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 1)[
  #raw(read("le-tue-risposte/domanda3.txt"), block: true, lang: "text")
]
#commento[Definizione molto confusa: un'istruzione è un'operazione elementare che la CPU esegue, rappresentata in binario. Non hai parlato dell'instruction set. Anche qui, il robot non c'entra.]

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 4, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento[Il programma stampa i numeri invece di contarli e l'incremento di `i` è dentro l'`if`: quando `i` diventa dispari il ciclo non avanza più, causando un loop infinito.]

#risposta(none, category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 3, diff: 2)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[La descrizione è troppo vaga: il codice stampa gli elementi della lista dal fondo all'inizio. Manca l'output, cioè `9, 1, 7, 3`.]

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 1, diff: 2)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento[Cosa vuol dire? La risposta non descrive lo scambio: `c` conserva il valore di `a`, poi `a` prende `b` e `b` riprende il vecchio `a`. L'output è `8 5`.]

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 4, diff: 2)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento[Penso che tu abbia capito, ma ciò che hai scritto non ha un significato. Cerca di curare la forma. Manca l'output, cioè `0, 2, 4, 6, 8, 10`.]

= Riepilogo dei punteggi

#griglia-correzione()
