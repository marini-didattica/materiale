l = [5, 8, 2, 9, 8]
a = 8
trovato=False
for i in range(len(l)):
    if l[i]==a:
        trovato=True
        break
if trovato==True:
    print("Trovato all'indice",i)
else:
    print("Non trovato")