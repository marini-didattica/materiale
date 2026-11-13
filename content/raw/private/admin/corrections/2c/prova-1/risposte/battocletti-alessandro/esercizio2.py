l=[4, 6, 2, 9]
a=3
b=10
numeri_in = True
if a>b:
   a,b=a,b
for x in l:
    if not(a<=x<=b):
        numeri_in=False
        break
print(numeri_in)



