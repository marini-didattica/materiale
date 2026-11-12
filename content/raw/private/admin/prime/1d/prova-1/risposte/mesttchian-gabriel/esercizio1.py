l = [5, -2, 8, 0, -7, 3]
i = 0
somma = 0
while i < len(l):
    if l[i] >= 0:
        somma = somma + l[i]
    i = i + 1
print(somma)
