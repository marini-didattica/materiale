// Programmazione didattica — Informatica, classe 2C
#set document(title: "Programmazione didattica — Informatica — Classe 2C")

#let ink = rgb("#211f1c")
#let muted = rgb("#6f6a63")
#let rule = rgb("#d8d2c8")
#let accent = rgb("#8a1730")
#let tint = rgb("#f7f3ec")
#let sans = "Liberation Sans"

#set page(paper: "a4", margin: (x: 2.4cm, y: 2.4cm), footer: none)
#set text(lang: "it", region: "IT", fill: ink)
#set par(leading: 0.75em)

#let etichetta(txt) = text(font: sans, size: 10pt, tracking: 0.16em, fill: muted)[#txt]

#align(center)[
  #text(font: sans, size: 10pt, tracking: 0.16em, fill: muted)[LICEO B. RUSSELL]
  #v(0.35em)
  #text(size: 10pt, fill: muted, tracking: 0.16em)[Via IV Novembre 35 – 38023 Cles]
]

#v(3em)
#align(center)[#line(length: 5em, stroke: 1pt + accent)]
#v(3em)

#align(center)[
  #block[#text(font: sans, size: 10pt, tracking: 0.16em, fill: accent)[PROGRAMMAZIONE DIDATTICA]]
  #v(0.8cm)
  #block[#text(size: 38pt, weight: 700)[Informatica]]
  #v(0.8cm)
  #block[#text(size: 14pt)[Classe *2C*]]
  #v(0.8cm)
  #block[#text(fill: muted)[Liceo Scientifico – Opzione Scienze Applicate]]
]

#v(5em)

#grid(
  columns: (1fr, 1fr),
  align: center,
  row-gutter: 4em,
  [
    #block[
      #etichetta("DOCENTE")
      #v(0.4em)
      #block[#block[#text(size: 14pt)[Prof. Mattia Marini]]]
    ]
  ],
  [
    #block[
      #etichetta("ANNO SCOLASTICO")
      #v(0.4em)
      #block[#text(size: 14pt)[2026/27]]
    ]
  ],

  [
    #block[
      #etichetta("ORE ANNUE")
      #v(0.4em)
      #block[#text(size: 30pt, weight: 700)[66]]
    ]
  ],
  [
    #block[
      #etichetta("ORE A CONSUNTIVO")
      #v(0.4em)
      #block[#text(size: 30pt, weight: 700, fill: accent)[/]]
    ]
  ],
)

#v(3em)


#v(1fr)

#align(center)[#line(length: 100%, stroke: 0.5pt + rule)]
#v(0.9em)
#align(center)[
  #text(font: sans, size: 10pt, tracking: 0.14em, fill: muted)[A.S. 2026/27]
]
#pagebreak()

