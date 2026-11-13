#import "/typst-components/src/lib.typ": righe-risposta

```python
a = [4, 9, 1, 9]
b = a[0]
c = 1
i = 1
while i < len(a):
    if a[i] > b:
        b = a[i]
        c = 1
    elif a[i] == b:
        c = c + 1
    i = i + 1
print(c)
```

#righe-risposta(3)
