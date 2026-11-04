l=[1,2,2,5]
ordine=True
a=0
for i in range(len(l)):    
    if i<1:
        a=l[i]
    else:
        if l[i]<a:
            ordine=False
            break
        else:
            ordine=True
            a=l[i]
print(ordine)