#table(
  columns: (0.3fr, 1fr),
  stroke: 0.5pt,

  [#text(font: sans, size: 10pt, fill: accent)[*COMPETENZE DA RAGGIUNGERE AL TERMINE DELL’ANNO SCOLASTICO*]],
  [
    - Saper analizzare un problema e formulare una soluzione algoritmica, scomponendolo in istruzioni elementari e strutture di controllo.
    - Saper utilizzare un foglio di calcolo e le sue funzionalità avanzate.
    - Saper sfruttare efficientemente gli strumenti offerti dagli ambienti di sviluppo integrati (IDE), in particolare Visual Studio Code.
    - Avere confidenza con le strutture dati di base: liste, stringhe e matrici.
    - Saper utilizzare e riconoscere le strutture dati più avanzate: set e dizionari.
    - Saper utilizzare le funzioni di base della libreria standard di Python.
    - Saper strutturare un progetto Python in funzioni e moduli, con particolare attenzione alla chiarezza e alla modularità del codice.
  ],

  [#text(font: sans, size: 10pt, fill: accent)[*METODOLOGIE DIDATTICHE*]],
  [
    - Lezione frontale e dialogata, con coinvolgimento attivo della classe.
    - Esercitazioni in laboratorio, individuali o a coppie.
    - Problem solving guidato, con analisi collettiva degli errori.
    - Lavori di gruppo basati su peer learning.
    - Assegnazione e sviluppo di progetti da svolgere a casa.
    - Simulazioni delle prove di verifica.
    - Attività di recupero e consolidamento per gli studenti che incontrano difficoltà.
  ],

  [#text(font: sans, size: 10pt, fill: accent)[*CRITERI DI VALUTAZIONE*]],
  [
    - Verifiche scritte, pratiche e orali.
    - Sviluppo di progetti individuali o di gruppo.
    - Partecipazione attiva e qualità degli interventi.
    - Progressi rispetto ai livelli di partenza.
    - Capacità di analisi e di risoluzione dei problemi.
    - Correttezza, chiarezza e completezza del codice prodotto.
  ],

  [#text(font: sans, size: 10pt, fill: accent)[*TESTI, MATERIALI E STRUMENTI ADOTTATI*]],
  [
    - Ambiente di sviluppo integrato (IDE): Visual Studio Code.
    - LIM (Lavagna Interattiva Multimediale).
    - Presentazioni multimediali interattive, esercizi e appunti a cura del docente.
    - Sito web del docente.
    - Laboratorio di informatica con PC e connessione a Internet.
  ],
)

= Modulo 1 – Ripasso dei concetti di programmazione in Python
#text(fill: muted, size: 10pt, tracking: 0.10em)[*Ore previste: 10*]

#table(
  columns: (0.3fr, 1fr),
  stroke: 0.5pt,

  [#text(font: sans, size: 10pt, fill: accent)[*CONOSCENZE E/O CONTENUTI*]],
  [
    // #text(font: sans, size: 10pt)[*RIPASSO*]
    - Concetto di variabile e di tipo di dato.
    - Istruzioni di input e output: `input()` e `print()`.
    - Costrutti di controllo condizionali: `if`, `elif`, `else`.
    - Istruzioni di iterazione: `while` e `for` (iterazione su strutture dati).
    - Strutture dati di base: liste e stringhe.
    - Funzioni base della libreria standard di Python: `len()`, `max()`, `min()`, `sum()`, `sorted()`, `reversed()`, `enumerate()`.
    - Algoritmi e pattern noti.
  ],

  [#text(font: sans, size: 10pt, fill: accent)[*ABILITÀ E COMPETENZE*]],
  [
    - Saper scrivere semplici programmi in Python, utilizzando correttamente variabili, tipi di dato, operatori e strutture condizionali.
    - Avere confidenza con i concetti di iterazione e con le strutture dati di base, sapendo utilizzare tali elementi in semplici programmi Python.
    - Avere un buon vocabolario di algoritmi e pattern noti, sapendo riconoscerli e riadattarli a problemi analoghi.
  ],
)

= Modulo 2 – Concetti più avanzati di programmazione in Python
#text(fill: muted, size: 10pt, tracking: 0.10em)[*Ore previste: 15*]

#table(
  columns: (0.3fr, 1fr),
  stroke: 0.5pt,

  [#text(font: sans, size: 10pt, fill: accent)[*CONOSCENZE E/O CONTENUTI*]],
  [
    - Concetto di funzione, parametri e valori di ritorno; passaggio di parametri per valore e per riferimento.
    - Annotazioni di tipo e docstring.
    - Organizzazione del codice in moduli e buone pratiche.
    - Utilizzo di costrutti sintattici compatti (syntactic sugar), come list comprehension e f-string.
    - Utilizzo delle funzioni della libreria standard di Python, in particolare quelle per la manipolazione di stringhe e liste.
  ],

  [#text(font: sans, size: 10pt, fill: accent)[*ABILITÀ E COMPETENZE*]],
  [
    - Saper definire e utilizzare opportunamente le funzioni e i moduli.
    - Sviluppare codice Python in modo chiaro e modulare, suddividendo il programma in funzioni e moduli.
    - Sviluppare in autonomia programmi completi, che vadano oltre singoli brevi esercizi.
  ],
)

= Modulo 3 – Strutture dati: set, dizionari e matrici
#text(fill: muted, size: 10pt, tracking: 0.10em)[*Ore previste: 10*]

#table(
  columns: (0.3fr, 1fr),
  stroke: 0.5pt,

  [#text(font: sans, size: 10pt, fill: accent)[*CONOSCENZE E/O CONTENUTI*]],
  [
    - set: casi di utilizzo, operazioni di base e algoritmi tipici.
    - dizionari: casi di utilizzo, operazioni di base e algoritmi tipici.
    - matrici: casi di utilizzo, operazioni di base e algoritmi tipici.
  ],

  [#text(font: sans, size: 10pt, fill: accent)[*ABILITÀ E COMPETENZE*]],
  [
    - Comprendere le caratteristiche di ciascuna struttura dati e i rispettivi casi di utilizzo.
    - Utilizzare e comprendere le operazioni di base e gli algoritmi tipici per ciascuna struttura dati. Risolvere problemi di programmazione utilizzando la struttura dati più appropriata.
  ],
)

= Modulo 4 – Algoritmi
#text(fill: muted, size: 10pt, tracking: 0.10em)[*Ore previste: 15*]

#table(
  columns: (0.3fr, 1fr),
  stroke: 0.5pt,

  [#text(font: sans, size: 10pt, fill: accent)[*CONOSCENZE E/O CONTENUTI*]],
  [
    - Stima del costo di un algoritmo in termini di memoria e tempo di esecuzione. Classi di complessità computazionale e notazione Big O.
    - Risoluzione di problemi tramite algoritmi ricorsivi: concetto di ricorsione e di stack di esecuzione. Individuazione di caso base e passo ricorsivo.

    #text(font: sans, size: 10pt)[*ALGORITMI DI ORDINAMENTO*]
    - `bubble sort`
    - `insertion sort`
    - `selection sort`
    - `merge sort`

    #text(font: sans, size: 10pt)[*ALGORITMI RICORSIVI*]
    - `ricerca binaria`
    - `fibonacci`
    - `fattoriale`
    - `torre di Hanoi`
  ],

  [#text(font: sans, size: 10pt, fill: accent)[*ABILITÀ E COMPETENZE*]],
  [
    - Saper ordinare un vettore.
    - Saper stimare il numero di operazioni elementari necessarie per eseguire un algoritmo, comprendendo l’impatto della complessità computazionale sul tempo di esecuzione.
    - Saper sviluppare algoritmi ricorsivi, individuando correttamente il caso base e il passo ricorsivo.
    - Saper approcciare la risoluzione di problemi complessi con consapevolezza della complessità computazionale e delle strutture dati più appropriate da utilizzare.
  ],
)
