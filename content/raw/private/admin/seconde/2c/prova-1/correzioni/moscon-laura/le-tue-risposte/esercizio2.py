lista=[4,6,2,9]
a=10
b=1
compreso=True
for e in lista:
    if e>a or e<b:
        compreso=False
        break
print(compreso)