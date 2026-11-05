l = [1, 2, 3, 2, 1]

n = len(l)
palindroma = True
for i in range(n // 2):
    if l[i] != l[n - 1 - i]:
        palindroma = False
        break

print(palindroma)

# i va da 0 fino alla metà della lista esclusa: si confrontano le coppie
# simmetriche (primo con ultimo, secondo con penultimo, ...).
# n - 1 - i è l'indice dell'elemento simmetrico a i.
# Con lista vuota o con un solo elemento range(n // 2) è vuoto e stampa True.
