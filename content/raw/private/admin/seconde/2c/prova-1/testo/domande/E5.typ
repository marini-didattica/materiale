#import "/typst-components/src/lib.typ": consegna, esempi, nota, template

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