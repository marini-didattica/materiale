l = [3, -1, 0, 7]
b = False
for i in range(len(l)): #scorre la lista
     if l[i] < 0:    #serve per trovare i numeri negativi nella lista
         b = True    #con l'if se trova il numero negativo poi rende b vera e quindi sono presenti numeri negativi
print(b)  # dice che è vero che ci sono numeri negativi