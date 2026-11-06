#import "/typst-components/src/lib.typ": checklist

Per ciascun esercizio scrivi un file separato (`esercizio1.py`, `esercizio2.py`, `esercizio3.py`), eseguilo e verifica il risultato con gli esempi. Il programma deve stampare *soltanto* il risultato richiesto.

#checklist("Prima di consegnare", (
  [Il programma stampa *solo* il risultato richiesto, senza messaggi in più?],
  [Hai provato i casi limite: `n = 0`, lista vuota e così via?],
  [I nomi delle variabili sono chiari e il codice è rientrato in modo corretto?],
  [Ogni esercizio di programmazione è nel suo file `esercizio1.py`, `esercizio2.py`, `esercizio3.py`?],
))

E' *fondamentale* che il programma funzioni per qualsiasi input gli venga dato. Gli esercizi che sono strutturati per funzionare solo su input specifici verranno valutati *0 punti*. Ad esempio, se venisse chiesto di stampare tutti i numeri contenuti in una lista, uno ad uno, allora il seguente esercizio varrebbe zero punti:
```python
l = [1,2,3]
print(l[0])
print(l[1])
print(l[2])
```
