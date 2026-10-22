L=[1,2,3,2,1]
Palindroma=True
L1=[]
for i in range(len(L),0,-1):
    L1.append(L[i-1])
for j in range(len(L)):
    if L[j]==L1[j]:
        Palindroma=True
    else:
        Palindroma=False
        break
if (Palindroma):
    print("True")
if not(Palindroma):
    print("False")