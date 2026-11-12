l = [7, -3, 12, 0, 5, -8]

if len(l) == 0:
    print ("lista vuota!")
else:
    massimo= l[0]
    minimo= l[0]
    i=1

while i<len(l):
    if l[i] > massimo:
        massimo = l[i]
    if l[i] < massimo:
        minimo = l[i]
    i=i+1

print (massimo)
print (minimo) 