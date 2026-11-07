lista=[3,4,6]
max=lista[0]
max2=lista[0]
for i in lista:
    if i>max2:
        max2=max
    if i>max:
        max=i
     
    elif max==i:
        max=max2
print(max)
print(max2)
