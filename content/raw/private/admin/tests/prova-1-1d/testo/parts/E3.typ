#import "/typst-components/src/lib.typ": consegna, esempi, nota, template

#consegna[Data la lista di interi `l`, trova il valore *massimo* e il valore *minimo* e
  stampali su due righe: prima il massimo, poi il minimo. Se la lista è vuota, stampa `Lista vuota!`. La lista può contenere numeri negativi.]

#nota[
  Inizializza massimo e minimo con il primo elemento `l[0]`, non con `0`: se tutti i numeri
  fossero negativi, `0` sarebbe un valore sbagliato. Parti dall'indice `1` per il ciclo. Non
  usare `max()` né `min()`.
]

#template[
  ```python
  l = [7, -3, 12, 0, 5, -8]

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`l = []`], [`0`], [La lista è vuota: non esiste né un massimo né un minimo.]),
  (
    [`l = [4]`],
    [`4`
      #linebreak()
      `4`],
    [Con un solo elemento, massimo e minimo coincidono.],
  ),
  (
    [`l = [7, -3, 12, 0, 5, -8]`],
    [`12`
      #linebreak()
      `-8`],
    [Il valore più grande è `12`, il più piccolo è `-8`.],
  ),
))
