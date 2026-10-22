lista=[1,2,3,2,1]
palindromo=True
d=len(lista)-1
s=0
for i in range (len(lista)):
    if lista[d]!=lista[s]:
        palindromo=False
    else:
        palindromo=True
    d=d-1
    s=s+1
print(palindromo)