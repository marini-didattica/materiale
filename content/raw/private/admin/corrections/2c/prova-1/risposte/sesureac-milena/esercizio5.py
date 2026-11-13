l=[1,2,3,2,1]

for s in range (len(l)):
    d=len(l)//2
    temp=l[s]
    l[s]=l[d]
    l[d]=temp
if d==2:
    print(True)
else:
    print(False)