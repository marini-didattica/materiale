l = [5, 8, 2, 9, 8]
a = 8

n = len(l)
indice = -1
for i in range(n):
    if l[i] == a:
        indice = i
        break

if indice == -1:
    print("Non trovato")
else:
    print("Trovato all'indice", indice)

# indice = -1 significa che il valore non è stato trovato.
# Il break interrompe il ciclo alla prima occorrenza: con due 8 viene
# considerato quello all'indice 1, non quello all'indice 4.
# Con la lista vuota il ciclo non parte e indice resta -1.
