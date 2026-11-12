l = [1, 2, 3, 2, 1]
cambio=[]
for i in range (len(l)-1,-1,-1):
    cambio.append(l[i])
if cambio==l:
    print(True)
else:
    print(False)