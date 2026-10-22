l = [1, 2, 3, 4, 5]

# Due indici partono dagli estremi e si avvicinano fino al centro.
# Lo scambio avviene direttamente nella lista, senza liste ausiliarie.
i = 0
j = len(l) - 1
while i < j:
    temp = l[i]
    l[i] = l[j]
    l[j] = temp
    i += 1
    j -= 1

print(l)       # stampa soltanto la lista invertita
