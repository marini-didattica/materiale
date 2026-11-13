#import "/typst-components/src/lib.typ": consegna, esempi, template, nota

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
