#import "/typst-components/src/lib.typ": consegna, esempi, nota, template

#consegna[Data la lista `l`, stampa `True` se è ordinata in senso *crescente*, cioè se ogni
  elemento è maggiore o uguale al precedente, altrimenti stampa `False`. Una lista vuota o con
  un solo elemento è considerata ordinata.]

#nota[
  Non usare `sorted()`: il controllo va fatto scorrendo la lista.
]

#template[
  ```python
  l = [1, 2, 2, 5]

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`l = [1, 2, 2, 5]`], [`True`], [I valori non diminuiscono mai.]),
  ([`l = [1, 3, 2, 4]`], [`False`], [`3` è seguito da `2`, quindi l'ordine si rompe.]),
  ([`l = []`], [`True`], [Non c'è nessuna coppia da confrontare.]),
))