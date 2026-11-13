l = [1, 2, 2, 5]

n = len(l)
ordinata = True
for i in range(1, n):
    if l[i] < l[i - 1]:
        ordinata = False

print(ordinata)

# Si confronta ogni elemento con quello che lo precede.
# Gli elementi uguali consecutivi non rompono l'ordine: serve l[i] < l[i - 1],
# non l[i] <= l[i - 1].
# Con una lista vuota o con un solo elemento il ciclo non parte e stampa True.
