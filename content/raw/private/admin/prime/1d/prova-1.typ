// Compile from the materiale repository root:
// typst compile --root content content/raw/private/admin/prime/1d/prova-1.typ
#import "../../../../../typst-theme/src/lib.typ": theme
#import "../../../../../typst-components/src/lib.typ": (
  callout, checklist, consegna, cover, esempi, griglia-punteggi, nota, quesito, template, testata,
)

#set document(title: "Verifica di informatica — Prova 1", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Verifica di informatica")

#cover(
  top: "LICEO RUSSELL · INFORMATICA · CLASSE PRIMA",
  title: "Verifica di informatica",
  subtitle: "Teoria, scrittura e lettura di codice in Python",
  decoration: auto,
  descriptors: (
    ("Durata", "80 minuti"),
    ("Punteggio", "110 punti"),
    ("Teoria", "20 punti"),
    ("Scrittura", "60 punti"),
    ("Lettura", "30 punti"),
  ),
  student-data: none,
  body: [

    #callout("Istruzioni generali ")[
      - La prova è divisa in tre parti: *teoria* (20 punti), *scrittura del codice* (60 punti) e
        *lettura del codice* (30 punti).
      - Rispondi alle domande di teoria in modo *sintetico ma completo*, usando le righe a
        disposizione.
      - Per la parte di scrittura scrivi i programmi in *Python*, uno per esercizio. Sono
        valutate la correttezza, la gestione dei casi limite e la chiarezza del codice.
      - Nella parte di lettura spiega a parole che cosa fa ciascun frammento e riporta il suo
        output, senza riscrivere il codice.
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
              [Teoria], [`domanda1.txt`, `domanda2.txt`, `domanda3.txt`],
              [Scrittura], [`esercizio1.py`, `esercizio2.py`, `esercizio3.py`],
              [Lettura], [`snippet1.txt`, `snippet2.txt`, `snippet3.txt`],
            )
          ]
        ]
    ]


    #griglia-punteggi(titolo: "Riepilogo dei punteggi")

    #text(size: 8.5pt, fill: luma(120), style: "italic")[
      Il punteggio delle singole voci è riportato accanto a ciascuna domanda e a ciascun esercizio.
      La prova vale 110 punti: i primi 100 determinano il voto, i 10 successivi valgono la lode.
    ]
  ],
)

// ============================================================
//  PARTE 1 — TEORIA
// ============================================================

#pagebreak()

= Teoria (20 punti)

Rispondi in modo breve e preciso, usando le righe sotto ogni domanda.

#quesito(category: "D", tag: "Domanda", title: [RAM e memoria di massa], points: 7, righe: 6)[
  Spiega la differenza principale fra *memoria centrale (RAM)* e *memoria di massa* (ad esempio
  un disco SSD o un hard disk). Per ciascuna delle due indica che scopo ha e cosa la differenzia dall'altra.

]

#quesito(category: "D", tag: "Domanda", title: [Bit, byte e sistema binario], points: 9, righe: 10)[
  Che cosa sono un *bit* e un *byte*? Perché il computer usa il *sistema binario* invece del
  sistema decimale? Quanti valori diversi si possono rappresentare con un byte?

]

#quesito(category: "D", tag: "Domanda", title: [Compilatore e interprete], points: 4, righe: 2)[
  Che cosa fanno un *compilatore* e un *interprete*? Spiega a parole tue 
]

// ============================================================
//  PARTE 2 — SCRITTURA DEL CODICE
// ============================================================

= Scrittura del codice (60 punti)

Per ciascun esercizio scrivi un file separato (`esercizio1.py`, `esercizio2.py`,
`esercizio3.py`), eseguilo e verifica il risultato con gli esempi. Il programma deve stampare
*soltanto* il risultato richiesto e non deve chiedere dati con `input()`: usa le variabili già
presenti nel template. In questa parte si possono usare soltanto i cicli `while`.

#checklist("Prima di consegnare", (
  [Il programma stampa *solo* il risultato richiesto, senza messaggi in più?],
  [Hai provato i casi limite: lista vuota, nessun positivo, numeri negativi?],
  [I nomi delle variabili sono chiari e il codice è rientrato in modo corretto?],
  [Ogni esercizio è nel suo file `esercizio1.py`, `esercizio2.py`, `esercizio3.py`?],
))

