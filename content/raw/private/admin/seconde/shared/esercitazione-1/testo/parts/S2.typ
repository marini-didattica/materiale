#import "/typst-components/src/lib.typ": righe-risposta

```python
a = [4, 8, 6, 10]
b = 0
for x in a:
    b = b + x
c = b / len(a)
for x in a:
    if x > c:
        print(x)
```

#righe-risposta(3)
