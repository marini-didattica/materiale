l = [5, 8, 2, 9, 8]
a = 8
Trovato=False
for i in range(len(l)):
    if l[i]==a:
        Trovato=True
        break
if (Trovato):
    print("Trovato all'indice", i)
else:
    print("Non trovato")