l = [1,2,3,4,5]
for i in range(len(l),0,-1):
    l.append(l[i-1])
for e in range(len(l)//2):
    l.remove(l[e])  
    
print(l)