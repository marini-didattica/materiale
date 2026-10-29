// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root . content/raw/private/1d/branz-federico/simulazione-1/correzione.typ /tmp/branz-federico.pdf

#import "/typst-theme/src/lib.typ": theme
#import "/typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Federico Branz", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Federico Branz",
  title: "Correzione — Simulazione 1",
  subtitle: "Classe 1D · 20 ottobre 2026",
)

#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 vengono mappati sul voto in decimi
  (`3 + min(totale, 100) / 100 * 7`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 6.5)[
  #raw(
    "1. PROCESSORE: Svolge azioni velocemente ma una solo una dopo l'altra e nn contemporaneamente. Svolge i calcoli e controlla le azioni degli altri componenti
RAM: memoria temporanea che viene salvata o cancellata sul disco rigido dopo ogni utilizzo
DISCO RIGIDO: memoria permanente del computer 
SCHEDA VIDEO: capace di svolgere molte azioni velocemente contemporaneamente, serve per mostrare in tempo reale quello che accade dentro il computer (forma i pixel per lo schermo che vediamo)
SCHEDA MADRE: \"cervello\" del computer, coordina le operazioni e collega tutti i componenti.",
    block: true,
    lang: "text",
  )
]
#commento[Bene. La scheda madre non è proprio il cervello, ma coordina. Di fatto la scheda madre non fa altro che collegare fra di loro i componenti. Il vero cervello è la CPU.]

#risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 5)[
  #raw(
    "2. Vengono immagazzinati in liste e tabelle numerate, dove in base all'ordine che viene dato viene salvato in un determinato punto della lista. Caratteri e parole vengono sostituite con dei codici di moltissimi 1 o 0 (acceso o spento) in base al tipo di lettera e carattere che bisogna salvare.",
    block: true,
    lang: "text",
  )
]
#commento[L'idea del binario per caratteri e parole c'è. Occhio a come ti esprimi, da ciò che hai scritto si intuisce che hai un'idea di ciò che avviene, ma risulta poco chiaro. I numeri si salvano in base 2, i caratteri con una codifica (tipo ASCII).]

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

= Scrittura del codice (60 punti)

#risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 10, diff: 1)[
  #raw(read("le-tue-risposte/es1.py"), block: true, lang: "python")
]
#commento[Il codice funziona alla perfezione, occhio però che ti sei complicato la vita! L'ultimo `if` non serve, e la coppia `if`/`else` all'interno del ciclo potrebbe essere modificata con un singolo `if`.]

#risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 18, diff: 2)[
  #raw(read("le-tue-risposte/es2.py"), block: true, lang: "python")
]
#commento[Il codice funziona alla perfezione, ma occhio all'`else`. Per come l'abbiamo visto noi l'`else` dovrebbe essere accoppiato ad un `if`. Sei stato fortunato che l'uso che ne fai qui non influisce sul funzionamento dell'applicazione, ma non andrebbe usato!]

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

= Riepilogo dei punteggi

#griglia-correzione()
