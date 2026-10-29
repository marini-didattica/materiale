l = [1, 2, 2, 5]
i=0
a=1
ordine=True
while i<(len(l)-1):
    if l[a]>l[i]:
        ordine=True
    else:
        ordine=False
    i=i+1
    a=a+1
print(ordine)