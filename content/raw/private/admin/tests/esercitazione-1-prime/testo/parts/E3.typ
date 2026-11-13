#import "/typst-components/src/lib.typ": consegna, esempi, nota, template

#consegna[Date la lista `l` e gli interi `a` e `b`, stampa `True` se *tutti* gli elementi di `l` sono fra `a` e `b`, estremi inclusi, altrimenti `False`. Se `l` è vuota, stampa `True`. Le variabili `l`, `a` e `b` sono già nel template.]

#nota[
  *Non è detto che `a < b`.* Con `a = 10` e `b = 1` l'intervallo è `[1, 10]`; non basta controllare che `x` sia compreso fra `a` e `b`.
]

#template[
  ```python
  l = [3, 5, 7, 12]
  a = 1
  b = 10

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`l = [3, 5, 7]` \ `a = 1`, `b = 10`], [`True`], [Tutti i valori stanno fra `1` e `10`.]),
  (
    [`l = [3, 5, 7]` \ `a = 10`, `b = 1`],
    [`True`],
    [Gli estremi sono invertiti, ma l'intervallo è sempre `[1, 10]`.],
  ),
  ([`l = [-4, 0, 2, 9]` \ `a = 2`, `b = -4`], [`False`], [L'intervallo è `[-4, 2]`, ma `9` è fuori.]),
))
