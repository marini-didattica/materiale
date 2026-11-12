l = [3, 5, 7, 12]
a = 7
i = 0
risultato = False

while i < len(l):
    if a == l[i]:
        risultato = False
    else:
        risultato = True
    i = i + 1
print (risultato)
