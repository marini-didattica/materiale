trovato=False


l=[1,2,3,4,5]
indice=-1

a=5
for i in l:
    if i==a:
        trovato=True
        
    indice+=1

if trovato==True:
    print("Trovato all'indice ",indice)


    