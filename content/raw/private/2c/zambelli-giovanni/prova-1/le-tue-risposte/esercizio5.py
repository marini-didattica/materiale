l=[1,4,6,4,1]
c=0
for i in range (len(l)//2):
    if l[i]==l[i+i]:
        c=c+1
if c==i+1:
    print("True")
else:
    print("False")