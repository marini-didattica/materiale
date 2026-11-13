lista=[4,7,4,1,4]
i=0
x=4
somma=0
while i<len(lista):
    if lista[i]==x:
        somma=somma+1
    if lista[i]==0:
        print("0")
    i=i+1
print(somma)