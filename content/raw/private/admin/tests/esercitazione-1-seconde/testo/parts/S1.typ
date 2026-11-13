#import "/typst-components/src/lib.typ": righe-risposta

```python
a = [2, 4, 5, 3, 8]
b = True
i = 1
while i < len(a):
    if a[i] < a[i - 1]:
        b = False
    i = i + 1
print(b)
```

#righe-risposta(3)
