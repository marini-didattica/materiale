n = 7

conteggio = 0          # quanti numeri pari sono stati trovati
x = 0                  # primo numero da controllare
while x <= n:          # considera tutti i numeri da 0 a n, estremi inclusi
    if x % 2 == 0:     # il resto della divisione per 2 è 0: x è pari
        conteggio += 1
    x += 1             # passa al numero successivo

print(conteggio)       # stampa soltanto il conteggio finale
