l=[1, 2 ,3, 4, 5]
max=0
max2=0
for i in l:
    if i>max:
        max2=max
        max=i
    if max2<i<max:
        max2=i
print(max2)
    



