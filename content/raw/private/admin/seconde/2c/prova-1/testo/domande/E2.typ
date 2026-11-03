#import "/typst-components/src/lib.typ": consegna, esempi, nota, template

#consegna[Date la lista `l` e i due estremi `a` e `b`, stampa `True` se *tutti* gli elementi
  di `l` sono compresi nell'intervallo fra `a` e `b`, estremi inclusi, altrimenti stampa
  `False`. Se la lista è vuota, stampa `True`.]

#nota[
  Gli estremi possono essere scritti in qualsiasi ordine: `a` può essere maggiore di `b`
  oppure minore. Prima di controllare, assicurati che `a` sia il limite inferiore e `b` quello superiore. Non usare `min()` né `max()`.
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