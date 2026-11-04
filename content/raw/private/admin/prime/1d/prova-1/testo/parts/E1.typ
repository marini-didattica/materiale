#import "/typst-components/src/lib.typ": callout, checklist, consegna, esempi, griglia-punteggi, nota, quesito, template, testata, righe-risposta

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
