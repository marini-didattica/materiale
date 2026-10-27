// Compile from the materiale repository root:
// typst compile --root content content/raw/private/admin/seconde/2c/prova-1.typ
#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": (
  callout, checklist, consegna, cover, esempi, griglia-punteggi, nota, quesito, template, testata,
)

#set document(title: "Verifica di informatica — Prova 1", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Verifica di informatica")

#cover(
  top: "LICEO RUSSELL · INFORMATICA · CLASSE SECONDA",
  title: "Verifica di informatica",
  subtitle: "Liste, cicli e lettura del codice in Python",
  decoration: auto,
  descriptors: (
    ("Durata", "90 minuti"),
    ("Punteggio", "110 punti"),
    ("Esercizi", "70 punti"),
    ("Lettura", "40 punti"),
  ),
  student-data: none,
  body: [

    #callout("Istruzioni generali ")[
      - La prova è divisa in due parti: *esercizi* (70 punti) e *lettura del codice*
        (40 punti).
      - Per gli esercizi scrivi un programma in *Python*, in un file separato. Sono
        valutate la correttezza, la gestione dei casi limite e la chiarezza del codice.
      - Nella parte di lettura spiega a parole che cosa fa ciascun frammento e riporta il suo
        output, senza riscrivere il codice.
      - Il programma deve stampare *soltanto* il risultato richiesto e non deve chiedere dati
        con `input()`: usa le variabili già presenti nel template.
      - Non è consentito consultare appunti, libri o Internet. È possibile usare il *cheatsheet*
        messo su lettura.
    ]
    #callout("Istruzioni per la consegna")[

      - Aprite il *file explorer* (icona cartella sulla barra degli strumenti in basso) e navigate nella cartella `Questo Pc -> temi_xx`.

      - Creare una nuova cartella, denominata `cognome-nome`, *tutto minuscolo*. Se avete più nomi o più cognomi, metteteli tutti, concatenati dal carattere
        `-` (trattino). Ad esempio:

        #box(fill: luma(255), inset: 9pt, radius: 3pt)[
          #block(
            radius: 3pt,
            clip: true,
            stroke: 0.5pt + luma(195),
          )[
            #table(
              columns: (auto, 1fr),
              inset: (x: 9pt, y: 6pt),
              align: left,
              stroke: 0.5pt + luma(215),
              table.header([*Vostro nome*], [*Nome cartella*]),
              [Marini Mattia], [`marini-mattia`],
              [Olaizola Elisa Maitea], [`olaizola-elisa-maitea`],
            )
          ]
        ]

      - Dentro a questa cartella, va creato *un file per ciascun esercizio*. Il nome del file è quello indicato
        nell'intestazione dell'esercizio, trasformato in modo che sia *tutto minuscolo e senza
        spazi*: l'estensione deve essere `.py` per gli esercizi di programmazione e `.txt` per le
        risposte alle domande e agli snippet.


        #box(fill: luma(255), inset: 9pt, radius: 3pt)[
          #testata("Esercizio", 2, "Esempio esercizio")
          #v(0.5em)
          #text(size: 8.5pt, fill: luma(120), style: "italic")[
            Ad esempio, per questo esercizio va creato un file `esercizio1.py`
          ]
        ]

        Per questa prova nello specifico mi aspetto che consegniate i seguenti file:

        #box(fill: luma(255), inset: 9pt, radius: 3pt)[
          #block(
            radius: 3pt,
            clip: true,
            stroke: 0.5pt + luma(195),
          )[
            #table(
              columns: (auto, 1fr),
              inset: (x: 9pt, y: 6pt),
              align: left,
              stroke: 0.5pt + luma(215),
              table.header([*Parte*], [*File da consegnare*]),
              [Esercizi], [`esercizio1.py`, `esercizio2.py`, `esercizio3.py`, `esercizio4.py`, `esercizio5.py`],
              [Lettura], [`snippet1.txt`, `snippet2.txt`, `snippet3.txt`, `snippet4.txt`, `snippet5.txt`],
            )
          ]
        ]
    ]


    #griglia-punteggi(titolo: "Riepilogo dei punteggi")

    #text(size: 8.5pt, fill: luma(120), style: "italic")[
      Il punteggio delle singole voci è riportato accanto a ciascun esercizio.
      La prova vale 110 punti: i primi 100 determinano il voto, i 10 successivi valgono la lode.
    ]
  ],
)

