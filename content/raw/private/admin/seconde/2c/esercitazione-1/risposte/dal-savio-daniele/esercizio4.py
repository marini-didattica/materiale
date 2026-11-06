l = [1, 2, 3, 4, 5]
n=0
s=0
for i in range (len(l)):
    if (l[i])>n:
        n=(l[i])
        for j in range (len(l)):
            if (l[j])>n and n!=s:
                s=(l[j])
print(s)