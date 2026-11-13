lista=[3,5,7,12]
i=0
x=7
trovato=False
while i<len(lista):
    if lista[i]==x:
        trovato=True
        break
    if lista[i]==0:
        trovato=False
    i=i+1
print(trovato)