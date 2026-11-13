#import "/typst-components/src/lib.typ": consegna, esempi, nota, template

#consegna[Modifica `l` rimuovendo tutti i numeri negativi. Alla fine stampa `l`. Lo zero va mantenuto.]

#nota[Puoi modificare la lista originale oppure costruirne una nuova, purché alla fine `l` contenga solo i valori non negativi.]

#template[
  ```python
  l = [3, -2, 0, -7, 5]

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`l = [3, -2, 0, -7, 5]`], [`[3, 0, 5]`], [Vengono eliminati `-2` e `-7`; lo `0` resta.]),
  ([`l = [-1, -2, -3]`], [`[]`], [Tutti gli elementi sono negativi.]),
  ([`l = [0, 1, 2]`], [`[0, 1, 2]`], [Non ci sono numeri negativi da rimuovere.]),
))
