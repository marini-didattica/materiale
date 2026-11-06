lista = [1,2,3,4,5,]
n = len(lista)
for i in range(n // 2):
    temp = lista[i]
    lista[i] = lista[n - 1 -i]
    lista[n - 1 - i] = temp
print(lista)