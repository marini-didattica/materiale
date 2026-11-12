lista=[1,2,3,2,1]
d=(len(lista))-1
palindroma=True
for i in range (len(lista)//2):
    if lista[i]==lista[d]:
        palindroma=True
    else:
        palindroma=False
        break
    d=d-1
print(palindroma)