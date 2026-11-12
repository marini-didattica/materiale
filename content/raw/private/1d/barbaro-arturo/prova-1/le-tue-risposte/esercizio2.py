l=[-9,5,-6]
i=0
a=True
while i<len(l):
    if l[i]<0 and not l[i]>=0: 
        print("False")
        a=False
    i=i+1
    break

if a==True:
    print("True")