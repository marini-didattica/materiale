num= [7, 13,16,8]
i=0
massimo=0
minimo=0
lista_vuota=True
while i<len(num):
    if lista_vuota==True:
        minimo=num[i]
        massimo=num[i]
    if num[i]>=massimo:
        massimo=num[i]
        lista_vuota=False
    if num[i]<=minimo:
        minimo=num[i]
        lista_vuota=False
    i+=1

if lista_vuota==False:
    print(massimo)
    print(minimo)
if lista_vuota==True:
    print("Lista vuota!")