// ============================================================
//  PARTE 1 — ESERCIZI
// ============================================================

#pagebreak()

= Esercizi (70 punti)

Per ciascun esercizio scrivi un file separato (`esercizio1.py` … `esercizio5.py`), eseguilo e
verifica il risultato con gli esempi. Il programma deve stampare *soltanto* il risultato
richiesto e non deve chiedere dati con `input()`: usa le variabili già presenti nel template.

#checklist("Prima di consegnare", (
  [Il programma stampa *solo* il risultato richiesto, senza messaggi in più?],
  [Hai provato i casi limite: lista vuota, un solo elemento, valori duplicati, numeri negativi?],
  [I nomi delle variabili sono chiari e il codice è rientrato in modo corretto?],
  [Ogni esercizio è nel suo file `esercizio1.py` … `esercizio5.py` o `snippet1.txt` … `snippet5.txt`?],
))

È *fondamentale* che il programma funzioni per qualsiasi input gli venga dato. Gli esercizi
strutturati per funzionare solo su un input specifico verranno valutati *0 punti*. Ad esempio,
se venisse chiesto di calcolare la media della lista `l`, il seguente programma varrebbe zero
punti:
```python
l = [4, 7, 10, 3]
print(6.0)
```

#callout("Funzioni e operatori non consentiti")[
  - Sono vietati `sum()`, `max()`, `min()`, `sorted()`, `reversed()`, `all()`, `any()`,
    `list.reverse()`, `list.sort()`, `list.count()` e `list.index()`.
  - Sono consentiti `len()`, `append()`, `pop()`, `remove()` e i normali cicli.
  - Nell'esercizio *L'elemento è nella lista?* non usare nemmeno l'operatore `in`: la ricerca va
    fatta con un ciclo.
]

#quesito(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 12, diff: 2)[
  #consegna[Data la lista di numeri `l`, calcola e stampa la *media* dei suoi elementi. Se la
    lista è vuota, stampa `0`.]

  #nota[
    La media è la somma degli elementi divisa per il numero di elementi. Calcola la somma con
    un ciclo e usa `len(l)` per il conteggio: non usare `sum()`. Attenzione al caso limite della lista vuota.
  ]

  #template[
    ```python
    l = [4, 7, 10, 3]

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = [4, 7, 10, 3]`], [`6.0`], [La somma è `24`, divisa per `4` elementi.]),
    ([`l = [2, 3]`], [`2.5`], [La media può essere un numero decimale.]),
    ([`l = []`], [`0`], [La media non è definita: stampa `0` per convenzione.]),
  ))
]

