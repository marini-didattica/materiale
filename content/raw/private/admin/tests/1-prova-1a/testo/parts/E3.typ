#import "/typst-components/src/lib.typ": callout, checklist, consegna, esempi, griglia-punteggi, nota, quesito, template, testata, righe-risposta

#consegna[Data una lista di interi `l`, conta quanti elementi sono pari e stampa un solo
  numero: il conteggio trovato. Se la lista è vuota, stampa `0`. La lista può contenere numeri
  negativi e lo zero.]

#nota[
  Un numero è pari se `x % 2 == 0`. In Python `-4 % 2` vale `0` e `-3 % 2` vale `1`, quindi lo
  stesso controllo funziona anche con i numeri negativi. Attenzione: anche `0` è pari.
]

#template[
  ```python
  l = [3, 8, 0, -4, 7, 10]

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`l = []`], [`0`], [La lista è vuota: non ci sono numeri pari.]),
  ([`l = [1, 3, 5]`], [`0`], [Sono tutti dispari.]),
  ([`l = [3, 8, 0, -4, 7, 10]`], [`4`], [I pari sono `8, 0, -4, 10`.]),
))
