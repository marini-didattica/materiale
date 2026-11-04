l=[-3, -1, -7]
max=l[0]
max2=l[0]
for i in l:
    if i>max:
        max2=max
        max=i
    if max2<i<max:
        max2=i
print(max2)