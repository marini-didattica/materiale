#import "/typst-theme/src/lib.typ": theme
#import "/typst-components/src/lib.typ": (
  callout,
  cover,
  griglia-punteggi2,
)

#let preamble(exam) = {
  let meta = exam.metadata
  let top = if meta.top == none {
    "LICEO RUSSELL · INFORMATICA · CLASSE " + meta.class
  } else {
    meta.top
  }

  set document(title: meta.title, author: meta.author)
  show: doc => theme(doc, footer-text: meta.title)

  let descriptors = (
    ("Durata", str(meta.duration) + " minuti"),
    ("Punteggio", str(exam.total) + " punti"),
  )

  for category in exam.categories {
    descriptors = descriptors + ((category.tag, str(category.points) + " punti"),)
  }

  cover(
    top: top,
    title: meta.title,
    subtitle: meta.subtitle,
    decoration: auto,
    descriptors: descriptors,
    student-data: none,
    body: [
      #callout("Istruzioni generali")[
        - Per gli esercizi scrivi un programma in *Python*, in un file separato. Sono
          valutate la correttezza, la gestione dei casi limite e la chiarezza del codice.
        - Nella parte di lettura spiega a parole che cosa fa ciascun frammento e riporta il suo
          output, senza riscrivere il codice.
        - Il programma deve stampare *soltanto* il risultato richiesto e non deve chiedere dati
          con `input()`: usa le variabili già presenti nel template.
        - Non è consentito consultare appunti, libri o Internet. È possibile usare il
          *cheatsheet* messo a disposizione.
      ]

      #callout("Istruzioni per la consegna")[
        - Crea una cartella `cognome-nome`, tutto minuscolo. Se hai più nomi o più cognomi,
          mettili tutti, concatenati dal carattere `-`.
        - Crea un file per ciascun esercizio. Il nome è quello indicato nell'intestazione,
          tutto minuscolo e senza spazi: estensione `.py` per gli esercizi di programmazione,
          `.txt` per le risposte alle domande e agli snippet.
        - Non modificare i file di partenza e non consegnare cartelle compresse.
      ]

      #griglia-punteggi2(exam.categories, titolo: "Riepilogo dei punteggi")

      #text(size: 8.5pt, fill: luma(120), style: "italic")[
        Il punteggio delle singole voci è riportato accanto a ciascun esercizio.
      ]
    ],
  )

  pagebreak()
}
