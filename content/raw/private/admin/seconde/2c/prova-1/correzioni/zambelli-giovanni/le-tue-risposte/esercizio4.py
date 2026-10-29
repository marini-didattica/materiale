l=[3,5,4,32,6,7,]
a=6
b=False
c=("non trovato")
for i in range (len(l)):
    if l[i]==a:
        b=True
        c=i
        break
print (b,c)
