#import "/typst-components/src/lib.typ": righe-risposta

```python
a = [4, 9, 1, 7]
b = 0
i = 1
while i < len(a):
    if a[i] > a[b]:
        b = i
    i = i + 1
print(b)
```

#righe-risposta(3)
