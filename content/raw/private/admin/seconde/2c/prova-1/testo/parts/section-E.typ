#import "/typst-components/src/lib.typ": callout, checklist

Per ciascun esercizio scrivi un file separato (`esercizio1.py` … `esercizio5.py`), eseguilo e
verifica il risultato con gli esempi. Il programma deve stampare *soltanto* il risultato
richiesto e non deve chiedere dati con `input()`: usa le variabili già presenti nel template.

#checklist("Prima di consegnare", (
  [Il programma stampa *solo* il risultato richiesto, senza messaggi in più?],
  [Hai provato i casi limite: lista vuota, un solo elemento, valori duplicati, numeri negativi?],
  [I nomi delle variabili sono chiari e il codice è rientrato in modo corretto?],
  [Ogni esercizio è nel file indicato nell'intestazione, con il nome corretto?],
))

È *fondamentale* che il programma funzioni per qualsiasi input gli venga dato. Gli esercizi
strutturati per funzionare solo su un input specifico verranno valutati *0 punti*. Ad esempio,
se venisse chiesto di calcolare la media della lista `l`, il seguente programma varrebbe zero
punti:
```python
l = [4, 7, 10, 3]
print(6.0)
```

#callout("Funzioni e operatori non consentiti")[
  - Sono vietati `sum()`, `max()`, `min()`, `sorted()`, `reversed()`, `all()`, `any()`,
    `list.reverse()`, `list.sort()`, `list.count()` e `list.index()`.
  - Sono consentiti `len()`, `append()`, `pop()`, `remove()` e i normali cicli.
  - Nell'esercizio *L'elemento è nella lista?* non usare nemmeno l'operatore `in`: la ricerca va
    fatta con un ciclo.
]