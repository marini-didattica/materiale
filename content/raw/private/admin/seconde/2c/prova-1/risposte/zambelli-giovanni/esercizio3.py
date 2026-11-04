l=[2,4,6,9]
c=False
for i in range (len(l)):
    if l[i]<=l[i-1] and i!=0:
        c=True
    else:
        c=False
        break
print(c)

        