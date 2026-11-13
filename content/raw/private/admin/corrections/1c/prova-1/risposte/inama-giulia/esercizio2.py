l = [3, 5, 7, 12]
a = 7
i = 0
trovato = False
while i < len(l):
    if l[i] == a:
        trovato == True
        break
    i = i + 1
print(trovato)