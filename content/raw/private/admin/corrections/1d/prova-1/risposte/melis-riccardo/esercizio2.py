lista=[3,5,6,-2,-7,9,4]
i=0
positivo=True
while i<len(lista):
    if lista[i]<0:
        positivo=False
        break
    else:
        i=i+1
if positivo==True:
    print(True)
else:
    print(False)
