l=[1, 2, 3, 2, 1]
l1=[]
palindromo=False
for i in range(len(l)-1, -1, -1):
    l1.append(l[i])
if l==l1:
    palindromo=True
print(palindromo)