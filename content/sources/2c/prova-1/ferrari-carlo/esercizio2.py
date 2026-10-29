l=[4,6,2,9]
a=10
b=1
t=0
valori=True
if a<b:
    t=a
    a=b
    b=t
for i in range(len(l)):
    if l[i]>a or l[i]<b:
        valori=False
        break
    else:
        valori=True
print(valori)