È *fondamentale* che il programma funzioni per qualsiasi input gli venga dato. Gli esercizi
strutturati per funzionare solo su un input specifico verranno valutati *0 punti*. Ad esempio,
se venisse chiesto di sommare i valori positivi della lista `l`, il seguente programma varrebbe
zero punti:
```python
l = [5, -2, 8, 0, -7, 3]
print(16)
```

#quesito(category: "E", tag: "Esercizio", title: [Somma dei valori positivi], points: 15, diff: 1)[
  #consegna[Data la lista di interi `l`, somma soltanto gli elementi *maggiori o uguali a zero* e stampa un
    solo numero: la somma trovata. Se non ci sono elementi positivi, compresa la lista vuota,
    stampa `0`. La lista può contenere lo zero e numeri negativi.]

  #template[
    ```python
    l = [5, -2, 8, 0, -7, 3]

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = []`], [`0`], [La lista è vuota: non ci sono valori da sommare.]),
    ([`l = [-3, 0, -1]`], [`0`], [Non ci sono elementi positivi.]),
    ([`l = [5, -2, 8, 0, -7, 3]`], [`16`], [I positivi sono `5, 8, 3`, e `5 + 8 + 3 = 16`.]),
  ))
]

#quesito(category: "E", tag: "Esercizio", title: [Tutti positivi?], points: 20, diff: 2)[
  #consegna[Data la lista `l`, stampa `True` se *tutti* gli elementi sono *maggiori o uguali a zero*,
    altrimenti stampa `False`. Se la lista è vuota, stampa `True`. Il programma non deve
    modificare la lista.]

  #nota[
    Deve essere stampato soltanto un valore booleano (`True` oppure `False`), non un messaggio.
    Un solo elemento minore o uguale a zero è sufficiente per rispondere `False`. 
  ]

  #template[
    ```python
    l = [3, 8, 1, 5]

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = []`], [`True`], [Non c'è nessun elemento che possa violare la condizione.]),
    ([`l = [3, 8, 0, 5]`], [`True`], [Sono tutti maggiori o uguali a zero.]),
    ([`l = [3, -1, 5]`], [`False`], [`-1` non è `>=0`, dunque stampa `False`.]),
  ))
]

#quesito(category: "E", tag: "Esercizio", title: [Massimo e minimo], points: 25, diff: 3)[
  #consegna[Data la lista di interi `l`, trova il valore *massimo* e il valore *minimo* e
    stampali su due righe: prima il massimo, poi il minimo. Se la lista è vuota, stampa `Lista vuota!`. La lista può contenere numeri negativi.]

  #nota[
    Inizializza massimo e minimo con il primo elemento `l[0]`, non con `0`: se tutti i numeri
    fossero negativi, `0` sarebbe un valore sbagliato. Parti dall'indice `1` per il ciclo. Non
    usare `max()` né `min()`.
  ]

  #template[
    ```python
    l = [7, -3, 12, 0, 5, -8]

    # scrivi qui il tuo codice
    ```
  ]

  #esempi((
    ([`l = []`], [`0`], [La lista è vuota: non esiste né un massimo né un minimo.]),
    ([`l = [4]`], [`4`
      #linebreak()
      `4`], [Con un solo elemento, massimo e minimo coincidono.]),
    ([`l = [7, -3, 12, 0, 5, -8]`], [`12`
      #linebreak()
      `-8`], [Il valore più grande è `12`, il più piccolo è `-8`.]),
  ))
]

// ============================================================
//  PARTE 3 — LETTURA DEL CODICE
// ============================================================

#pagebreak()

= Lettura del codice (30 punti)

Per ciascun frammento di codice spiega a parole che cosa fa e, se il programma stampa qualcosa,
riporta anche l'output. Non devi riscrivere il codice: va dimostrato di averne compreso
l'intento, descrivendone il funzionamento.

#quesito(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, diff: 2, righe: 3)[
  ```python
  l = [4, 7, 2, 9, 5]
  n = len(l)
  s = 0
  i = 0
  while i < n:
      if l[i] % 2 == 1:
          s = s + l[i]
      i = i + 1
  print(s)
  ```
]

#quesito(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, diff: 2, righe: 3)[
  ```python
  l = [2, 5, 8, 1]
  i = len(l) - 1
  while i >= 0:
      print(l[i])
      i = i - 1
  ```
]

#quesito(category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, diff: 2, righe: 4)[
  ```python
  a = 3
  b = 4
  risultato = 1
  i = 0
  while i < b:
      risultato = risultato * a
      i = i + 1
  print(risultato)
  ```
]
