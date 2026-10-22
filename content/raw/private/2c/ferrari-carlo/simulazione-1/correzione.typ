// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/2c/ferrari-carlo/simulazione-1/correzione.typ /tmp/ferrari-carlo.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Carlo Ferrari", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Carlo Ferrari",
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
#commento(
  "Corretto e idiomatico. Aggiungere gli elementi alla lista in questo esercizio non è molto utile ma va bene comunque!",
)

#risposta(category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 8, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Questo codice è estremamente esoterico. Capisco il tuo intento e di base non è sbagliato. Il problema è nel secondo ciclo: innanzitutto `c = c-1` non va bene in ogni caso. Poi devi stare attento al fatto che stai modificando una lista che sta cambiando (ad ogni iterazione rimuovi un elemento). L'`if` non serve visto che stai usando il for, quindi ci esci in automatico quando `c == len(l)`]

#risposta(category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 12, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento(
  "La logica di confronto è corretta, ma stampi anche l e m oltre al risultato richiesto.",
)

#risposta(category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, score: 10, diff: 3)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento(
  "Funziona con valori positivi distinti, ma non con duplicati né con numeri negativi: con [5, 5, 3] stampi 0 invece di 3, con [-3, -1, -7] stampi 0 invece di -3. Inizializza i massimi con un elemento della lista, non con 0.",
)

#risposta(category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, score: 8, diff: 3)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento(
  "Il filtro è impostato bene, ma il file contiene una riga incompleta (if l[i]) e non è eseguibile. Inoltre stampi l1 invece di modificare e stampare l.",
)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
