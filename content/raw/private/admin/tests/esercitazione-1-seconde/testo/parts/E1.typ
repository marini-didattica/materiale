#import "/typst-components/src/lib.typ": consegna, esempi, nota, template

#consegna[Data la lista `l`, stampa gli elementi uno si e uno no, ad esempio 0, 2, 4, … e così via.]

#nota[Con `[1, 2, 3, 4, 5]` l'output è `1 3 5`. Puoi stampare mentre scorri la lista.]

#template[
  ```python
  l = [1, 2, 3, 4, 5]

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`l = [1, 2, 3, 4, 5]`], [`1 3 5`], [Si parte dalla posizione `0` e si salta una posizione.]),
  ([`l = [10, 20, 30]`], [`10 30`], [Gli elementi in posizione `0` e `2`.]),
  ([`l = []`], [nessun output], [Una lista vuota non stampa nulla.]),
))
