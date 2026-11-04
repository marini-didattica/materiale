#import "/typst-components/src/lib.typ": callout, checklist, consegna, esempi, griglia-punteggi, nota, quesito, template, testata, righe-risposta

```python
l = [4, 7, 2, 9, 5]
n = len(l)
s = 0
i = 0
while i < n:
    if l[i] % 2 == 1:
        s = s + l[i]
    i = i + 1
print(s)
```

#righe-risposta(3)
