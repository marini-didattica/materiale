#import "/typst-components/src/lib.typ": consegna, esempi, nota, template

#consegna[Data la lista di numeri `l`, calcola e stampa la *media* dei suoi elementi. Se la
  lista è vuota, stampa `0`.]

#nota[
  La media è la somma degli elementi divisa per il numero di elementi. Calcola la somma con
  un ciclo e usa `len(l)` per il conteggio: non usare `sum()`. Attenzione al caso limite della lista vuota.
]

#template[
  ```python
  l = [4, 7, 10, 3]

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`l = [4, 7, 10, 3]`], [`6.0`], [La somma è `24`, divisa per `4` elementi.]),
  ([`l = [2, 3]`], [`2.5`], [La media può essere un numero decimale.]),
  ([`l = []`], [`0`], [La media non è definita: stampa `0` per convenzione.]),
))