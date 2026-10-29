l = [5, 8, 2, 9, 8]
a = 1
trovato=0
if l==[]:
        print("non trovato")
else:
    for i in range (len(l)):
        if (l[i])==a:
            trovato=1
            break
        


    if trovato==1:
        print("elemento trovato alla posizione",i,)
    else:
        print("elemento non trovato")
                 




    