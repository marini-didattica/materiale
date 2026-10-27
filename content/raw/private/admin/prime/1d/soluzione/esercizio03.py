l = [7, -3, 12, 0, 5, -8]

n = len(l)
if n == 0:
    print("Lista vuota!")     # lista vuota: non esistono massimo e minimo
else:
    massimo = l[0]       # il primo elemento è il candidato iniziale
    minimo = l[0]
    i = 1                     # riparte dal secondo elemento
    while i < n:
        if l[i] > massimo:
            massimo = l[i]
        if l[i] < minimo:
            minimo = l[i]
        i = i + 1

    print(massimo)       # prima riga: valore massimo
    print(minimo)        # seconda riga: valore minimo

# Inizializzare con 0 sarebbe sbagliato: con una lista di soli numeri negativi
# 0 non appartiene alla lista e diventerebbe il massimo per errore.
# Con un solo elemento massimo e minimo coincidono con quell'elemento.
