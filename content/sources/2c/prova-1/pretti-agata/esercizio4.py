l = [5, 7, 2, 9, 11, 8, 10]
a = 8
trovato=0
for i in range(len(l)):
    if l[i]==a:
        trovato=1
        break
    else:
        trovato=0

if trovato==1:
    print("trovato all'indice ",i )
else:
    print("non trovato")