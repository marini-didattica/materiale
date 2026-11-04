l=[1,2,3,2,1]
i=0
j=len[i]-1
palindroma=True

for i in range(len()):
    if l[i] != l[j]:
        palindroma=False
        l[i]+=1
        l[j]-=1
    else:
        palindroma=True

print(palindroma)

