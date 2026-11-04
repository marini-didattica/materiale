#import "/typst-components/src/lib.typ": consegna, esempi, nota, template

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
