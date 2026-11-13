lista=[1,2,2,5]
i=0
a=1
crescente=True
while i<(len(lista)-1):
    if lista[a]<lista[i]:
        crescente=False
        break
    else:
        crescente=True
    i=i+1
    a=a+1
print(crescente)