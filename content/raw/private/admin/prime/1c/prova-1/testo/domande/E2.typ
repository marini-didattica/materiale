#import "/typst-components/src/lib.typ": callout, checklist, consegna, esempi, griglia-punteggi, nota, quesito, template, testata, righe-risposta

#consegna[Date una lista di interi `l` e il valore `a`, stampa `True` se `a` compare almeno una volta in
  `l`, altrimenti stampa `False`. Se `l` è vuota, stampa `False`. Il programma non deve
  modificare la lista.]

#nota[
  Deve essere stampato soltanto un valore booleano (`True` oppure `False`), non un messaggio.
  Attenzione: con una lista vuota il risultato è `False`.
]

#template[
  ```python
  l = [3, 5, 7, 12]
  a = 7

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`l = [], a = 7`], [`False`], [La lista è vuota, quindi `a` non può esserci.]),
  ([`l = [3, 5, 7], a = 7`], [`True`], [`7` è l'ultimo elemento della lista.]),
  ([`l = [3, 5, 7], a = 4`], [`False`], [`4` non compare nella lista.]),
))
