l = []
b = 0  
if l == []:
 print ("Lista vuota!") 

else:
    massimo = l[0]
    minimo = l[0]
    while b < len(l):
        if l[b] > massimo:
            massimo = l[b]
        if l[b]< minimo:
            minimo = l[b]
        b = b + 1

    print(massimo)
    print(minimo)

