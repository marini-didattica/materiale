l=[1,2,1]
l1=[]
palindromo=False
for i in range(len(l)-1,-1,-1):
    l1.append(l[i])
if l1==l:
    palindromo=True
        
        
if palindromo==True:
    print("è palindromo")
else:
    print("no")