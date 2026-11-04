#import "/typst-components/src/lib.typ": callout, checklist, consegna, esempi, griglia-punteggi, nota, quesito, template, testata, righe-risposta

Le variabili `a` e `b` rappresentano gli estremi di un intervallo. Si può assumere che `a < b`. Cosa stampa il programma?
```python
l = [4, 6, 2, 9]
a = 1 
b = 10

i = 0
ok = True
while i < len(l):
    if l[i] < a or l[i] > b:
        ok = False
    i = i + 1
print(ok)
```

#righe-risposta(3)
