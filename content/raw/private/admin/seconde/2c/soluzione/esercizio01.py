l = [4, 7, 10, 3]

n = len(l)
somma = 0
for i in range(n):
    somma = somma + l[i]

if n == 0:
    print(0)
else:
    print(somma / n)

# La somma è 4 + 7 + 10 + 3 = 24 e n = 4, quindi la media è 24 / 4 = 6.0.
# Con la lista vuota si evita la divisione per zero stampando 0.
