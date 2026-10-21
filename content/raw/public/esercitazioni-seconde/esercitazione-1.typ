// Compile from the materiale repository root:
// typst compile --root content content/raw/public/esercitazioni-seconde/esercitazione-1.typ
#import "../../../typst-theme/src/lib.typ": theme
#import "../../../typst-components/src/lib.typ": cover, quesito, griglia-punteggi, nota, template, esempi, callout, checklist, consegna

#set document(title: "Verifica di informatica — Simulazione 1", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Verifica di informatica")

#cover(
  top: "LICEO RUSSELL · INFORMATICA · CLASSE SECONDA",
  title: "Simulazione verifica 1",
  subtitle: "Produzione e lettura di codice con liste in Python",
  decoration: auto,
  descriptors: (
    ("Durata", "90 minuti"),
    ("Punteggio", "110 punti"),
    ("Produzione", "80 punti"),
    ("Lettura", "30 punti"),
  ),
  student-data: ("nome", "cognome", "classe", "data"),
  body: [
    #callout("Istruzioni")[
      - La prova è divisa in due parti: *produzione del codice* (80 punti) e *lettura del codice* (30 punti).
      - Per la produzione scrivi un file separato per ogni esercizio (`es1.py` … `es5.py`), eseguilo e verifica il risultato con gli esempi.
      - Nella lettura spiega a parole che cosa fa ogni frammento e, se stampa qualcosa, riporta anche l'output; non riscrivere il codice.
      - Sono valutati la correttezza, la gestione dei casi limite e la chiarezza del codice.
      - Non è consentito consultare appunti, libri o Internet.
    ]

    #v(0.65cm)

    #table(
      columns: (auto, 1fr, auto),
      inset: (x: 9pt, y: 6pt),
      align: (left, left, right),
      stroke: 0.5pt + luma(215),
      table.header([*Parte*], [*Contenuto*], [*Punti*]),
      [1], [Produzione del codice — cinque esercizi], [80],
      [2], [Lettura del codice — cinque frammenti], [30],
      table.cell(colspan: 2, align: right)[*Totale*], [*110*],
    )

    #v(3pt)
    #text(size: 8.5pt, fill: luma(120), style: "italic")[
      Il punteggio delle singole voci è riportato accanto a ciascun esercizio.
    ]
  ],
)

// ============================================================
//  PARTE 1 — PRODUZIONE DEL CODICE
// ============================================================

#pagebreak()

= Produzione del codice (80 punti)

Per ciascun esercizio scrivi un file separato (`es1.py` … `es5.py`), eseguilo e verifica il risultato con gli esempi. Il programma deve stampare *soltanto* il risultato richiesto.

#checklist("Prima di consegnare", (
  [Il programma stampa *solo* il risultato richiesto, senza messaggi in più?],
  [Hai provato i casi limite: lista vuota, un solo elemento, valori duplicati, numeri negativi?],
  [I nomi delle variabili sono chiari e il codice è rientrato in modo corretto?],
  [Ogni esercizio è nel suo file `es1.py` … `es5.py`?],
))

E' *fondamentale* che il programma funzioni per qualsiasi input gli venga dato. Gli esercizi che sono strutturati per funzionare solo su input specifici verranno valutati *0 punti*. Ad esempio, se venisse chiesto di stampare tutti i numeri contenuti in una lista, uno ad uno, allora il seguente esercizio varrebbe zero punti:
```python
l = [1,2,3]
print(l[0])
print(l[1])
print(l[2])
```

#callout("Funzioni non consentite")[
  - Sono vietati `sum()`, `max()`, `min()`, `sorted()`, `reversed()`, `all()`, `any()`, `list.reverse()`, `list.sort()`, `list.count()`, `list.index()`.
  - Sono consentiti `len()`, `append()`, `pop()`, `remove()` e i normali cicli.
]

#v(1.5em)

#quesito(category: "E", tag: "Esercizio", title: [Posizioni alternate], points: 12, diff: 1)[
  #consegna[Data la lista `l`, stampa gli elementi uno si e uno no, ad esempio 0, 2, 4, … e così via.]

  #nota[Con `[1, 2, 3, 4, 5]` l'output è `1 3 5`. Puoi stampare mentre scorri la lista.]

  #template[
    ```python
    l = [1, 2, 3, 4, 5]

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = [1, 2, 3, 4, 5]`], [`1 3 5`], [Si parte dalla posizione `0` e si salta una posizione.]),
    ([`l = [10, 20, 30]`], [`10 30`], [Gli elementi in posizione `0` e `2`.]),
    ([`l = []`], [nessun output], [Una lista vuota non stampa nulla.]),
  ))
]

#v(1.5em)

#quesito(category: "E", tag: "Esercizio", title: [Inversione in place], points: 16, diff: 2)[
  #consegna[Inverti la lista `l` *senza usare una lista ausiliaria*. Alla fine stampa `l`.]

  #template[
    ```python
    l = [1, 2, 3, 4, 5]

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = [1, 2, 3, 4, 5]`], [`[5, 4, 3, 2, 1]`], [Gli estremi vengono scambiati fino al centro.]),
    ([`l = [1, 2]`], [`[2, 1]`], [Un solo scambio.]),
    ([`l = [7]`], [`[7]`], [Una lista con un solo elemento resta uguale.]),
  ))
]

