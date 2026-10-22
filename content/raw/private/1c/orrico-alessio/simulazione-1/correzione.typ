// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root content content/raw/private/1c/orrico-alessio/simulazione-1/correzione.typ /tmp/orrico-alessio.pdf

#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Alessio Orrico", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Alessio Orrico",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1C · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 4.5)[
  #raw(read("le-tue-risposte/domanda1.txt"), block: true, lang: "text")
]
#commento[Ci sono tante idee e altrettante imprecisioni. La GPU non dà qualità visiva; si occupa di elaborare immagini e, più in generale di eseguire istruzioni in parallelo. Inoltre non è il cervello del computer: il ruolo di esecuzione spetta alla CPU. Occhio che GPU e scheda video sono la stessa cosa.]

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 6)[
  #raw(read("le-tue-risposte/domanda2.txt"), block: true, lang: "text")
]
#commento[Buona spiegazione del codice binario e della combinazione di bit per numeri e lettere. Manca un riferimento esplicito alla base 2 e alla tabella ASCII.]

#risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 4.5)[
  #raw(read("le-tue-risposte/domanda3.txt"), block: true, lang: "text")
]
#commento[Va bene! Sottolinea che i codici sono binari.]

= Scrittura del codice (60 punti)

#risposta(none, category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 0, diff: 1)

#risposta(none, category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 10, diff: 2)[
  #raw(read("le-tue-risposte/snippet1.txt"), block: true, lang: "text")
]
#commento[Corretto: hai colto l'ordine inverso e riportato l'output. Per la precisione l'output è su righe separate, non separato da trattini.]

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
