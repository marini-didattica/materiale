lista=[4,7,10,3]
somma=0
media=0
vuota=[]
for i in range (len(lista)):
    if lista==vuota:
        media=0
        break
    somma=somma+lista[i]
    media=somma/(len(lista))
print(media)