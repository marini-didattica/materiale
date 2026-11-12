lista=[3,8,1,5]
i=0
max=lista[0]
min=lista[0]
if lista==[]:
    print(0)
else:
    while i<len(lista):
        if lista[i]>max:
            max=lista[i]
        elif lista[i]<min:
            min=lista[i]
        i=i+1
    print(max)
    print(min)