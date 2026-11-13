#import "/typst-components/src/lib.typ": consegna, esempi, nota, template

#consegna[Dato un intero `n` maggiore o uguale a `0`, calcola e stampa la somma degli interi da `0` a `n`, estremi inclusi.]

#nota[
  `n` deve essere *incluso* nella somma: con `n = 5` la somma è `15`
]

#template[
  ```python
  n = 10

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`n = 0`], [`0`], [L'intervallo contiene solo lo `0`, che non cambia la somma.]),
  ([`n = 5`], [`15`], [`0 + 1 + 2 + 3 + 4 + 5 = 15`.]),
  ([`n = 100`], [`5050`], [La somma di tutti gli interi da `0` a `100`.]),
))
