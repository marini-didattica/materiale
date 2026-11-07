l=[1,2,3,4,5]
for i in range(len(l),0,-1):
    l.append(l[i-1])
for c in range(len(l)):
        if c>4:
              break
        c=c-c
        l.remove(l[c])
        
print(l)   
    
    
    