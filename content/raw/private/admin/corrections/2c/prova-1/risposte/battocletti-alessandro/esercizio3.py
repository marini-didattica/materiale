l=[1, 2, 2, 5]
b=True
i=1
while i<len(l):
    if l[i]<l[i-1]:
        b=False
    i=i+1
print (b)
if len(l)==0:
        print(0)
