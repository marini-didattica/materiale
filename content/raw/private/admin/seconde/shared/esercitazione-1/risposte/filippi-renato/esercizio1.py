l=[1,2,3,4,5,6,7]

selezione=[]

for i in range(len(l)):
    if l[i]%2 != 0:
        selezione.append(l[i])

print(selezione)
