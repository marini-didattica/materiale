// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1c/fantelli-federico/simulazione-1/correzione.typ /tmp/fantelli-federico.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Federico Fantelli", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Federico Fantelli",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 7)[
  #raw(read("le-tue-risposte/domanda1.txt"), block: true, lang: "text")
]
#commento(
  "Ottimo",
)

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 7.5)[
  #raw(read("le-tue-risposte/domanda2.txt"), block: true, lang: "text")
]
#commento(
  "Molto bene: base 2 per i numeri e ASCII per i caratteri. Cura l'ortografia (ASCII, non aschii) e specifica meglio il fatto che ogni stringa di bit corrisponde ad un carattere (e che sono proprio le tabelle ASCII a definire questa corrispondenza).",
)

#risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 5)[
  #raw(read("le-tue-risposte/domanda3.txt"), block: true, lang: "text")
]
#commento(
  "Risposta convincente: istruzione tradotta in binario e instruction set come insieme condiviso di istruzioni. Manca solo un accenno esplicito all'assembly.",
)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 8, diff: 1)[
  #raw(read("le-tue-risposte/esercizio1.py"), block: true, lang: "python")
]
#commento(
  "La logica di base è giusta, ci sono solo un paio di sviste. Innanzitutto hai dimenticato `print(count)`, quindi stampi erroneamente tutti i numeri, ma questo non è grave. Ciò che invece è grave è l'incremento doppio di count, dentro all'if: così facendo salti dei numeri",
)

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento(
  "Il file è incompleto (if senza condizione): il programma non può funzionare. La struttura del ciclo è impostata, ma manca il corpo che accumula la somma.",
)

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento(
  "Si capisce che hai compreso. Occhio solo alla terminologia: quando si parla di ordine descrescente si fa riferimento al valore degli elementi (che appunto cresce o descresce); in questo caso sarebbe stato più appropriato parlare di ordine inverso o \"da destra a sinistra\"",
)

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/snippet2.txt"), block: true, lang: "text")
]
#commento(
  "Perfetto: lo scambio tramite c è spiegato e l'output è corretto.",
)

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/snippet3.txt"), block: true, lang: "text")
]
#commento(
  "Bene: hai riconosciuto i pari e riportato l'output. Piccola imprecisione: il ciclo parte da i = 0, non da 1.",
)

= Riepilogo dei punteggi

#griglia-correzione()
