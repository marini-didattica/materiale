#import "/typst-components/src/lib.typ": righe-risposta

```python
a = [4, 9, 1, 7]
b = a[0]
c = a[0]
i = 1
while i < len(a):
    if a[i] > b:
        b = a[i]
    if a[i] < c:
        c = a[i]
    i = i + 1
print(b)
print(c)
```

#righe-risposta(3)
