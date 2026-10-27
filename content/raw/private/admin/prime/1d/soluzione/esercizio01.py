l = [5, -2, 8, 0, -7, 3]

n = len(l)               # numero di elementi della lista
somma = 0                # accumulatore: parte da 0
i = 0                    # indice dell'elemento corrente
while i < n:             # scorre tutta la lista
    if l[i] > 0:         # considera solo gli elementi maggiori di zero
        somma = somma + l[i]
    i = i + 1            # passa all'elemento successivo

print(somma)             # stampa soltanto la somma dei positivi

# Con l'elemento 0 il controllo 0 > 0 è falso: lo zero non viene sommato.
# Con l = [] oppure con soli elementi negativi la somma resta 0.
