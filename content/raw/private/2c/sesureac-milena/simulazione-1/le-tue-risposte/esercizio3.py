l=[1,2,3,2,1]

palindroma=True
l1=[]
for i in range(len(l),0,-1):
    l1.append(l[i-1])
for t in range(len(l)):
    if l[t]==l1[t]:
        palindroma=True
    else:
        palindroma=False
        break
if (palindroma):
    print("True")
if not(palindroma):
    print("False")
