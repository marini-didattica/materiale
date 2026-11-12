l=[4,6,2,9]
a=10
b=1
i=0

for i in range(len(l)):
    if l[i] <= a and l[i] >= b:
        i=i+1
        print(True)
    else:
        print(False)
        break
