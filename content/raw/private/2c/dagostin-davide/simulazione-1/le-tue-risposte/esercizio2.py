L = [1, 2, 3, 4, 5]
L0 = []

for i in range(len(L),0,-1):
    L0.append(L[i-1])
print(L0)