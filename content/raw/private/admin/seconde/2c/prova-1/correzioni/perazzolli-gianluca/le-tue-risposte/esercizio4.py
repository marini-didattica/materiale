l  = [5, 8, 2, 9, 8]
a = 8
trovato=False
indice=-1
i=0
for i in l:
    indice += 1
    if i == a:
        trovato=True
        break
if trovato == True:
    print("Trovato all'indice", indice, ".")
elif trovato == False:
    print("Non trovato")