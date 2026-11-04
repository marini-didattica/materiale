#import "/typst-components/src/lib.typ": callout, checklist

Per ciascun esercizio scrivi un file separato (`esercizio1.py` … `esercizio5.py`), eseguilo e verifica il risultato con gli esempi. Il programma deve stampare *soltanto* il risultato richiesto.

#checklist("Prima di consegnare", (
  [Il programma esegue senza errori?],
  [Viene stampato *solo* il risultato richiesto, senza messaggi in più?],
  [Hai provato i casi limite: lista vuota, un solo elemento, valori duplicati, numeri negativi?],
  [I nomi delle variabili sono chiari e il codice è rientrato in modo corretto?],
))

E' *fondamentale* che il programma funzioni per qualsiasi input gli venga dato. Gli esercizi che sono strutturati per funzionare solo su input specifici verranno valutati *0 punti*. Ad esempio, se venisse chiesto di stampare tutti i numeri contenuti in una lista, uno ad uno, allora il seguente esercizio varrebbe zero punti:
```python
l = [1,2,3]
print(l[0])
print(l[1])
print(l[2])
```

#callout("Funzioni non consentite")[
  - Sono vietati `sum()`, `max()`, `min()`, `sorted()`, `reversed()`, `all()`, `any()`, `list.reverse()`, `list.sort()`, `list.count()`, `list.index()`.
  - Sono consentiti `len()`, `append()`, `pop()`, `remove()` e i normali cicli.
]
