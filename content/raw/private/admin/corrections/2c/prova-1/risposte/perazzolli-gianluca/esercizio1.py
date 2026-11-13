l = [4, 7, 10, 3]
somma=0
if len(l)==0:
    media=0
else:
    for i in l:
        somma+=i
    media=somma/len(l)
print(media)