l=[7, -3, 12, 0, 5, -8]
massimo=l[0]
minimo=l[0]
z=0
y=0
while z<=len[l]:
    z=z+1
    y=y+1
if l[z]<l[y]:
    massimo=l[y]   
elif l[z]>l[y]:
    minimo=l[y]

print (massimo)
print (minimo)