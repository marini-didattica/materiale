#import "/typst-components/src/lib.typ": consegna, esempi, template

#consegna[Inverti la lista `l` *senza usare una lista ausiliaria*. Alla fine stampa `l`.]

#template[
  ```python
  l = [1, 2, 3, 4, 5]

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`l = [1, 2, 3, 4, 5]`], [`[5, 4, 3, 2, 1]`], [Gli estremi vengono scambiati fino al centro.]),
  ([`l = [1, 2]`], [`[2, 1]`], [Un solo scambio.]),
  ([`l = [7]`], [`[7]`], [Una lista con un solo elemento resta uguale.]),
))
