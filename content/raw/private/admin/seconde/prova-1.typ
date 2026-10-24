// Compile from the materiale repository root:
// typst compile --root content content/raw/private/admin/seconde/prova-1.typ
#import "../../../../typst-theme/src/lib.typ": theme
#import "../../../../typst-components/src/lib.typ": (
  callout, checklist, consegna, cover, esempi, griglia-punteggi, nota, quesito, template, testata,
)

#set document(title: "Verifica di informatica — Prova 1", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Verifica di informatica")

#cover(
  top: "LICEO RUSSELL · INFORMATICA · CLASSE SECONDA",
  title: "Verifica di informatica",
  subtitle: "Liste, cicli e calcolo in Python",
  decoration: auto,
  descriptors: (
    ("Durata", "90 minuti"),
    ("Punteggio", "110 punti"),
    ("Esercizi", "70 punti"),
    ("Esercizi semplici", "40 punti"),
  ),
  student-data: none,
  body: [

    #callout("Istruzioni generali ")[
      - La prova è divisa in due parti: *esercizi* (70 punti) e *esercizi semplici*
        (40 punti).
      - Per ciascun esercizio scrivi un programma in *Python*, in un file separato. Sono
        valutate la correttezza, la gestione dei casi limite e la chiarezza del codice.
      - Il programma deve stampare *soltanto* il risultato richiesto e non deve chiedere dati
        con `input()`: usa le variabili già presenti nel template.
      - Non è consentito consultare appunti, libri o Internet. È possibile usare il *cheatsheet*
        messo a disposizione.
    ]
    #callout("Istruzioni per la consegna")[

      - Aprite il *file explorer* (icona cartella sulla barra degli strumenti in basso) e navigate nella cartella `Questo Pc -> Scrittura`.

      - Create una nuova cartella, denominata `cognome-nome`, *tutto minuscolo*. Se avete più nomi o più cognomi, metteteli tutti, concatenati dal carattere
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

      - Dentro a questa cartella, va creato *un file per ciascun esercizio*. Il nome del file è indicato
        nella tabella qui sotto: usa `e1.py` … `e5.py` per gli esercizi e `s1.py` … `s5.py` per gli
        esercizi semplici. L'estensione deve essere `.py`.

        #box(fill: luma(255), inset: 9pt, radius: 3pt)[
          #testata("Esercizio", 1, "Esempio esercizio")
          #v(0.5em)
          #text(size: 8.5pt, fill: luma(120), style: "italic")[
            Ad esempio, per il primo esercizio va creato un file `e1.py`
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
              [Esercizi], [`e1.py`, `e2.py`, `e3.py`, `e4.py`, `e5.py`],
              [Esercizi semplici], [`s1.py`, `s2.py`, `s3.py`, `s4.py`, `s5.py`],
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

Per ciascun esercizio scrivi un file separato (`e1.py` … `e5.py`), eseguilo e verifica il
risultato con gli esempi. Il programma deve stampare *soltanto* il risultato richiesto e non deve
chiedere dati con `input()`: usa le variabili già presenti nel template.

#checklist("Prima di consegnare", (
  [Il programma stampa *solo* il risultato richiesto, senza messaggi in più?],
  [Hai provato i casi limite: lista vuota, un solo elemento, valori duplicati, numeri negativi?],
  [I nomi delle variabili sono chiari e il codice è rientrato in modo corretto?],
  [Ogni esercizio è nel suo file `e1.py` … `e5.py` o `s1.py` … `s5.py`?],
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
  - Per l'esercizio *E4* non usare `list.index()`; per *S4* non usare l'operatore `**`; per
    *S5* non usare `//`, `%` o `divmod()`.
]

#quesito(category: "E", tag: "Esercizio", title: [Media degli elementi], points: 12, diff: 2)[
  #consegna[Data la lista di numeri `l`, calcola e stampa la *media* dei suoi elementi. Se la
    lista è vuota, stampa `0`.]

  #nota[
    La media è la somma degli elementi divisa per il numero di elementi. Calcola la somma con
    un ciclo e usa `len(l)` per il conteggio: non usare `sum()`. Attenzione alla divisione per
    zero quando la lista è vuota.
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
    oppure minore. Prima di controllare, assicurati che `a` sia il limite inferiore e `b` quello
    superiore: se `a > b`, scambiali usando una variabile temporanea. Non usare `min()` né
    `max()`.
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
    Confronta ogni elemento con quello che lo precede. Gli elementi uguali consecutivi non
    rompono l'ordine. Non usare `sorted()`: il controllo va fatto scorrendo la lista.
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
  #consegna[Date la lista `l` e il valore `a`, cerca `a` in `l`. Se lo trovi, stampa
    `Trovato all'indice N`, dove `N` è l'indice della *prima* occorrenza. Se non lo trovi,
    stampa `Non trovato`. Il valore `a` può essere un numero o una stringa.]

  #nota[
    Scorri la lista con un indice e confronta ogni elemento con `a`. Appena trovi la prima
    occorrenza puoi interrompere il ciclo con `break`. Non usare `list.index()` né l'operatore
    `in`: la ricerca va fatta con un ciclo.
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
    Confronta il primo elemento con l'ultimo, il secondo con il penultimo e così via. Basta
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
//  PARTE 2 — ESERCIZI SEMPLICI
// ============================================================

