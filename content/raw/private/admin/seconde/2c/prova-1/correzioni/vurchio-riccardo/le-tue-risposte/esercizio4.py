l=[2, 4 ,5, 6, 8]
a=6
indice_trovato= -1
for i in range(len(l)):
    if l[i]==a and indice_trovato== -1:
        indice_trovato=i
if indice_trovato != -1:
    print("Trovato all'indice N")
   