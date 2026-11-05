l = [3, 5, 7, 12]
a = 1
b = 10

# Se a è maggiore di b, i due limiti sono invertiti:
# li scambio usando una variabile temporanea.
# Dopo questo controllo a è sempre il limite inferiore e b quello superiore.
if a > b:
    temp = a
    a = b
    b = temp

tutti_dentro = True             # ipotizza che tutti gli elementi siano nell'intervallo
i = 0                           
while i < len(l):               # scorre tutti gli elementi della lista
    x = l[i]               # elemento corrente
    if x < a or x > b:          # x è fuori dall'intervallo [a, b]
        tutti_dentro = False
        break                   # un solo elemento fuori basta: esce dal ciclo
    i += 1                      # passa all'elemento successivo

print(tutti_dentro)             # stampa soltanto True oppure False
