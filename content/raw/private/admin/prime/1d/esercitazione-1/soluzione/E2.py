n = 10

somma = 0              # accumulatore della somma
x = 0                  # primo numero da sommare
while x <= n:          # somma tutti gli interi da 0 a n, estremi inclusi
    somma += x
    x += 1             # passa al numero successivo

print(somma)           # stampa soltanto la somma finale
