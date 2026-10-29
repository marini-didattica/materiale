l = [1, 3, 2, 5]
V=True

for i in range(len(l)):
    if i==0:
        V=True
        if l[i]<=l[i-1]:
            V=False
        else:V=True

print(V)