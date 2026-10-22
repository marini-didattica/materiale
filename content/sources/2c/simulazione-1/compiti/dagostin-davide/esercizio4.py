L=[1,2,3,4,5,5]
max=L[0]
for i in range(len(L)-1):
    if L[i]>max:
        max=L[i]
L.pop(max)
for j in L:
    if j>max:
        max=j
print(max)


