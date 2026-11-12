l=[10, 20, 30, 40, 50]
numero=0
somma=0
if len(l)>0:
    for i in l:
        somma=somma+i
        numero+=1
    media=somma/numero
else:
    media=0
print(media)