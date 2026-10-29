// Compile from the materiale repository root, writing the PDF outside content/:
// typst compile --root . content/raw/private/2c/visintainer-filippo/simulazione-1/correzione.typ /tmp/visintainer-filippo.pdf

#import "/typst-theme/src/lib.typ": theme
#import "/typst-components/src/lib.typ": commento, griglia-correzione, intestazione-correzione, risposta

#set document(title: "Correzione — Simulazione 1 — Filippo Visintainer", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione(
  "Filippo Visintainer",
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
#commento[Perfetto: corretto e idiomatico.]

#risposta(category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, score: 13, diff: 2)[
  #raw(read("le-tue-risposte/esercizio2.py"), block: true, lang: "python")
]
#commento[Stampi gli elementi al contrario, ma non inverti la lista sul posto e non stampi la lista finale.]

#risposta(category: "E", tag: "Esercizio", title: [Palindroma], points: 16, score: 16, diff: 2)[
  #raw(read("le-tue-risposte/esercizio3.py"), block: true, lang: "python")
]
#commento[La logica è corretta, ma l'output richiesto è `True` o `False`, non "è palindromo o no". Comunque per ora non tengo conto di queste sottigliezze.]

#risposta(category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, score: 13, diff: 3)[
  #raw(read("le-tue-risposte/esercizio4.py"), block: true, lang: "python")
]
#commento[Il secondo massimo per la lista di esempio è giusto, ma stampi anche il massimo e il codice non gestisce bene duplicati e valori negativi. Comunque è decisamente un buon punto di partenza.]

#risposta(category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, score: 18, diff: 3)[
  #raw(read("le-tue-risposte/esercizio5.py"), block: true, lang: "python")
]
#commento[Filtri bene i valori, ma usi `i > 0` e quindi elimini anche lo zero, che va mantenuto. Inoltre stampi `l1` invece di aggiornare e stampare la lista. Ora sono un po' largo di manica nelle correzioni ma più andiamo avanti più darò peso a questi dettagli.]

= Lettura del codice (30 punti)

#risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 6, score: 3, diff: 2)[
  #raw(read("le-tue-risposte/snipper1.txt"), block: true, lang: "text")
]
#commento[Hai descritto riga per riga cosa fa il codice, ma non hai detto quale sia il risultato: il programma verifica se la lista è ordinata in modo non decrescente e stampa `True` nel caso lo fosse. Il valore finale di `b` è `True`.]

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, score: 0, diff: 2)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, score: 0, diff: 3)

#risposta(none, category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, score: 0, diff: 3)

= Riepilogo dei punteggi

#griglia-correzione()
