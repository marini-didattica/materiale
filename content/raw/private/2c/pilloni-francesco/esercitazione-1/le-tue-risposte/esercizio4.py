l=[1,2,3,4,5]
max=l[0]
for i in range(len(l)-1):
    if l[i]>=max:
        max=l[i]
l.pop(max)
for t in l:
    if t>max:
        max=t
print(max)


