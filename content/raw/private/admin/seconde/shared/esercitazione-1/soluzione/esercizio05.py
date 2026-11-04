l = [3, -2, 0, -7, 5]

# Scorre la lista con un indice.
# Quando trova un negativo lo rimuove; altrimenti passa all'elemento successivo.
i = 0
while i < len(l):
    if l[i] < 0:
        l.pop(i)       # il successivo prende il posto dell'elemento rimosso
    else:
        i += 1         # lo zero è >= 0 e quindi viene mantenuto

print(l)       # stampa soltanto la lista senza numeri negativi
