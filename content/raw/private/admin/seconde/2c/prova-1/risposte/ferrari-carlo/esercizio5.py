l=[1,2,3,2,1]
palindroma=False
if l!=[]:
    palindroma=False
else:
    palindroma=True     
for i in range(len(l)):
    a=i-(i+1+i)
    if l[i]==l[a]:
        palindroma=True
    else:
        palindroma=False
        break

        
print(palindroma)