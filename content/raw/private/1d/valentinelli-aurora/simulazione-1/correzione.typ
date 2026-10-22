// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1d/valentinelli-aurora/simulazione-1/correzione.typ /tmp/valentinelli-aurora.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Aurora Valentinelli", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Aurora Valentinelli",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1D · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 2.5)[
  #raw(read("le-tue-risposte/domanda01.txt"), block: true, lang: "text")
]
#commento(
  "Ok, mancano descrizioni e almeno un'altra componente. Occhio che è LA cpu, non IL cpu.",
)

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 6)[
  #raw(read("le-tue-risposte/domanda02.txt"), block: true, lang: "text")
]
#commento(
  "Bene, manca un accenno alla codifica ASCII e alla base 2. Cerca di essere meno vaga, altrimenti è difficile capire se tu abbia capito o meno!",
)

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 10, diff: 1)[
  #raw(read("le-tue-risposte/esercizio01.py"), block: true, lang: "python")
]
#commento(
  "Perfetto: corretto e idiomatico.",
)

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 18, diff: 2)[
  #raw(read("le-tue-risposte/esercizio02.py"), block: true, lang: "python")
]
#commento(
  "Quasi perfetto. L'unica imprecisione è che n viene escluso dal ciclo (i < n): per n = 5 stampa 10 invece di 15.",
)

#risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 5, diff: 3)[
  #raw(read("le-tue-risposte/esercizio03.py"), block: true, lang: "python")
]
#commento(
  "Qui cadi nella trappola del ciclo infinito: manca l'incremento di i, quindi il ciclo while non termina mai. Manca proprio la logica di base",
)

= Lettura del codice (30 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 2, diff: 2)[
  #raw(read("le-tue-risposte/snippet01.txt"), block: true, lang: "text")
]
#commento(
  "Bene l'inizio! L'output è 9, 1, 7, 3: prova a riportarli tutti e a spiegare il perché.",
)

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/snippet02.txt"), block: true, lang: "text")
]
#commento(
  "Perfetto.",
)

#risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/snippet03.txt"), block: true, lang: "text")
]
#commento(
  "Perfetto. Avrei usato 'stampare' invece di 'vedere', ma è chiaro che hai capito il funzionamento.",
)

= Riepilogo dei punteggi

#griglia-correzione()
