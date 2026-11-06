l = [1, 2, 3, 2, 1]
e=0
c=True
b=False

for i in range(len(l)//2,-1,-1):
    for a in range(len(l)//2):
        if l[i]==l[a]:
            e=c
        else:
            e=b
            break

print(e)