l = [4, 6, 2, 9]
c=[]
a = 10
b = 1
V=True
if l==c:
    V=True
else:
    for i in range(len(l)):
            if a>=l[i] and b<=l[i]:
                V=True
            else:
                      V=False
        


print(V)