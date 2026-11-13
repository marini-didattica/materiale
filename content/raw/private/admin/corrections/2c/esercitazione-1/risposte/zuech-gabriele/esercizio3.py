l = [1,2,3,2,1]
p=0
pl=False
a=len(l)-1
for i in range(len(l)//2):
    if l[i]==l[a]:
        p+=1
    a=a-1
if p==len(l)//2:
    pl=True
if pl:
    print(pl)
else:
    print(pl)
