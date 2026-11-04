#import "/typst-components/src/lib.typ": callout, checklist, consegna, esempi, griglia-punteggi, nota, quesito, template, testata, righe-risposta

#consegna[Date una lista di interi `l` e il valore `a`, conta quante volte `a` compare in `l` e stampa un
  solo numero: il numero di occorrenze trovate. Se `a` non compare nella lista, stampa `0`. La
  lista può essere vuota.]

#nota[
  Il programma deve funzionare con qualsiasi valore di `a` e con qualsiasi lista, senza modificarla. Non usare `l.count(a)`: il conteggio va fatto scorrendo la lista.
]

#template[
  ```python
  l = [4, 7, 4, 1, 4]
  a = 4

  # scrivi qui il tuo codice
  ```
]

#esempi((
  ([`l = [], a = 3`], [`0`], [La lista è vuota: non ci sono occorrenze.]),
  ([`l = [1, 2, 3], a = 5`], [`0`], [`5` non compare nella lista.]),
  ([`l = [4, 7, 4, 1, 4], a = 4`], [`3`], [`4` compare tre volte.]),
))
