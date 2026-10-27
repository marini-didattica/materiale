l = [4, 6, 2, 9]
a = 10
b = 1

# porta a nel limite inferiore e b nel limite superiore
if a > b:
    t = a
    a = b
    b = t

n = len(l)
tutti = True
for i in range(n):
    if l[i] < a or l[i] > b:
        tutti = False

print(tutti)

# Dopo lo scambio l'intervallo è [1, 10] e tutti gli elementi vi appartengono.
# Con la lista vuota il ciclo non parte e il programma stampa True.
