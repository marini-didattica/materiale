l=[1,2,3,2,1]
m=[]
a=False
c=0
for i in range(len(l),0,-1):
    m.append(l[i-1])
      
print(l)
print(m)   
for h in range(len(l)):
    if l[h]==m[h]:
        c+=1
    else:
        a=False
if c==len(l):
    a=True
print(a)