#import "/typst-components/src/lib.typ": callout, checklist, consegna, esempi, griglia-punteggi, nota, quesito, template, testata, righe-risposta

Per ciascun esercizio scrivi un file separato (`esercizio1.py`, `esercizio2.py`,
`esercizio3.py`), eseguilo e verifica il risultato con gli esempi. Il programma deve stampare
*soltanto* il risultato richiesto e non deve chiedere dati con `input()`: usa le variabili già
presenti nel template.

#checklist("Prima di consegnare", (
  [Il programma stampa *solo* il risultato richiesto, senza messaggi in più?],
  [Hai provato i casi limite: lista vuota, valore assente, numeri negativi?],
  [I nomi delle variabili sono chiari e il codice è rientrato in modo corretto?],
  [Ogni esercizio è nel suo file `esercizio1.py`, `esercizio2.py`, `esercizio3.py`?],
))

È *fondamentale* che il programma funzioni per qualsiasi input gli venga dato. Gli esercizi
strutturati per funzionare solo su un input specifico verranno valutati *0 punti*. Ad esempio,
se venisse chiesto di contare le occorrenze di `a` nella lista `l`, il seguente programma
varrebbe zero punti:
```python
l = [4, 7, 4, 1, 4]
a = 4
print(3)
```
