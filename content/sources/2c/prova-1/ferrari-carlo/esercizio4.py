l=[5,8,2,9,8]
a=8
c=False
for i in range(len(l)):
    if l[i]==a:
        c=True
        break
    else:
        c=False
if c==False:
    print("non trovato")
elif c==True:
    print("il numero",a," e stato trovato a indice",i)