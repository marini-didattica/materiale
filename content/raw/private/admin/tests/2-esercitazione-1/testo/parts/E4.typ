#import "/typst-components/src/lib.typ": consegna, esempi, nota, template

#consegna[Trova e stampa il secondo valore più grande della lista `l`. La lista contiene almeno due valori distinti.]

#nota[Se il massimo compare più volte, considera il valore distinto successivo: in `[5, 5, 3]` il secondo più grande è `3`.]

#template[
  ```python
  l = [1, 2, 3, 4, 5]

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`l = [1, 2, 3, 4, 5]`], [`4`], [Il massimo è `5`, il valore successivo è `4`.]),
  ([`l = [5, 5, 3]`], [`3`], [Il massimo compare due volte, ma il secondo valore distinto è `3`.]),
  ([`l = [-3, -1, -7]`], [`-3`], [Il massimo è `-1`, il secondo è `-3`.]),
))
