l=[3,6,8,9]
n=0
somma=0
if len(l)>0:
    for i in l:
        somma=somma+i
        n+=1
    media=somma/n
else:
    media=0
print(media)
    