#quesito(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 16, diff: 3)[
  #consegna[Date la lista `l` e i due estremi `a` e `b`, stampa `True` se *tutti* gli elementi
    di `l` sono compresi nell'intervallo fra `a` e `b`, estremi inclusi, altrimenti stampa
    `False`. Se la lista è vuota, stampa `True`.]

  #nota[
    Gli estremi possono essere scritti in qualsiasi ordine: `a` può essere maggiore di `b`
    oppure minore. Prima di controllare, assicurati che `a` sia il limite inferiore e `b` quello superiore. Non usare `min()` né `max()`.
  ]

  #template[
    ```python
    l = [4, 6, 2, 9]
    a = 10
    b = 1

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = [4, 6, 2, 9], a = 1, b = 10`], [`True`], [Tutti gli elementi stanno fra `1` e `10`.]),
    ([`l = [4, 12, 2, 9], a = 10, b = 1`], [`False`], [Dopo lo scambio l'intervallo è `[1, 10]`: `12` è fuori.]),
    ([`l = [], a = 7, b = 2`], [`True`], [Non ci sono elementi fuori dall'intervallo.]),
  ))
]

#quesito(category: "E", tag: "Esercizio", title: [La lista è ordinata?], points: 12, diff: 2)[
  #consegna[Data la lista `l`, stampa `True` se è ordinata in senso *crescente*, cioè se ogni
    elemento è maggiore o uguale al precedente, altrimenti stampa `False`. Una lista vuota o con
    un solo elemento è considerata ordinata.]

  #nota[
    Non usare `sorted()`: il controllo va fatto scorrendo la lista.
  ]

  #template[
    ```python
    l = [1, 2, 2, 5]

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = [1, 2, 2, 5]`], [`True`], [I valori non diminuiscono mai.]),
    ([`l = [1, 3, 2, 4]`], [`False`], [`3` è seguito da `2`, quindi l'ordine si rompe.]),
    ([`l = []`], [`True`], [Non c'è nessuna coppia da confrontare.]),
  ))
]

#quesito(category: "E", tag: "Esercizio", title: [L'elemento è nella lista?], points: 12, diff: 1)[
  #consegna[
    Date la lista di interi `l` e il valore `a`, cerca `a` in `l`. Se lo trovi, stampa `Trovato all'indice N`, dove `N` è l'indice della *prima* occorrenza (ossia l'indice minore che contiene il valore `a`). 
  Se non lo trovi, stampa `Non trovato`. Il valore `a` può essere un numero o una stringa.
]

  #nota[
     Non usare `list.index()` né l'operatore `in`: la ricerca va fatta con un ciclo.
  ]

  #template[
    ```python
    l = [5, 8, 2, 9, 8]
    a = 8

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = [5, 8, 2, 9, 8], a = 8`], [`Trovato all'indice 1`], [Si considera la prima occorrenza.]),
    ([`l = [5, 8, 2], a = 4`], [`Non trovato`], [`4` non compare nella lista.]),
    ([`l = [], a = 1`], [`Non trovato`], [La lista è vuota.]),
  ))
]

#quesito(category: "E", tag: "Esercizio", title: [La lista è palindroma?], points: 18, diff: 2)[
  #consegna[Stabilisci se la lista `l` è *palindroma*: si legge allo stesso modo da sinistra a
    destra e da destra a sinistra. Stampa `True` oppure `False`. Una lista vuota e una lista con
    un solo elemento sono palindrome.]

  #nota[
    Consiglio il seguente approccio: confronta il primo elemento con l'ultimo, il secondo con il penultimo e così via. Basta
    fermarsi al centro della lista: se trovi due elementi diversi puoi concludere subito che la
    lista non è palindroma. Non usare `reversed()` né `list.reverse()`.
  ]

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

// ============================================================
//  PARTE 2 — LETTURA DEL CODICE
// ============================================================

#pagebreak()

= Lettura del codice (40 punti)

Per ciascun frammento di codice spiega a parole che cosa fa e, se il programma stampa qualcosa,
riporta anche l'output. Non devi riscrivere il codice: va dimostrato di averne compreso
l'intento, descrivendone il funzionamento.

#quesito(category: "S", tag: "Snippet", title: [Snippet 1], points: 8, diff: 1, righe: 4)[
  ```python
  l = [3, 8, 0, -4, 7, 10]
  i = len(l) - 1
  while i >= 0:
      if l[i] % 2 == 0:
          print(l[i])
      i = i - 1
  ```
]

#quesito(category: "S", tag: "Snippet", title: [Snippet 2], points: 8, diff: 1, righe: 5)[
  ```python
  l = [3, -1, 0, 7]
  b = False
  for i in range(len(l)):
      if l[i] < 0:
          b = True
  print(b)
  ```
]

#quesito(category: "S", tag: "Snippet", title: [Snippet 3], points: 8, diff: 1, righe: 4)[
  Cosa succede ai valori di `a` e `b`?
  ```python
  a = 3
  b = 8
  t = a
  a = b
  b = t
  print(a, b)
  ```
]

#quesito(category: "S", tag: "Snippet", title: [Snippet 4], points: 8, diff: 2, righe: 4)[
  ```python
  a = 3
  b = 4
  risultato = 1
  for _ in range(b):
      risultato = risultato * a
  print(risultato)
  ```
]

#quesito(category: "S", tag: "Snippet", title: [Snippet 5], points: 8, diff: 3, righe: 5)[
  Cosa stampa il programma? Quanto vale `a` alla fine del ciclo, e perché?
  ```python
  a = 17
  b = 5
  quoziente = 0
  while a >= 0:
      a = a - b
      quoziente = quoziente + 1
  print(quoziente - 1)
  ```
]
