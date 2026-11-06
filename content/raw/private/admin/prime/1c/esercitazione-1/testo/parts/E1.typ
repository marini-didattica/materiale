#import "/typst-components/src/lib.typ": consegna, esempi, nota, template

#consegna[Dato un intero `n` maggiore o uguale a `0`, conta i numeri pari fra `0` e `n`, estremi inclusi, e stampa un solo numero: il conteggio trovato.]

#nota[
  Viene richiesto di contare _quanti numeri pari_ ci sono fra 0 e n, non di stamparli. Ricorda che un numero è pari se `x % 2 == 0`.
]

#template[
  ```python
  n = 7

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`n = 0`], [`1`], [L'unico numero dell'intervallo è `0`, che è pari.]),
  ([`n = 7`], [`4`], [I pari sono `0, 2, 4, 6`.]),
  ([`n = 10`], [`6`], [I pari sono `0, 2, 4, 6, 8, 10`: anche `n` va contato.]),
))
