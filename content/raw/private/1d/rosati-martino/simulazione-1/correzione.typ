// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1d/rosati-martino/simulazione-1/correzione.typ /tmp/rosati-martino.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Martino Rosati", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Martino Rosati",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1D · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 5)[
  #raw(read("le-tue-risposte/domanda1.txt"), block: true, lang: "text")
]
#commento[La descrizione di memoria e disco è un po' vaga. Occhio che non è vero che la CPU è precisa e la GPU no. La differenza sta nel fatto che la prima esegue le istruzioni in maniera sequenziale (una alla volta) mentre la seconda può eseguirne molte in parallelo, ma non è più o meno precisa.]

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 3)[
  #raw(read("le-tue-risposte/domanda2.txt"), block: true, lang: "text")
]
#commento[Va bene, però dovresti spiegare come una stringa di bit rappresenta un numero o un carattere. Quindi sarebbe stato opportuno citare codifica in base 2 e tabelle ASCII.]

#risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 3)[
  #raw(read("le-tue-risposte/domanda3.txt"), block: true, lang: "text")
]
#commento[L'idea di istruzione c'è; prova a dire che è in binario e che l'instruction set è l'insieme delle istruzioni.]

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 2, diff: 1)[
  #raw(read("le-tue-risposte/es1.py"), block: true, lang: "python")
]
#commento[Hai provato a impostare le condizioni, ma usando sintassi che non abbiamo visto, che non fa ciò che ti aspetti. Inoltre l'applicazione deve funzionare per qualsiasi input, non puoi applicare la logica a mano sull'input specifico che vi ho dato.]

#risposta(none, category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