= Esercizi semplici (40 punti)

Per ciascun esercizio scrivi un file separato (`s1.py` … `s5.py`), eseguilo e verifica il
risultato con gli esempi. Valgono le stesse regole della parte precedente: il programma deve
funzionare per qualsiasi input e stampare soltanto il risultato richiesto.

#quesito(category: "S", tag: "Esercizio semplice", title: [Pari in ordine inverso], points: 8, diff: 1)[
  #consegna[Data la lista `l`, stampa soltanto gli elementi *pari*, partendo dall'ultimo e
    arrivando al primo. Stampa un elemento per riga. Se non ci sono elementi pari, il programma
    non deve stampare nulla.]

  #nota[
    Un numero è pari se `x % 2 == 0`; in Python il controllo funziona anche con i numeri
    negativi e lo zero è pari. Parti dall'indice `len(l) - 1` e diminuisci `i` fino a `0`.
  ]

  #template[
    ```python
    l = [3, 8, 0, -4, 7, 10]

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = [3, 8, 0, -4, 7, 10]`], [`10` #linebreak() `-4` #linebreak() `0` #linebreak() `8`], [I pari, dall'ultimo al primo.]),
    ([`l = [1, 3, 5]`], [nessun output], [Non ci sono elementi pari.]),
    ([`l = []`], [nessun output], [La lista è vuota.]),
  ))
]

#quesito(category: "S", tag: "Esercizio semplice", title: [C'è un numero negativo?], points: 8, diff: 1)[
  #consegna[Data la lista di numeri `l`, stampa `True` se contiene almeno un numero negativo,
    altrimenti stampa `False`. Se la lista è vuota, stampa `False`.]

  #nota[
    Un numero è negativo se `x < 0`: lo zero *non* è negativo. Puoi usare una variabile
    booleana e interrompere il ciclo con `break` appena trovi il primo negativo.
  ]

  #template[
    ```python
    l = [3, -1, 0, 7]

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = [3, -1, 0, 7]`], [`True`], [`-1` è negativo.]),
    ([`l = [0, 4, 9]`], [`False`], [Lo zero non è negativo.]),
    ([`l = []`], [`False`], [La lista è vuota.]),
  ))
]

#quesito(category: "S", tag: "Esercizio semplice", title: [Scambia due variabili], points: 8, diff: 1)[
  #consegna[Date le variabili `a` e `b`, scambia il loro contenuto e stampa i due valori sulla
    stessa riga, separati da uno spazio: prima `a`, poi `b`.]

  #nota[
    Puoi usare una variabile temporanea oppure l'assegnamento multiplo `a, b = b, a`. Dopo lo
    scambio `a` deve contenere il valore iniziale di `b` e viceversa.
  ]

  #template[
    ```python
    a = 3
    b = 8

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`a = 3, b = 8`], [`8 3`], [Dopo lo scambio `a` vale `8` e `b` vale `3`.]),
    ([`a = -2, b = 5`], [`5 -2`], [Funziona anche con numeri negativi.]),
    ([`a = 7, b = 7`], [`7 7`], [Se i valori sono uguali lo scambio non cambia nulla.]),
  ))
]

#quesito(category: "S", tag: "Esercizio semplice", title: [Potenza con moltiplicazioni], points: 8, diff: 2)[
  #consegna[Calcola `a` elevato a `b` e stampa il risultato. `b` è un intero maggiore o
    uguale a `0`; `a` può essere anche negativo.]

  #nota[
    Calcola la potenza moltiplicando `a` per sé stesso `b` volte. Parti da `1`: se `b` vale
    `0`, il ciclo non viene eseguito e il risultato resta `1`. Non usare l'operatore `**`.
  ]

  #template[
    ```python
    a = 3
    b = 4

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`a = 3, b = 4`], [`81`], [`3 * 3 * 3 * 3`.]),
    ([`a = 2, b = 0`], [`1`], [Qualsiasi numero elevato a `0` vale `1`.]),
    ([`a = -2, b = 3`], [`-8`], [Il segno negativo resta perché l'esponente è dispari.]),
  ))
]

#quesito(category: "S", tag: "Esercizio semplice", title: [Divisione con sottrazioni], points: 8, diff: 3)[
  #consegna[Calcola la divisione intera `a // b` e stampa il quoziente. `a` è un intero
    maggiore o uguale a `0` e `b` è un intero maggiore di `0`.]

  #nota[
    Conta quante volte puoi sottrarre `b` da `a` senza andare sotto zero. Il numero di
    sottrazioni effettuate è il quoziente. Non usare `//`, `%` o `divmod()`.
  ]

  #template[
    ```python
    a = 17
    b = 5

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`a = 17, b = 5`], [`3`], [`5` sta tre volte in `17`.]),
    ([`a = 4, b = 7`], [`0`], [`7` non sta in `4`.]),
    ([`a = 20, b = 4`], [`5`], [`20 - 4 - 4 - 4 - 4 - 4 = 0`.]),
  ))
]
