l = [4, 6, 2, 9]
a = 10
b = 1
dentro=[]
condizione=True
for i in range(len(l)):
    if a>l[i] and b<l[i]:
        condizione=True
    elif l==[]:
        condizione=True
    elif a<l[i] and b>l[i]:
        condizione=True
    else:
        condizione=False
print(condizione)