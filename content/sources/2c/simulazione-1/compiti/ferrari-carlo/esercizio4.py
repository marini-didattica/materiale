l=[1,2,3,4,5]
m1=0
m2=0
for i in range(len(l)):
    if i>=0:
        if l[i]>m1:
            m2=m1
            m1=l[i]
    else:
        if l[i]>m1:
            m1=l[i]

print(m2)