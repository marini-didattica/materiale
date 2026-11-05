l = [3, 8, 1, 5]

n = len(l)
tutti = True             # ipotizza che tutti gli elementi siano positivi
i = 0
while i < n:
    if l[i] <= 0:        # un elemento non positivo basta per smentire l'ipotesi
        tutti = False
    i = i + 1

print(tutti)             # stampa soltanto True oppure False

# Con la lista vuota il ciclo non viene eseguito e il programma stampa True:
# non esiste nessun elemento che violi la condizione.
# Attenzione: 0 <= 0 è vero, quindi lo zero rende il risultato False.
