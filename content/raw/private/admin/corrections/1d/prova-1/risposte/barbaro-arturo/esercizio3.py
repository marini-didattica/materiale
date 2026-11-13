l=[1,-1,0]
i=1
a=l[0]
b=l[0]
while i<len(l):
    if l[i]>a:
        a=l[i]
        i=i+1
    if l[i]<b:
        b=l[i]
        i=i+1
   
if i>len(l):
    print(a)
    print(b)

if i<len(l):
    print("Lista vuota!")
    