#v(1.5em)

#quesito(category: "E", tag: "Esercizio", title: [Palindroma], points: 16, diff: 2)[
  #consegna[Stabilisci se la lista `l` è *palindroma*: si legge allo stesso modo da sinistra a destra e da destra a sinistra. Stampa `True` oppure `False`.]

  #nota[Una lista vuota e una lista con un solo elemento sono palindrome.]

  #template[
    ```python
    l = [1, 2, 3, 2, 1]

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = [1, 2, 3, 2, 1]`], [`True`], [La sequenza è simmetrica.]),
    ([`l = [1, 2, 3]`], [`False`], [Gli estremi `1` e `3` sono diversi.]),
    ([`l = []`], [`True`], [Non c'è nessuna coppia da confrontare.]),
  ))
]

#v(1.5em)

#quesito(category: "E", tag: "Esercizio", title: [Secondo più grande], points: 18, diff: 3)[
  #consegna[Trova e stampa il secondo valore più grande della lista `l`. La lista contiene almeno due valori distinti.]

  #nota[Se il massimo compare più volte, considera il valore distinto successivo: in `[5, 5, 3]` il secondo più grande è `3`.]

  #template[
    ```python
    l = [1, 2, 3, 4, 5]

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = [1, 2, 3, 4, 5]`], [`4`], [Il massimo è `5`, il valore successivo è `4`.]),
    ([`l = [5, 5, 3]`], [`3`], [Il massimo compare due volte, ma il secondo valore distinto è `3`.]),
    ([`l = [-3, -1, -7]`], [`-3`], [Il massimo è `-1`, il secondo è `-3`.]),
  ))
]

#v(1.5em)

#quesito(category: "E", tag: "Esercizio", title: [Rimuovi i negativi], points: 18, diff: 3)[
  #consegna[Modifica `l` rimuovendo tutti i numeri negativi. Alla fine stampa `l`. Lo zero va mantenuto.]

  #nota[Puoi modificare la lista originale oppure costruirne una nuova, purché alla fine `l` contenga solo i valori non negativi.]

  #template[
    ```python
    l = [3, -2, 0, -7, 5]

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = [3, -2, 0, -7, 5]`], [`[3, 0, 5]`], [Vengono eliminati `-2` e `-7`; lo `0` resta.]),
    ([`l = [-1, -2, -3]`], [`[]`], [Tutti gli elementi sono negativi.]),
    ([`l = [0, 1, 2]`], [`[0, 1, 2]`], [Non ci sono numeri negativi da rimuovere.]),
  ))
]

// ============================================================
//  PARTE 2 — LETTURA DEL CODICE
// ============================================================

#pagebreak()

= Lettura del codice (30 punti)

Per ciascun frammento di codice spiega a parole che cosa fa e, se il programma stampa qualcosa, riporta anche l'output. Non devi riscrivere il codice o eseguirne la traccia; va dimostrato di averne compreso l'intento, descrivendone il funzionamento.

#v(1.5em)

#quesito(category: "S", tag: "Snippet", title: [Primo frammento], points: 6, diff: 2, righe: 3)[
  ```python
  a = [2, 4, 5, 3, 8]
  b = True
  i = 1
  while i < len(a):
      if a[i] < a[i - 1]:
          b = False
      i = i + 1
  print(b)
  ```
]

#v(1.5em)

#quesito(category: "S", tag: "Snippet", title: [Secondo frammento], points: 6, diff: 2, righe: 3)[
  ```python
  a = [4, 8, 6, 10]
  b = 0
  for x in a:
      b = b + x
  c = b / len(a)
  for x in a:
      if x > c:
          print(x)
  ```
]

#v(1.5em)

#quesito(category: "S", tag: "Snippet", title: [Terzo frammento], points: 6, diff: 1, righe: 3)[
  ```python
  a = [4, 9, 1, 7]
  b = a[0]
  c = a[0]
  i = 1
  while i < len(a):
      if a[i] > b:
          b = a[i]
      if a[i] < c:
          c = a[i]
      i = i + 1
  print(b)
  print(c)
  ```
]

#v(1.5em)

#quesito(category: "S", tag: "Snippet", title: [Quarto frammento], points: 6, diff: 2, righe: 3)[
  ```python
  a = [4, 9, 1, 7]
  b = 0
  i = 1
  while i < len(a):
      if a[i] > a[b]:
          b = i
      i = i + 1
  print(b)
  ```
]

#v(1.5em)

#quesito(category: "S", tag: "Snippet", title: [Quinto frammento], points: 6, diff: 3, righe: 3)[
  ```python
  a = [4, 9, 1, 9]
  b = a[0]
  c = 1
  i = 1
  while i < len(a):
      if a[i] > b:
          b = a[i]
          c = 1
      elif a[i] == b:
          c = c + 1
      i = i + 1
  print(c)
  ```
]

#pagebreak()

= Riepilogo dei punteggi

#griglia-punteggi()
