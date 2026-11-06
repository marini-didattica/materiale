l=[1,2,3,4,5]
m=[]
for i in range(len(l)):
    if i%2==0:
        m.append(l[i])
    else:
        i+=1
print(m)