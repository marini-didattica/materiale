#import "/typst-components/src/lib.typ": consegna, esempi, nota, template

#consegna[
  Date la lista di interi `l` e il valore `a`, cerca `a` in `l`. Se lo trovi, stampa `Trovato all'indice N`, dove `N` è l'indice della *prima* occorrenza (ossia l'indice minore che contiene il valore `a`). 
Se non lo trovi, stampa `Non trovato`. Il valore `a` può essere un numero o una stringa.
]

#nota[
   Non usare `list.index()` né l'operatore `in`: la ricerca va fatta con un ciclo.
]

#template[
  ```python
  l = [5, 8, 2, 9, 8]
  a = 8

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`l = [5, 8, 2, 9, 8], a = 8`], [`Trovato all'indice 1`], [Si considera la prima occorrenza.]),
  ([`l = [5, 8, 2], a = 4`], [`Non trovato`], [`4` non compare nella lista.]),
  ([`l = [], a = 1`], [`Non trovato`], [La lista è vuota.]),
))