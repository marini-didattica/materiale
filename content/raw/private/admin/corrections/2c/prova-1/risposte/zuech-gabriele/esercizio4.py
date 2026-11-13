l = [5, 8, 2, 9, 8]
a = 8
for i in range(len(l)):
    if a==l[i]:
        print("Trovato al'indice",i)
        quit()
print("Non trovato")
