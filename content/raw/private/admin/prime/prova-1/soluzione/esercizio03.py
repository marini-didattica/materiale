l = [3, 8, 0, -4, 7, 10]

conteggio = 0        # quanti numeri pari sono stati trovati
i = 0                # indice dell'elemento corrente
while i < len(l):    # scorre tutta la lista
    if l[i] % 2 == 0:  # il resto della divisione per 2 è 0: l'elemento è pari
        conteggio += 1
    i += 1           # passa all'elemento successivo

print(conteggio)     # stampa soltanto il conteggio finale

# Con lista vuota stampa 0.
# 0 è pari (0 % 2 == 0) e anche i negativi pari lo sono (-4 % 2 == 0 in Python).
